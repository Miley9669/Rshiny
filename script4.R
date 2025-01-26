# script4.R
# Adds the third worksheet

addWorksheetThree <- function(wb, selectInputValue, numericInputValue) {
  library(openxlsx)
  
  addWorksheet(wb, "Sheet3")
  
  data_to_write <- data.frame(
    Parameter = c("Select Input 3", "Numeric Input 3"),
    Value = c(selectInputValue, numericInputValue)
  )
  
  writeData(wb, sheet = "Sheet3", x = data_to_write, startCol = 1, startRow = 1)
  
  return(wb)
}
