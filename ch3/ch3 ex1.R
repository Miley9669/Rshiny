library(shiny)

ui<-fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

#server1<-function(input, output, server) {
#  output$greeting <-renderText(paste0("Hello ", input$name)) #replaced input$greeting with output$greeting and name with input$name
  
#}

#server2 <- function(input, output, server) {
  #greeting <- paste0("Hello ", input$name)
#  greeting <- reactive(paste0("Hello ", input$name))
#  output$greeting<-renderText(greeting())
#}

server3<-function(input, output, server) {
  output$greeting<-renderText(paste0("Hello", input$name)) #'greeting' instead of 'greting'; also wrapped print
  #statement in renderText() function
}


shinyApp(ui, server3)