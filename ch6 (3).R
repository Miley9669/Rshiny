### Using a different stylistic approach than the default bootstrap ###

ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),#can also try: flatly, sandstone, united
  sidebarLayout(
    sidebarPanel(
      textInput("txt", "Text input:", "text here"),
      sliderInput("slider", "Slider input:", 1, 100, 30)
    ),
    mainPanel(
      h1(paste0("Theme: darkly")),
      h2("Header 2"),
      p("Some text")
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)