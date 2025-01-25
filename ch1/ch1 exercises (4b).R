library(shiny)

ui<-fluidPage(
  sliderInput("x", label = "If x is", min=1, max=50, value=30),
  sliderInput("y", label = "If x is", min=1, max=50, value=30),
  "then x times y is",textOutput("product"),
  "and, (x*y) is + 5", textOutput("product_plus5"),
  "and (x*y) + 10 is", textOutput("product_plus10")
)
### Doesn't use reactive expression ###
server<-function(input, output, session) {
  
   output$product<-renderText({
      product<-input$y * input$x
      product
    })
  
  output$product_plus5 <- renderText({
    product<-input$x * input$y
    product + 5
  })
  
  output$product_plus10 <- renderText({
    product<-input$x * input$y
    product + 10
  })
  
}

shinyApp(ui,server)