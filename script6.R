# script6.R
# Finalizes or "returns" the workbook object

finalizeWorkbookFunction <- function(wb) {
  # This function could do additional formatting, auto-sizing columns, etc.
  # For now, we just demonstrate that it's a separate step.
  
  library(openxlsx)
  
  # Example: auto-size columns in each worksheet
  sheets <- sheets(wb)
  for (sht in sheets) {
    setColWidths(wb, sheet = sht, cols = 1:2, widths = "auto")
  }
  
  # Return the final workbook object
  return(wb)
}
