library(shiny)

ui<-fluidPage(
  sliderInput("x", label = "If x is", min=1, max=50, value=30),
  "then x times 5 is",
  numericInput("y", label = NULL, value = 10),
  textOutput("product")
)

server<-function(input, output, session) {
  output$product<-renderText({
    input$y*5 #if you use input$x * 5, then the product will be based on the slider, not the numeric input
  })
}

shinyApp(ui,server)