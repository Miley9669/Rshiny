library(shiny)

ui<-fluidPage(
  dataTableOutput("table")
)

server<-function(input, output, session) {
  output$table <-renderDataTable(mtcars, options = list(ordering = FALSE, searching = FALSE))#options = list(pageLength = 5))
}###I had to look at the solution. By changining the parameters in the list() removes the search, ordering
  #and filter from the original 

shinyApp(ui, server)