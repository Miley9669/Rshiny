

#Note: I tried to use this url and it returned html code: https://github.com/hadley/mastering-shiny/blob/main/sales-dashboard/sales_data_sample.csv

download.file("https://raw.githubusercontent.com/hadley/mastering-shiny/main/sales-dashboard/sales_data_sample.csv", "sales_data_sample.csv", quiet = TRUE)

sales <- readr::read_csv("sales_data_sample.csv")
sales <- sales[c(
  "TERRITORY", "ORDERDATE", "ORDERNUMBER", "PRODUCTCODE",
  "QUANTITYORDERED", "PRICEEACH"
)]
sales
unique(sales$TERRITORY)
sales[sales$TERRITORY=="EMEA", ]
sales2 <- readr::read_csv("sales_data_sample.csv")
sales2[sales2$TERRITORY=="EMEA", ]
