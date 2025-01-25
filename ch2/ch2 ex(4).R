library(shiny)

ui<-fluidPage(
  textOutput("greeting"),
  verbatimTextOutput("summ"),
  verbatimTextOutput("test"),
  textOutput("model")
)
server<-function(input, output, session) {
  output$summ <- renderPrint(summary(mtcars))
  output$greeting <- renderText("Good Morning!")
  output$test <- renderPrint(t.test(1:5, 2:6))
  output$model <- renderText(str(lm(mpg~wt, data=mtcars)))
}

shinyApp(ui, server)
    


