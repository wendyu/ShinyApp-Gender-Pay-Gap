library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Gender Pay Gap in the United States"),

  sidebarPanel(
      selectInput("factor","Select a factor",
                  choices=factors),
      helpText("1. Select a factor to see how it influences gender pay gap.",br()),
      submitButton("Update View"),
      helpText("2. Move mouse over to the bubbles to identify each group",br(),
               "3. Click play button to view changes over time",br(),
               "4. View bar chart/line chart by selecting tabs at upper right corner",
               "5. Swtich y-axis to Difference_Income_Norm see different effects")
      ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("View Data",h4("Yearly income"),htmlOutput("motionchart"),
               br(),
               helpText("Notes:",br(),
                        "* Average_Income: average income, male and female combine, adjusted by population", br(),
                        "* Population: total number of working force (in thousands)", br(),
                        "* Difference_Income: median male income - median female income", br(),
                        "* Difference_Population: number of working male - number of working female", br(),
                        "* Difference_Income_Norm: difference_income normalize by average_income"), br(), br())
    )
  )
))



