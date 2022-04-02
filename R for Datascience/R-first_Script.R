library('tidyverse', 'dslabs')
data(murders)

murders %>%
  ggplot(aes(population,total, label=abb, color=region))+
  geom_label()
#assignment symbol in R <- it is better than using the '=' sign
#which causes confusion
#args(fn) shows how a function works
#class() this helps us determine the type of objects just like type in python
#str() which stands for the structure of an object gives us the property of an object
#var.shape in python pandas gives the number of rows and columns
#to access variables we use the assessor $, e.g murder$population
#names of column can be got using the names() functions
#length do determine the length, easy! Just like using len in python
#factors is a data or class type in R. It is useful for storing categorical data like Male, Female, Do not want to say
#The levels of factors are usually stored as integers in the background just like in SPSS
#parentheses () are used alongside functions
# [[]] double square brackets can be used in place of $
#two see if two variables are similar, the function identical() can be used

