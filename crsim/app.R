#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(# Application title
  titlePanel("Conversion Rate Simulation"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("current_traffic",
                   label = "Set current traffic : ",
                   value = 1000000),
      numericInput("current_cr",
                   label = "Set current conversion rate (%) : ",
                   value = 2.48,
                   step = 0.01),
      numericInput("est_traffic",
                   label = "Set estimated traffic : ",
                   value = 1200000),
      numericInput("goal_cr",
                   label = "Set target conversion rate (%) : ",
                   value = 2.78,
                   step = 0.01),
      
      width = 4
    ),
    
    # Show a plot of the generated distribution
    mainPanel(uiOutput("cr_simulator"))
  ))

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$cr_simulator <- renderUI({
    
    current_traffic = input$current_traffic
    current_cr = input$current_cr
    current_conv = round((current_traffic * current_cr)/100, digits = 0)
    
    est_traffic = input$est_traffic
    goal_cr = input$goal_cr
    target_conv = round((est_traffic * goal_cr)/100, digits = 0)
    
    column(
      6,
      strong("Current conversion"),br(),
      current_conv,
      hr(),
      
      strong("Target conversion"),br(),
      target_conv,
      hr()
      
    )
    
  })
}

# Run the application
shinyApp(ui = ui, server = server)
