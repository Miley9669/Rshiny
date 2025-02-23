library(shiny)
library(ggplot2)

ui <- fluidPage(
  tagList(
    br(), br(), #the br() here just adds line breaks at the top of the app
    column(4,
           wellPanel(
             fileInput("file", "Upload CSV", accept = ".csv"),
             selectInput("variable", "Select Variable", choices = NULL),
           ),
           wellPanel(
             radioButtons("extension", "Save As:",
                          choices = c("png", "pdf", "svg"), inline = TRUE),
             downloadButton("download", "Save Plot")
           )
    ),
    column(8, plotOutput("results"))
  )
)

server <- function(input, output,session) {
  
  # get data from file
  data <- reactive({
    req(input$file)
    
    # as shown in the book, lets make sure the uploaded file is a csv
    ext <- tools::file_ext(input$file$name)
    validate(need(ext == "csv", "Invalid file. Please upload a .csv file"))
    
    dataset <- vroom::vroom(input$file$datapath, delim = ",")
    
    # let the user know if the data contains no numeric column
    validate(need(ncol(dplyr::select_if(dataset, is.numeric)) != 0,
                  "This dataset has no numeric columns."))
    dataset
  })
  
  # create the select input based on the numeric columns in the dataframe
  observeEvent( input$file, {
    req(data())
    num_cols <- dplyr::select_if(data(), is.numeric)
    updateSelectInput(session, "variable", choices = colnames(num_cols))
  })
  
  # plot histogram
  plot_output <- reactive({
    req(!is.null(input$variable))
    
    ggplot(data()) + #I tried to add aes(x=input$variable) into the ggplot() fuction and removed the 2nd line. 
        #It didn't work but I don't know why
      
      #I'm pretty sure this is because the input variable is a string, so needs to be converted. Not 100% sure because I 
      #haven't run into this before 
      aes_string(x = input$variable) +
      geom_histogram()
  })
  
  output$results <- renderPlot(plot_output())
  
  # save histogram using downloadHandler and plot output type
  output$download <- downloadHandler(
    filename = function() {
      paste("histogram", input$extension, sep = ".")
    },
    content = function(file){
      ggsave(file, plot_output(), device = input$extension)
    }
  )
}

shinyApp(ui, server)