

ui <- fluidPage(
  textInput("name", "What's your name?")
)

server <- function(input, output, session) {}

shinyApp(ui, server)