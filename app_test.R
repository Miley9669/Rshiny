# app.R
#Adding some text into the file for testing changes
library(shiny)

# UI ------------------------------------------------------------------------
ui <- fluidPage(
  titlePanel("Example Shiny App with Excel Workbook Generation"),
  
  sidebarLayout(
    sidebarPanel(
      # Let's create 10 inputs:
      # 5 dropdowns (selectInput) with 2-5 categorical options each
      selectInput("select1", "Select Input 1:",
                  choices = c("Option A", "Option B", "Option C")),
      selectInput("select2", "Select Input 2:",
                  choices = c("Red", "Green", "Blue", "Yellow")),
      selectInput("select3", "Select Input 3:",
                  choices = c("Cat", "Dog")),
      selectInput("select4", "Select Input 4:",
                  choices = c("Apple", "Banana", "Cherry")),
      selectInput("select5", "Select Input 5:",
                  choices = c("Yes", "No")),
      
      # 5 numeric inputs, each bounded between 0 and 100
      numericInput("num1", "Numeric Input 1:", value = 50, min = 0, max = 100),
      numericInput("num2", "Numeric Input 2:", value = 10, min = 0, max = 100),
      numericInput("num3", "Numeric Input 3:", value = 75, min = 0, max = 100),
      numericInput("num4", "Numeric Input 4:", value = 20, min = 0, max = 100),
      numericInput("num5", "Numeric Input 5:", value = 95, min = 0, max = 100),
      
      br(),
      actionButton("generateBtn", "Generate Excel Workbook"),
      br(), br(),
      downloadButton("downloadExcel", "Download Excel")
    ),
    
    mainPanel(
      h4("Instructions:"),
      p("1. Adjust the dropdown or numeric inputs as needed."),
      p("2. Click 'Generate Excel Workbook' to create the workbook in memory."),
      p("3. Click 'Download Excel' to save the generated workbook to your system.")
    )
  )
)

# Server --------------------------------------------------------------------
server <- function(input, output, session) {
  
  # Source the individual scripts
  source("script1.R", local = TRUE)  # Creates the workbook
  source("script2.R", local = TRUE)  # Adds Worksheet #1
  source("script3.R", local = TRUE)  # Adds Worksheet #2
  source("script4.R", local = TRUE)  # Adds Worksheet #3
  source("script5.R", local = TRUE)  # Adds Worksheet #4
  source("script6.R", local = TRUE)  # Returns/finalizes the workbook
  
  # We will keep the workbook in a reactiveVal so we can update it in steps
  wb_reactive <- reactiveVal(NULL)
  
  # When the user clicks "Generate Excel Workbook"
  observeEvent(input$generateBtn, {
    
    # 1) Create an empty workbook
    wb <- createWorkbookFunction()
    
    # 2) Add the first worksheet (script2)
    wb <- addWorksheetOne(wb, input$select1, input$num1)
    
    # 3) Add the second worksheet (script3)
    wb <- addWorksheetTwo(wb, input$select2, input$num2)
    
    # 4) Add the third worksheet (script4)
    wb <- addWorksheetThree(wb, input$select3, input$num3)
    
    # 5) Add the fourth worksheet (script5)
    wb <- addWorksheetFour(wb, input$select4, input$select5,  # example of using more than one
                           input$num4, input$num5)
    
    # 6) The 6th script can do final modifications or simply return the workbook
    wb <- finalizeWorkbookFunction(wb)
    
    # Store the workbook in the reactiveVal so it can be downloaded
    wb_reactive(wb)
  })
  
  # Download handler uses the workbook from wb_reactive
  output$downloadExcel <- downloadHandler(
    filename = function() {
      paste0("myWorkbook.xlsx")
    },
    content = function(file) {
      # If the workbook is not yet generated, do nothing
      wb <- wb_reactive()
      if (is.null(wb)) {
        showNotification("Please click 'Generate Excel Workbook' first.", type = "error")
        return(NULL)
      }
      
      # Save the workbook to the specified file
      openxlsx::saveWorkbook(wb, file = file, overwrite = TRUE)
    }
    
  )
}

# Run App
shinyApp(ui = ui, server = server)
