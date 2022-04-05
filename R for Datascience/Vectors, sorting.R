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
#sort() sorts vector in increasing order.
#order() takes a vector and sorts it according to the indices of the vector
f <- c(100:10)
f
sort(f)
order(f)
x <- c(10,5,15,29)
index <- order(x)
order(x)

library(dslabs)
data(murders)
#max() is used to get the highest while which.max() gives the index og the highest
#min can be used fot the same
#rank() for any given list, it gives a vector of rank, it is similar to using index
'
> murders$population
[1]  4779736   710231  6392017  2915918 37253956  5029196  3574097
[8]   897934   601723 19687653  9920000  1360301  1567582 12830632
[15]  6483802  3046355  2853118  4339367  4533372  1328361  5773552
[22]  6547629  9883640  5303925  2967297  5988927   989415  1826341
[29]  2700551  1316470  8791894  2059179 19378102  9535483   672591
[36] 11536504  3751351  3831074 12702379  1052567  4625364   814180
[43]  6346105 25145561  2763885   625741  8001024  6724540  1852994
[50]  5686986   563626
> min_pop <- order(murders$population)
> min_pop
[1] 51  9 46 35  2 42  8 27 40 30 20 12 13 28 49 32 29 45 17  4 25
[22] 16  7 37 38 18 19 41  1  6 24 50 21 26 43  3 15 22 48 47 31 34
[43] 23 11 36 39 14 33 10 44  5
> min(min_pop)
[1] 1
> min_pop[1]
[1] 51
'
murders$state[which.max(murders$population)]
pop_index = order(murders$population)
df_states <- data.frame(name = murders$state[pop_index], population = murders$population[pop_index], total = murders$total[pop_index])
df_states
murders

# Vector Arithmethics
# getting the murder rate in the US
murder_rate <- murders$total/murders$population * 100000
murder_rate
#ordering states according to their murder rate
murders$state[order(murder_rate,decreasing = TRUE)]
#data frame with murder rate per 100000 with compared to population total
df_mr <- data.frame(state = murders$state[order(murder_rate)], population = murders$population[order(murder_rate)], rate = murder_rate)
df_mr
mean(murder_rate)