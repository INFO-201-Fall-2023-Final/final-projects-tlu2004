# tab_panel_intro

library(shiny)

tab_panel_introduction <-tabPanel(
    "Introduction",
    column(12, h1("Introduction"), align = "center"),
    tags$figure(
      align = "center",
      style = "margin:0;",
      tags$img(src = "education.png", width = 500)
    ),
    h3("Overview"),
    p("As you go through this journey to delve deeper into the implications of the pandemic on education. 
       We encourage you, our reader, to reflect on how this unprecedented event may have shaped your life,
       dreams for the future, and any challenges faced along the way. Our aim with this project is to scrutinize 
       how this global crisis disrupted the academic landscape for millions of students, reshaping the trajectories
       of their educational journeys. We’ll be examining how the sudden outbreak affected academic performance 
       and outcomes and if it had exacerbated pre-existing disparities."),
    h3("Why Does This Matter?"),
    p("Understanding the far-reaching effects of the pandemic on education is crucial for several reasons. Firstly, 
       it allows us to comprehend the depth of disruption experienced by students, educators, and educational systems
       as a whole. Secondly, it sheds light on the exacerbation of existing inequalities, emphasizing the urgent need
       to address these disparities. Lastly, by dissecting these impacts, we can pave the way for informed strategies
       and interventions to create a more resilient and equitable educational environment for all students."),
    h3("Questions we seek to answer:"),
    p("1. How did the pandemic impact the distribution of standardized test scores of students as a whole?"),
    p("2. How do test scores of districts with adequate funding compare to districts with poor funding"),
    p("3. Did the pandemic exacerbate any pre-existing conditions that were affecting student performance or is it unrelated?"),
    h3("Exploration and Insights"),
    p("  Observing and reflecting on our own educational journeys certainly served as a catalyst for our interest into this subject.
      Sharing our experiences with each other played a pivotal role in fostering our curiosity and determination to understand how
      the pandemic affected academics as a whole."),
    br(),
    p("The disruption in our college and high school career altered our learning environments and shifted our academic goals. We were 
      suddenly thrown many unforeseen obstacles and had to quickly adapt to overcome the challenges of remote learning. During this time,
      there were many discussions surrounding the future impact of the pandemic on our education system and what long term effects would be. 
      Now that we have moved past the pandemic, we were inspired to comprehend the broader impact of these circumstances on a larger scale,
      Prompting us to seek insight on how the pandemic shaped educational outcomes for individuals and communities."),
    h3("Dataset and Methodology"),
    p("Through data analysis and visualization, we aim to uncover patterns, trends, and disparities in educational achievement pre-
      and post-COVID-19. By examining various metrics, including academic performance, access to resources, and demographic factors. 
      We strive to paint a comprehensive picture of the pandemic's influence on education by creating a comprehensive dataset from 
      two correlating datasets that were widely available to the public."),
    h4("District Cost Database 2023"),
    p(" The School Finance Indicators Database (SFID) is a collection of data that measures the fairness of K-12 education in terms of
      finances and resources. The purpose of the SFID is to provide a source for the general public, policymakers, and researchers that
      work in education economics. The dataset that we used was one of two primary datasets within the SFID; the District Cost Database
      (DCD) assesses the adequacy of public K-12 education spending. It compares the estimated and actual spending levels required to
      achieve a common student outcome goal. The additional statistics like poverty rates of children and districts ethnic compositions
      help provide context for the correlation between spending adequacy and other characteristics. Designed to account for a host of 
      educational and noneducational factors that affect the relationship between funding and outcomes."),
    strong("Data Creation Range: 2008 - 2020"),
    br(),
    strong("    Released this version in 2023."),
    br(),
    strong("Created By:"),
    br(),
    strong("-Albert Shanker Institute"),
    br(),
    strong("-University of Miami School of Education and Human Development"),
    br(),
    strong("-Rutgers University Graduate School of Education: School Finance Indicators Database"),
    br(),
    strong("Source: https://www.schoolfinancedata.org/"),
    br(),
    h4("The Stanford Education Data Archive (SEDA)"),
    p("The Stanford Education Data Archive (SEDA) includes a range of detailed data on educational conditions, contexts, and outcomes in school 
      districts and counties across the United States. It includes measures of academic achievement and achievement gaps for school districts and
      counties, as well as district-level measures of racial and socioeconomic composition, racial and socioeconomic segregation patterns, and other
      features of the schooling system."),
    p("For this particular release, SEDA2022; the EOP at Stanford University was joined by Harvard University’s Center for Education Policy Research. To create 
       a dataset that was designed to provide insight into how school district achievement was affected by the COVID-19 pandemic. It compares data two years after
       the onset of the pandemic in 2022, to student achievement data from 2019, the year prior to the pandemic. The Educational Opportunity Project (EOP) at Stanford
       University’s goal is to generate and share data that can help people learn more about and study how to improve educational opportunities for children. The EOP
       initiative is the first national database of academic performance and is publicly available for anyone to explore and obtain information about American schools,
       communities, and student success."),
    strong("Data Creation Range: 2019-2022"),
    br(),
    strong("Created By:"),
    br(),
    strong("-The Educational Opportunity Project (EOP) at Stanford University"),
    strong("-Harvard University’s Center for Education Policy Research"),
    br(),
    strong("Source: https://edopportunity.org/get-the-data/"),
    br()
)
