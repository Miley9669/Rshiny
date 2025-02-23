library(shiny)

ui<- fluidPage(
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload CSV", accept = ".csv"),
      selectInput("variable", "Select Variable", choices = NULL)
    ),
    mainPanel(
      verbatimTextOutput("results")
      
    )
  )
  
  
)

server<-function(input, output, session) {
  data<- reactive({
    req(input$file)
    ext<-tools::file_ext(input$file$name)
    
    validate(need(ext=="csv", "Invalid file. Please upload a .csv file"))

    dataset <- vroom::vroom(input$file$datapath, delim = ",")
    validate(need(ncol(dplyr::select_if(dataset, is.numeric)) != 0,
             "This dataset has no numeric columns."))
    dataset
    
    
  })
  
  observeEvent(input$file, {
    req(data())
    num_cols<-dplyr::select_if(data(), is.numeric)
    updateSelectInput(session, "variable", choices = colnames(num_cols))
  })
  
  output$results<-renderPrint({
    if(!is.null(input$variable))
       t.test(data()[input$variable])
  })

}

shinyApp(ui, server)