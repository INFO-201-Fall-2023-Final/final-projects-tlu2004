# tab_panel_chart2

library(shiny)
library(plotly)
library(ggplot2)

tab_panel_chart2 <-tabPanel("Chart 2",
  titlePanel("Achievement by demographic"),
  br(),
  sidebarLayout(
    sidebarPanel(width = 3,
      radioButtons(
       inputId = "dem_assessment_type", label = h3("Assessment Type:"),
       choices = c("Math" = "mth", "Reading Language Arts" = "rla"),
       selected = "mth"
      )
    ),
    mainPanel(
      plotlyOutput("dem_plot")
    )
  ),
    p("The decrease in assessment scores across diverse demographics (including black, Hispanic, low-income, and white
      students) from 2019 to 2022 indicates a widespread issue that extends beyond any specific group. This decline signals 
      a systemic problem affecting academic performance regardless of race or income level."),
    p("Addressing this challenge requires adopting multifaceted solutions that encompass enhancing educational resources, 
      establishing support systems, rectifying systemic inequalities, and implementing strategies to assist students from all
      backgrounds. Identifying and tackling the root causes of academic decline is imperative for improving educational outcomes
      for all students, regardless of their race or income level."),
    p("These hurdles can take the form of inadequate access to technology, unstable home environments, limited resources for
      education, and basic needs such as food and housing security. Students from low-income households consistently score lower 
      on average compared to their more economically advantaged counterparts. The pandemic exacerbated these existing disparities,
      as students from low-income families encountered increased challenges due to the abrupt shift to remote learning, a lack of 
      access to essential resources, and potential difficulties adapting to new learning formats."),
    p("The disruptions caused by the pandemic had a widespread impact on students of all racial and socio-economic backgrounds, 
      contributing to a general decline in academic performance and standardized test scores. Recognizing these challenges is crucial,
      and policymakers, educators, and communities should collaborate to implement strategies that can mitigate the impact of socio-economic 
      disparities on academic achievement, particularly during times of crisis such as the COVID-19 pandemic.")
)
    

