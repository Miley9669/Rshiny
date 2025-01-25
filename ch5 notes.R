f <- function(x) g(x)
g <- function(x) h(x)
h <- function(x) x * 2
f("a")
#The book says you can use traceback() to go through the steps, but I'm not getting that option here. 
#it's automatically going to a debug tab; ok, i tried it again and then it works

#can't use traceback() in shiny, but shiny will automatically provide the traceback for you