library(dslabs)
library(dplyr)
data("murders")

pop_in_mil <- murders$population/1000000

total_gun_murders <- murders$total

#scattered plot
plot(pop_in_mil, total_gun_murders, color)

#result shows strong relationship between the population and the gun murder in a state
murder_rate <- total_gun_murders/murders$population *1000000
plot(pop_in_mil, murder_rate)

#histogram
hist(murders$rate)
murders$state[which.max(murders$rate)]

#boxplot
boxplot(rate~region, data = murders)

#log_10 transformation
log10_pop <- log(murders$population, 10)
log10_total_gun_murders <- log(total_gun_murders, 10)

plot(log10_pop, log10_total_gun_murders)
