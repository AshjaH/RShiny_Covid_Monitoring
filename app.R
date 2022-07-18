library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("COVID-19 Monitoring"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select date to determine COVID-19 transmission on that day."),
      dateInput("date", 
                h5("Date Selection"), 
                value = "2020-01-01"),
      h6("Tranmission Thresholds as Defined by the CDC"),
      img(src = "table-1", height = 200, width = 340)
      
    ),
    mainPanel(
      h2("Transmission")
      
      
    )
  )
  
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)
