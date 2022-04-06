#using logical operators to index vectors
library(dslabs)
data(murders)
murder_rate <- murders$total/murders$population * 100000
index <- murder_rate <= 0.71
index
#we can count the number of true using the code line below
sum(index)
#To get the states which are true
safe <- murders$state[index]
safe
west <- murders$region == 'West'
indexe <- index & west
safe_state <- murders$state[indexe]
safe_state

#index functions
#which, %in%, match
#which can be used to get the index of values that are only true.
abbs <- match(c('AK', 'MI', 'IA', 'WI'), murders$abb)
murders$state[abbs]
ind <- which(!abbs%in%murders$abb)
ind
abbs[ind]

