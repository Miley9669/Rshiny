library(shiny)
library(ggplot2)

datasets <- c("economics", "faithfuld", "seals")

ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  # 1. Change tableOutput to plotOutput.
  plotOutput("plot")
)

server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  # 2. Change summry to summary.
  output$summary <- renderPrint({
    summary(dataset())
  })
  output$plot <- renderPlot({
    # 3. Change dataset to dataset().
    plot(dataset())
  })
}

shinyApp(ui, server)