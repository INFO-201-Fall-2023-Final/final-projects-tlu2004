library(dplyr)
library(stringr)
library(tidyr)

# Loading Data Sets

scores_df <- read.csv("seda2022_admindist_poolsub_np_2.0.csv", colClasses=c('character'))
poverty_df <- read.csv("ussd21.csv", colClasses=c('character'))

# Data-wrangling

lead_zero <- function(leaid) {
  if(str_length(leaid) < 7) {
    return(paste(0, leaid, sep=""))
  }
}
scores_df$sedaadmin <- lapply(scores_df$sedaadmin, lead_zero)
scores_df$sedaadmin <- unlist(scores_df$sedaadmin)

# make new math and english dataframes
math_df <- filter(scores_df, subject=="mth", subgroup=="all" )
english_df <- filter(scores_df, subject=="rla", subgroup=="all" )

# make leaid column
state_math_df <- group_by(math_df, stateabb)
state_math_df <- summarize(state_math_df, sum(as.numeric(), na.rm=TRUE))
poverty_df$leaid <-  paste(poverty_df$State.FIPS.Code, poverty_df$District.ID, sep="")

# make percent children in poverty column
colnames(poverty_df)[5] <- "child.pov"
poverty_df$perc.pov <- as.numeric(poverty_df$child.pov) / as.numeric(poverty_df$Estimated.Population.5.17)

improved <- function(change) {
  if(as.numeric(change) > 0) {
    return(TRUE)
  }
  return(FALSE)
}
math_df$improved <- lapply(math_df$np_chg_ol, improved)
english_df$improved <- lapply(english_df$np_chg_ol, improved)

english_df$improved <- lapply(english_df$np_chg_ol, improved)
math_df <- left_join(math_df, poverty_df, by = c("sedaadmin" = "leaid"))
english_df <- left_join(english_df, poverty_df, by = c("sedaadmin" = "leaid"))
