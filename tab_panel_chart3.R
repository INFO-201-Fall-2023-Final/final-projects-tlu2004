# tab_panel_chart3

library(shiny)

tab_panel_chart3 <-tabPanel("Chart 3",
  titlePanel("Funding Gap vs Demographic Achievement"),
  br(),
  sidebarLayout(
    sidebarPanel(width = 3,
                 radioButtons(
                   inputId = "dem_fund_assessment_type", label = h3("Assessment Type:"),
                   choices = c("Math" = "mth", "Reading Language Arts" = "rla"),
                   selected = "mth"
                 ),
                 radioButtons(
                   inputId = "dem_range", label = h4("Funding gap per student 
                                                   in dollars(lower-bounds:upper-bounds"),
                   choices = c("-15k:-10k" = "low", "-10k:-5k" = "mid_low", "-5k:5k" = "mid",
                               "5k:10k" = "mid_hi", "10k:25k" = "hi"),
                   selected = "low"
                 ),
    ),
    mainPanel(
      plotlyOutput("dem_fund_plot"),
      p("Note: Boxplots for Black student test scores in the 10k-25k funding group are supressed as not enough data was available")
    )
  ),
  p("In this chart we investigate the idea that while, to a certain extent, a student's racial and socioeconomic status may have have an
    effect on their educational opportunity, the largest contributing factor to the success of a student's education is the school they attend.
    Rather than differences in family resources, educational opportunity gaps can be associated with differences at district and community level.
    Comparing medians from the lowest division of funding disparity per student(-15k to -10k) to the highest division(10k to 25k), the median scores
    of economically disadvantaged students rise from -.66 to -.1 standard deviations. Furthermore, comparing white students between
    district finance levels, although consitently scoring above Black, Hispanic, and Economically Disadvantaged subgroups within each district finance
    subgroup, in school districts with larger finance gaps, White students' median falls below the national average. Regardless of race or socoioeconomic
    background, students who attend underfunded public schools consitently do worse. We would like to further highlight the change in distributions
    from 2019-2022 as districts with higher funding disparities notice the largest drop in standard deviations. This means, students who are statistically
    on the lower end of national distributions are falling lower on this scale after COVID-19. As this measurement of scores only compares students within the
    same grade and year, the actual NAEP score is not reflected suggesting an even more concerning widening of educational disparity.")
)



