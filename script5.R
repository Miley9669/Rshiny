# script5.R
# Adds the fourth worksheet (example with multiple inputs)

addWorksheetFour <- function(wb, selectInputValue1, selectInputValue2,
                             numericInputValue1, numericInputValue2) {
  library(openxlsx)
  
  addWorksheet(wb, "Sheet4")
  
  data_to_write <- data.frame(
    Parameter = c("Select Input 4", "Select Input 5",
                  "Numeric Input 4", "Numeric Input 5"),
    Value = c(selectInputValue1, selectInputValue2,
              numericInputValue1, numericInputValue2)
  )
  
  writeData(wb, sheet = "Sheet4", x = data_to_write, startCol = 1, startRow = 1)
  
  return(wb)
}
