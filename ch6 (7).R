

ui <- fluidPage(
  HTML(r"(
       <h1>This is a heading</h1>
       <p class="my-class">This is some text!</p>
       <ul>
       <li>First bullet</li>
       <li>Second bullet</li>
       </ul>
  )")
)
### Alternative code using the HTML helper that Shiny provides###
#ui <- fluidPage(
#  h1("This is a heading"),
#  p("This is some text", class = "my-class"),
#  tags$ul(
#    tags$li("First bullet"), 
#    tags$li("Second bullet")
#  )
#)




server <- function(input, output, session) {}

shinyApp(ui, server)