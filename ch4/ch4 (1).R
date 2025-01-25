library(shiny)
library(vroom)
library(tidyverse)

dir.create("neiss")
#> Warning in dir.create("neiss"): 'neiss' already exists
download <- function(name) {
  url <- "https://github.com/hadley/mastering-shiny/raw/main/neiss/"
  ###I initially had "tree" in the url instead of "raw". When you use "raw" in the browser it takes you to the 
  #tree address, i.e., it replaces "raw" with "tree". But when I used the location with "tree" the downloads worked, 
  #but when I tried to import the files it gave me an error. But when I updated it to use "raw" instead, it 
  #worked correctly. Not sure why
  download.file(paste0(url, name), paste0("neiss/", name), quiet = TRUE)
}
download("injuries.tsv.gz")
download("population.tsv")
download("products.tsv")

injuries <- vroom::vroom("neiss/injuries.tsv.gz")
injuries

products <- vroom::vroom("neiss/products.tsv")
products

population <- vroom::vroom("neiss/population.tsv")
population

selected<- injuries %>% filter(prod_code ==649)#injuries by toilet
nrow(selected)
selected %>% count(location, wt=weight, sort=TRUE)
selected %>% group_by(location) %>% summarize(n()) #This is a way to count the number of rows in the group but i'm
  #not sure how to add in the weighting component here
selected %>% count(body_part, wt=weight, sort=TRUE)
selected %>% count(diag, wt=weight, sort=TRUE)

summary <- selected %>% 
  count(age, sex, wt = weight)
summary

summary %>% 
  ggplot(aes(age, n, colour = sex)) + 
  geom_line() + 
  labs(y = "Estimated number of injuries")

summary <- selected %>% 
  count(age, sex, wt = weight) %>% 
  left_join(population, by = c("age", "sex")) %>% 
  mutate(rate = n / population * 1e4)

summary


summary %>% 
  ggplot(aes(age, rate, colour = sex)) + 
  geom_line(na.rm = TRUE) + 
  labs(y = "Injuries per 10,000 people")

selected %>% 
  sample_n(10) %>% 
  pull(narrative)
