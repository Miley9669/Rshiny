library(shiny)
library(ggplot2)

###Textbook solution. Adds in min/max and step values to the tabPanel() functions. ###

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("geom", "Geom function to use", 
                  choices = c("histogram", "freqpoly", "density")
      ),
      tabsetPanel(
        id = "params",
        type = "hidden",
        tabPanel("histogram",
                 numericInput("hist_bw", 
                              label = "Binwidth", value = 0.1, 
                              min = 0.1, max = 5, step = 0.1
                 )
        ),
        tabPanel("freqpoly", 
                 numericInput("freqpoly_bw", 
                              label = "Binwidth", value = 0.1, 
                              min = 0.1, max = 5, step = 0.1
                 )
        ),
        tabPanel("density",
                 numericInput("density_bw", 
                              label = "Standard deviation of smoothing kernel",
                              value = 0.01, min = 0.01, max = 1, step = 0.01
                 )
        )
      )
    ),
    mainPanel(
      plotOutput("gg")
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$geom, {
    updateTabsetPanel(inputId = "params", selected = input$geom)
  }) 
  
  gg_args <- reactive({
    switch(input$geom, 
           histogram = geom_histogram(binwidth = input$hist_bw),
           freqpoly = geom_freqpoly(binwidth = input$freqpoly_bw),
           density = geom_density(bw = input$density_bw)
    )
  })
  
  output$gg <- renderPlot({
    ggplot(diamonds, aes(carat)) +
      gg_args()
  })
}

shinyApp(ui, server)