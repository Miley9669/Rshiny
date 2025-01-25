min<-1
diamonds %>% filter(carat>min)
diamonds[diamonds$carat > min, ] #compare to base R function
var<-"carat"
diamonds[diamonds[[var]]>min, ]#way to use indirection in base R

diamonds %>% filter(.data$carat > .env$min) #same thing as line 2 but explicitly noting the variable type for each var
diamonds %>% filter(.data[[var]] > .env$min) #way to refer to carat indirectly
diamonds %>% filter(.data[[var]] > .env$min)

x<-c("mpg", "cyl")
mtcars %>% 
  group_by(across(all_of(x))) %>% 
  summarise(n = n(), .groups = "drop")

mtcars %>% 
  group_by(all_of(x)) %>%  #This returns an error, nto sure why
            #It's because the function has string terms. 
  summarise(n = n(), .groups = "drop")

mtcars %>% 
  group_by(mpg, cyl) %>%  #This runs w/out an issue
  summarise(n = n(), .groups = "drop")
