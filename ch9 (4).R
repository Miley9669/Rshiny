report_path <- tempfile(fileext = ".Rmd")
file.copy("report.Rmd", report_path, overwrite = TRUE)
rmarkdown::render(report_path, 
                  output_file = file,
                  params = params,
                  envir = new.env(parent = globalenv())
)

ui <- fluidPage(
  sliderInput("n", "Number of points", 1, 100, 50),
  downloadButton("report", "Generate report")
)

server <- function(input, output, session) {
  output$report <- downloadHandler(
    filename = "report.html",
    content = function(file) { #i don't know where "file" is defined
      params <- list(n = input$n)
      
      id <- showNotification(
        "Rendering report...", 
        duration = NULL, 
        closeButton = FALSE
      )
      on.exit(removeNotification(id), add = TRUE)
      
      rmarkdown::render(report_path, #The code is returning an error because the report.Rmd
                        #file doesn't already exist. I don't get what the code is doing. Why does it 
                        #require the .Rmd file to exist in order to run? 
                        output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
      )
    }
  )
}
shinyApp(ui, server)