library(shiny)
animals<-c("state", "cat", "mouse", "bird", "other", "I hate animals")

ui<-fluidPage(
  radioButtons("rb", "Choose one:",
               choiceNames = list(
                 icon("angry"),
                 icon("smile"),
                 icon("sad-tear")
               ),
               choiceValues = list("angry", "happy", "sad") #This is how you'd reference the input
               #on the server end, e.g., input$angry, input$sad
               )
)

server<-function(input, output, session) {
  
}




shinyApp(ui,server)