# if else statement
a <- 10
'#if (boolean condition){
  expressions
} else{
alternative expressions
}'
if (a!=0){
  print(1/a)
} else {
  print('error')
}
library(dslabs)
library(dplyr)
data(murders)
murder_rate <- murders$total/murders$population *10^5
ind <- which.min(murder_rate)
if (murder_rate[ind] < 0.5){
  print(murders$state[ind])
} else{
  print('No state has a murder rate below that')
}
#ifelse() works similarly to elif in python, but with a little twist here
# ifelse() is useful for vectors
data("na_example")
no_nas <- ifelse(is.na(na_example), 0, na_example)
#this means if its NA in the na_example, return 0, else, return the value of na_example

#any works like or while all works like and



#functions
avg <- function(x){
  s<- sum(x)
  l<- length(x)
  s/l
}
x <- 1:10
avg(x)


#for loops
cs_n <- function(n){
  x <- 1:n
  sum(x)
}
cs_n(20)
m <- 25
s_n <- vector(length=m)
for (n in 1:m){
  s_n[n] <- cs_n(n)
  print(s_n)
}
n <- 1:m
n
plot(n,s_n)
lines(n, n*(n+1)/2)
altman_plot <- function(x,y){
  x_axis <- x+y
  y_axis <- y-x
  plot(x_axis, y_axis)
}
altman_plot2<- function(x,y){
  plot(x+y, y-x)
}
inches_to_ft <- function(x){
y <- x/12
y
}
inches_to_ft(144)
