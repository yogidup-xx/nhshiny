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
ui <- fluidPage(
   
   # Application title
   titlePanel("Conversion Rate Simulation"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        numericInput(
          "current_traffic",
          label = "Set your current traffic : ",
          value = 1000000
        ),
        numericInput(
          "current_cr",
          label = "Set your current conversion rate (%) : ",
          value = 2.48
        )
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         uiOutput("cr_simulator")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$cr_simulator <- renderUI({
      current_traffic = input$current_traffic
      current_cr = input$current_cr
      current_conv = (current_traffic*current_cr)/100
      
      h4(current_conv)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

