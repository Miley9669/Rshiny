# script2.R
# Adds the first worksheet

addWorksheetOne <- function(wb, selectInputValue, numericInputValue) {
  library(openxlsx)
  
  # Create a new worksheet
  addWorksheet(wb, "Sheet1")
  
  # For demonstration, we'll just write the input values to the sheet
  data_to_write <- data.frame(
    Parameter = c("Select Input 1", "Numeric Input 1"),
    Value = c(selectInputValue, numericInputValue)
  )
  
  # Write the data to the sheet
  writeData(wb, sheet = "Sheet1", x = data_to_write, startCol = 1, startRow = 1)
  
  # Return the updated workbook
  return(wb)
}
