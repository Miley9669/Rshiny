# script3.R
# Adds the second worksheet

addWorksheetTwo <- function(wb, selectInputValue, numericInputValue) {
  library(openxlsx)
  
  addWorksheet(wb, "Sheet2")
  
  data_to_write <- data.frame(
    Parameter = c("Select Input 2", "Numeric Input 2"),
    Value = c(selectInputValue, numericInputValue)
  )
  
  writeData(wb, sheet = "Sheet2", x = data_to_write, startCol = 1, startRow = 1)
  
  return(wb)
}
