library(shiny)

ui<-fluidPage(
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows = 3) #How do you change the number of characters
  #that can be displayed in each row? What's the default value?

)

server<-function(input, output, session) {
  
}




shinyApp(ui,server)