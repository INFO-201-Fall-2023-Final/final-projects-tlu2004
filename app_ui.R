library(shiny)
library(shinythemes)

source("tabs/tab_panel_intro.R")
source("tabs/tab_panel_chart1.R")
source("tabs/tab_panel_chart2.R")
source("tabs/tab_panel_chart3.R")

ui <- navbarPage(
  theme = shinytheme("cyborg"),
  tags$head(tags$style("body{color: #cccecf;}")),

  title = "Effects of COVID-19 on Math and Reading Achievement",
  
  footer = list(
    br(),
    column(12, p("INFO 201 | Final Deliverable | Autumn 2023 | Thomas Lu, Vy Tran-Nguyen")),
    br()
  ),

  # The project introduction
  tab_panel_introduction,

  # The three charts
  tab_panel_chart1,
  tab_panel_chart2,
  tab_panel_chart3,
  
)


