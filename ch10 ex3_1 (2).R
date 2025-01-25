### My adjustment ###

#I didn't understand this part in the original solution:  tagList(
#tags$style("#params { display:none; }"),
#not familiar with "tagList()" or tags$style; turns out that this does the same thing as setting 
#the type parameter equal to "hidden" like we've been doing throughout the chapter. 

library(shiny)
parameter_tabs <- 
  tabsetPanel(id = "params", type = "hidden",
              tabPanel("slider",
                       sliderInput("my_slider", "n", value = 0, min = 0, max = 100)
              ),
              tabPanel("numeric", 
                       numericInput("my_numeric", "n", value = 0, min = 0, max = 100)  
              )
  )

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("my_selector", "Input Type", 
                  choices = c("slider", "numeric")
      ),
      parameter_tabs,
    ),
    mainPanel()
  )
)

server <- function(input, output, session) {
  
  # if slider changes, update numeric
  observeEvent( input$my_slider, {
    updateNumericInput(session, "my_numeric", value = isolate(input$my_slider))
  })
  
  # if numeric changes update slider
  observeEvent( input$my_numeric, {
    updateSliderInput(session, "my_slider", value = isolate(input$my_numeric))
  })
  
  observeEvent(input$my_selector, {
    updateTabsetPanel(session, "params", selected = input$my_selector)
  }) 
  
}

shinyApp(ui = ui, server = server)