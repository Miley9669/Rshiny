library(shiny)
ui <- fluidPage(
  plotOutput("plot", click = "plot_click"),
  tableOutput("data")
)
#server <- function(input, output, session) {
#  output$plot <- renderPlot({
#    plot(mtcars$wt, mtcars$mpg)
#  }, res = 96)
  
#  output$data <- renderTable({
#    nearPoints(mtcars, input$plot_click, xvar = "wt", yvar = "mpg")
#  })
#}

#Same but using ggplot#
server <- function(input, output, session) {
  output$plot <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  }, res = 96)
  
  output$data <- renderTable({
    req(input$plot_click)
    nearPoints(mtcars, input$plot_click) #only need the first two paramemters when using ggplot
  })
}



shinyApp(ui, server)