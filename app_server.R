library(shiny)
library(plotly)
library(stringr)
library(dplyr)
library(reshape2)

# Loading Data Sets

scores_df <- read.csv("../data/seda2022_test_scores.csv")
funding_df <- read.csv("../data/DistrictCostDatabase_2023.csv")

#Data Wrangling ---------------------------------------------------------

# general filtering
scores_df <- select(scores_df, sedaadmin, subject, subgroup, ys_mn19_ol,
                    ys_mn22_ol, ys_chg_ol)
funding_df <- filter(funding_df, year=="2020")

# chart 1 

fundinggap_df <- select(funding_df, year, leaid, fundinggap, enroll, pov)
fundinggap_df <- left_join(scores_df, funding_df, by = c("sedaadmin" = "leaid"))

get_yr_col <- function(df, yr) {
  if(yr == "2019") {
    return(df$ys_mn19_ol)
  } else if(yr == "2022") {
    return(df$ys_mn22_ol)
  } else {
    return(df$ys_chg_ol)
  }
}

get_sort_col <- function(df, sort) {
  if(sort=="pov") {
    return(df$pov)
  } 
  return(df$fundinggap)
}

get_subject <- function(sub){
  if(sub == "mth") {
    return("Math")
  }
  if(sub == "rla") {
    return("Reading Language Arts")
  }
}

get_sort_name <- function(sort) {
  if(sort=="pov") {
    return("Percent Student Poverty")
  }
  return("Difference in estimated actual and reqired spending per student")
}

get_yr_title <- function(sub, yr) {
  if (yr == "Change") {
    return(paste("Funding vs Standard Deviations from mean", get_subject(sub), "score(2019-2022)"))
  }
  return(paste("Funding vs Standard Deviations from mean", get_subject(sub), "score in", yr))
}

# chart 2

# get demographic data
dem_df <- select(scores_df, sedaadmin, subject, subgroup, ys_mn19_ol, ys_mn22_ol, ys_chg_ol)
get_means <- function(df, group) {
  dem_group <- filter(df, subgroup==group)
  dem_group <- select(dem_group, ys_mn19_ol, ys_mn22_ol, ys_chg_ol)
  dem_group <- colMeans(dem_group)
  return(dem_group)
}
demographic <- c(rep("White", 3), rep("Black", 3), rep("Hispanic", 3), rep("Low Income", 3))
year <- rep(c("2019", "2022", "Change"))



# chart 3
fund_df <- select(funding_df, leaid, fundinggap)
dem_fund_df <- left_join(dem_df, fund_df, by = c("sedaadmin" = "leaid"))
get_dem <- function(subject_df) {
  groups <- c("wht", "blk", "hsp", "ecd")
  df <- data.frame(variable=character(), value=double(), Demographic=character())
  for(x in groups) {
    if(x %in% subject_df$subgroup) {
      dem_group <- filter(subject_df, subgroup==x)
      dem_group <- select(dem_group, scores_2019 = ys_mn19_ol, scores_2022 = ys_mn22_ol, change = ys_chg_ol)
      melt <- melt(dem_group)
      melt$Demographic <- x
      df <- rbind(df, melt)
    }
  }
  View(df)
  return(df)
}

get_range <- function(subject_df, dem_range) {
  if(dem_range == "low") {
    df_range <- subject_df %>% filter(between(fundinggap, -20000, -10000))
  } else if(dem_range == "mid_low") {
    df_range <- subject_df %>% filter(between(fundinggap, -10000, -5000))
  } else if(dem_range == "mid") {
    df_range <- subject_df %>% filter(between(fundinggap, -5000, 5000))
  } else if(dem_range == "mid_hi") {
    df_range <- subject_df %>% filter(between(fundinggap, 5000, 10000))
  } else {
    df_range <- subject_df %>% filter(between(fundinggap, 10000, 25000))
  }
  return(df_range)
}





# Server ----------------------------------------------------------------

server <- function(input, output) {
  thematic::thematic_shiny()
  # chart 1
  
  output$funding_plot <- renderPlotly({
    subject_df <- filter(fundinggap_df, subject==input$assessment_type, subgroup=="all")
    yr <- get_yr_col(subject_df, input$year_select)
    sort <- get_sort_col(subject_df, input$sort_type)
    p <- ggplot(data = subject_df, aes(x = sort, y = yr)) +
      geom_point(aes(color = yr, size = enroll, alpha = enroll)) +
      scale_y_continuous(breaks = c(-1, -0.5, 0, 0.5, 1)) +
      scale_alpha_continuous(name = "total enrollment" , range = c(0.1, 1)) +
      scale_colour_gradient2(
        yr,
        low = "#cf7dff",
        mid = "white",
        high = "#81fcd9",
        midpoint = 0,
        guide = "colourbar",
        limits = c(-1,1),
      ) +
      ylab("Standard deviations from the national average") +
      xlab(get_sort_name(input$sort_type)) +
      geom_smooth(linewidth=.5, color="#bdc8db") +
      ggtitle(get_yr_title(input$assessment_type, input$year_select))
    p <- ggplotly(p)

    return(p)
  })
  # chart 2
  
  output$dem_plot <- renderPlotly({
    subject_df <- filter(dem_df, subject==input$dem_assessment_type)
    wht_df <- get_means(subject_df, "wht")
    blk_df <- get_means(subject_df, "blk")
    hisp_df <- get_means(subject_df,"hsp")
    pov_df <- get_means(subject_df, "ecd")
    data <- c(wht_df, blk_df, hisp_df, pov_df)
    df <- data.frame(demographic, year, data)
    p <- ggplot(df, aes(fill = year, y = data, x = demographic)) +
      geom_bar(position = "dodge", stat="identity") +
      scale_fill_manual(values = c("#992ea3", "#2cd1d4", "#b7ceed"))
    p <- ggplotly(p)
    return(p)
  })
  
  # chart 3
  output$dem_fund_plot <- renderPlotly({
    title <- cat("Funding vs standard deviations from mean", 
                 input$dem_fund_assessment_type,  "by demographic")
    subject_df <- filter(dem_fund_df, subject==input$dem_fund_assessment_type)
    range_df <- get_range(subject_df, input$dem_range)
    data <- get_dem(range_df)
    p <- ggplot(data, aes(fill=variable, x=Demographic, y=value)) +
      ylab("Standard deviations from the national average") +
      ggtitle(title) +
      geom_boxplot() +
      scale_fill_manual(values = c("#992ea3", "#2cd1d4", "#b7ceed"),
                         labels = c("2019", "2022", "Change"))+
      facet_wrap(~variable, scale="free")
    p <- ggplotly(p)
    return(p)
  })
}

