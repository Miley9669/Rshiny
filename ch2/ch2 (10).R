library(shiny)

ui<-fluidPage(
  textOutput("text"),
  verbatimTextOutput("code"),
  textOutput("code2")
)
server<-function(input, output, session) {
  output$text<-renderText({
    "Hello friend!"
  })
  output$code <- renderPrint({
    summary(1:10)
  })
  output$code2<-renderText({ #See the difference between using renderText() and renderPrint()
    summary(1:10)
  })
}

shinyApp(ui, server)


