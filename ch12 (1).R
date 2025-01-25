library(shiny)
library(dplyr, warn.conflicts = FALSE)
library(ggplot2)

### Note: this code doesn't filter the chosen column properly. It's looking for 'name' > min instead
#of name > min

num_vars <- c("carat", "depth", "table", "price", "x", "y", "z")
ui <- fluidPage(
  selectInput("var", "Variable", choices = num_vars),
  numericInput("min", "Minimum", value = 1),
  tableOutput("output")
)
server <- function(input, output, session) {
  data <- reactive(diamonds %>% filter(input$var > input$min))
  output$output <- renderTable(head(data()))
}

shinyApp(ui, server)