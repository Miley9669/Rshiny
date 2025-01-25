library(openintro)
library(dplyr)
states <- unique(county$state)

ui <- fluidPage(
  selectInput("state", "State", selected = 'Florida', choices = states),
  selectInput("county", "County", choices = NULL)
)

server<-function(input, output, session) {
  observeEvent(input$state, {
    data <- filter(county, state == input$state)
    updateSelectInput(session, "county", choices = unique(data$name))
    
  })
  
}

shinyApp(ui, server)