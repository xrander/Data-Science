codes <- c(234, 45, 49)
countries <- c('nigeria', 'denmark', 'germany')
# we can use the names() function to assign names to entries of a vector
names(codes) <- countries
countries
codes
#seq can be used like range in python
seq(1,10)
1:10
codes[3]
codes[c(1,3)]
codes[c(1:3)]
#as.character and as.numeric functions as str() and int() in python
#the : operator helps us to create a sequence of numbers
#length.out argument lets us generate sequences that are increasing
#by the same amount but are of the prespecified lenght
x <- seq(0,100, length.out =5)
#it's similar to creating multiples of x, as it can sometimes spread a number
#out within the length.out to the last figure
#to create an integer class in R we add an L in front of the number
y <- 3L
y
