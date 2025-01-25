library(shiny)
animals<-c("state", "cat", "mouse", "bird", "other", "I hate animals")

ui<-fluidPage(
  selectInput("state", "What's your favorite state", state.name),
  radioButtons("animal","What's your favorite animal", animals)
)

server<-function(input, output, session) {
  
}




shinyApp(ui,server)