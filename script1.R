# script1.R
# Creates the workbook

createWorkbookFunction <- function() {
  # Load the required library if not already
  library(openxlsx)
  
  # Create a new workbook
  wb <- createWorkbook()
  
  # Optionally, you can add some global styles, etc. here
  
  # Return the new workbook object
  return(wb)
}
