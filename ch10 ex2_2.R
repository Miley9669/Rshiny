library(shiny)
library(ggplot2)

#ggplot(diamonds, aes(carat)) +
#  geom_histogram()
  
parameter_tabs <- tabsetPanel(
  id = "params",
  type = "hidden",
  tabPanel("histogram",
           numericInput("binwidth", "binwidth", value = 1)
  ),
  tabPanel("freqpoly",
           numericInput("binwidth", "binwidth", value = 1)
  ),
  tabPanel("density",
           numericInput("bw", "bw", value = 1)
  )
)

ui<-fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      selectInput("type", "type", choices = c("histogram", "freqpoly", "density")),
      parameter_tabs
      
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server<-function(input, output, session) {
  
  observeEvent(input$type, {
    updateTabsetPanel(inputId = "params", selected = input$type)
  })
  
  output$plot<-renderPlot({
    switch(input$type, 
    histogram = ggplot(diamonds, aes(carat))+ geom_histogram(binwidth=input$binwidth),
    freqpoly = ggplot(diamonds, aes(carat)) + geom_freqpoly(binwidth=input$binwidth),
    density = ggplot(diamonds, aes(carat)) + geom_density(bw = input$bw)
    )
  })
  
}

shinyApp(ui, server)