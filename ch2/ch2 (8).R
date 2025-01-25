library(shiny)
animals<-c( "cat", "mouse", "bird", "other", "I hate animals")

ui<-fluidPage(
  checkboxInput("cleanup", "Clean up?", value = TRUE),
  checkboxInput("shutdown", "Shutdown?")
)

server<-function(input, output, session) {
  
}




shinyApp(ui,server)