###This is my solution which is returning an error, not sure what's wrong ###
library(shiny)

ui <- fluidPage(
  numericInput("year", "year", value = 2020),
  dateInput("date", "date", value = "2020-05-01", min = NULL, max = NULL)
)

server<-function(input,output, session) {
  ###Need to update the dateInput function so that it's restricted to dates that are in the 
  #year selected in the numericInput function 
  
  #In theory, you'd have something like a "choices" argument where you could specify year and then input the 
  #a UPdatedateInput() function where choices = input$year, but I don't know how to code this 
  
observeEvent(input$year,{
             updateDateInput(InputId= "date", min = paste(input$year,"-01", "-01", sep=""), 
                             max = paste(input$year,"-12", "-31", sep=""))
}
             )
  
  }

shinyApp(ui, server)