###This code doesn't work but I don't get why. I tried to create an app like what's in app.R but using the 
#datasets in ggplot2 instead of the base datasets. I can't get it to work. 


#### FIXED THE ISSUE! I had "ouput" instead of "output" as my parameter in the server object ####

library(shiny)
library(ggplot2)

datasets<-c("economics", "faithfuld", "seals")

ui<-fluidPage(
  selectInput("dataset", label= "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server<-function(input, output, session) {
  dataset<-reactive({
    get(input$dataset, "package:ggplot2")
  })
  output$summary<-renderPrint({
    summary(dataset())
  })
  output$table<-renderTable({
    dataset()
  })
}

shinyApp(ui, server)

#ui <- fluidPage(
#  selectInput( "dataset", label = "Dataset", choices = ls("package:datasets")),
#  verbatimTextOutput("summary"),
#  tableOutput("table")
#)
#server<-function(input, output, session) {
  #Create a reactive expression
#  dataset <- reactive({
#    get(input$dataset, "package:datasets")
#  })
#  output$summary <- renderPrint({
#    #Use a reactive expression by calling it like a function
#    summary(dataset())
#  }) 
  
#  output$table<-renderTable({
#    dataset()
#  })
#}
#shinyApp(ui, server)