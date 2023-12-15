# tab_panel_chart1

library(shiny)
library(shinythemes)
library(ggplot2)
library(dplyr)
library(plotly)

tab_panel_chart1 <-tabPanel("Chart 1",
  fluidPage(
    titlePanel("Public School Funding on Student Achievement"),
    br(),
    sidebarLayout(
      sidebarPanel(width = 3,
        radioButtons(
          inputId = "assessment_type", label = h3("Assessment Type:"),
          choices = c("Math" = "mth", "Reading Language Arts" = "rla"),
          selected = "mth"
        ),
        radioButtons(
          inputId = "sort_type", label = h3("Sort by student poverty vs district funding"),
          choices = c("Student Poverty" = "pov", "District Funding" = "fundinggap"),
          selected = "pov"
        ),
        selectInput(
          inputId = "year_select",
          label = "Select a year to view:",
          choices = c("2019" = "2019", "2022" = "2022", "Change" = "Change"),
          selected = "2019"
        )
      ),
      mainPanel(
        plotlyOutput("funding_plot")
      )
    ),
      p("In this graph we can analyze how student poverty levels and district funding influence educational performance. 
        We measured educational performance through the SEDA’s use of the National Assessment of Educational Progress (NAEP)
        2019 and 2022 national and state assessment data. Which gave us a baseline to compare students’ performance against 
        the national averages."),
      p("While poverty can impact a student’s access to different resources and support systems. We found that it wasn’t actually 
        the main determinant of the change in academic performance during the pandemic. However, we do recognize that there is a
        slight decline in achievement for students who have a higher level of poverty when comparing the graph from 2019 to 2022."), 
      p("When considering the relationship betweens student poverty levels and educational performance:"),
      tags$ul(
        tags$li("Access to Resources: Students from low-income families often lack access to critical resources such as quality educational
                materials, technology, and support programs. Limited access can hinder their learning and overall academic performance."),
        tags$li("Health and Nutrition: Economic hardships can lead to inadequate nutrition and healthcare, impacting students' physical
                and mental well-being. Poor health can affect concentration, attendance, and cognitive development."),
        tags$li("Home Environment: Unstable living conditions, lack of a conducive study environment, or limited parental involvement due
                to work schedules can disrupt a student's ability to focus on learning."),
        tags$li("Psychosocial Factors: Students from low-income backgrounds might face psychosocial stressors related to poverty, 
                impacting their self-esteem, motivation, and overall attitude towards education.")
      ),
      p("Analyzing the educational performance of districts with poor funding on the national assessment scale reveals that generally, 
        these districts showed lower academic achievement compared to more affluent districts even before the onset of the pandemic. 
        However the data shows that there was definitely a clear impact on the average assessment scores of students post pandemic.
        We found that the pandemic exacerbated the educational disparities between districts with poor funding versus districts with
        adequate or excess funding. District funding plays a crucial role in shaping the overall educational environment. Adequate
        funding enables schools to provide better resources, such as updated learning materials, technology, well-qualified teachers,
        extracurricular activities, smaller class sizes, and additional support services. These resources can positively impact students'
        educational experiences and outcomes."),
      p("When considering the relationship between district funding and educational performance:"),
      tags$ul(
        tags$li("Resource Allocation: Higher funding often allows schools to allocate resources more effectively, providing students with 
                better opportunities for learning and growth."),
        tags$li("Teacher Quality and Support: Increased funding can attract and retain highly qualified teachers and staff, who play a
                pivotal role in student success. Professional development and support for educators are also crucial."),
        tags$li("Infrastructure and Facilities: Adequate funding enables the improvement and maintenance of school infrastructure,
                creating a conducive learning environment."),
        tags$li("Enrichment Programs: Funding can support extracurricular activities, after-school programs, and initiatives that enhance 
                students' holistic development.")
      ),
      p("While individual poverty levels matter, the disparities in educational outcomes may be more pronounced in districts with insufficient 
        funding. Where students from lower-income families might face constant challenges due to limited resources and support systems compared
        to their more affluent peers. This finding emphasizes the significance of equitable distribution of resources and funding across 
        districts. It suggests that increasing funding in under-resourced districts could potentially mitigate some of the educational 
        disparities linked to poverty by providing more equal opportunities for all students.")
  )
)


