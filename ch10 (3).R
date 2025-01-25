library(dplyr)
sales <- vroom::vroom(
  "sales_data_sample (ch10).csv",
  col_types = list(),
  na=""
)
sales %>%
  select(TERRITORY, CUSTOMERNAME, ORDERNUMBER, everything()) %>%
  arrange(ORDERNUMBER)
