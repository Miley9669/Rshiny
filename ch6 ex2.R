library(shiny)
### This returns a page that doesn't have any graphs. I'm not sure why this is occurring ###
ui <- fluidPage(
  titlePanel("Central limit theorem"),
  fluidRow(
    column(5, 
           plotOutput("hist")),
    
    column(5, 
           plotOutput("hist"))
  ),
  fluidRow(
    column(12, 
           numericInput("m", "Number of samples:", 2, min = 1, max = 100) )
  )
)

server <- function(input, output, session) {
  output$hist <- renderPlot({
    means <- replicate(1e4, mean(runif(input$m)))
    hist(means, breaks = 20)
  }, res = 96)
}

shinyApp(ui, server)