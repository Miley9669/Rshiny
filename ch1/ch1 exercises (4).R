library(shiny)

ui<-fluidPage(
  sliderInput("x", label = "If x is", min=1, max=50, value=30),
  sliderInput("y", label = "If x is", min=1, max=50, value=30),
  "then x times y is",textOutput("product"),
  "and, (x*y) is", textOutput("product_plus5"),
  "and (x*y) + 10 is", textOutput("product_plus10")
)

server<-function(input, output, session) {
  
  #Create a reactive expression
  product <- reactive({
    input$y * input$x
  })
  

  
output$product<-renderText({
  product()
})  
  
output$product_plus5 <- renderText({
  product() + 5
})
  
output$product_plus10 <- renderText({
  product() + 10
})
  
}

shinyApp(ui,server)