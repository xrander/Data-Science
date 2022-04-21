library(tidyverse)
library(dslabs)
data(heights)
prop.table(table(heights$sex))

#a <- seq(min(my_data), max(my_data), length = 100) formular for cdf

'cdffunction <- function(x){
mean(my_data <=x)'

#} to compute the probability for a single value
#cdf_values <- sapply(Aa, cdffunction)
#plot (a, cdf_values)

data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]

#Male and Female Percentiles
female_percentiles <- quantile(female, c(0.1, 0.3, 0.5, 0.7, 0.9))
male_percentiles <- quantile(male, c(0.1, 0.3, 0.5, 0.7, 0.9))

df <- data.frame(male = male_percentiles, female = female_percentiles)

#printing new dataframe

female_percentiles <- quantile(female, c(0.1, 0.3, 0.5, 0.7, 0.9))
male_percentiles <- quantile(male, c(0.1, 0.3, 0.5, 0.7, 0.9))
male
mean(male)
sd(male)

#obtaining standard unit
#standard units describe the number of standard deviations an observation is from the mean
#it's denoted by Z. Z are useful for evaluating whether an observation is average or extreme.
#scale() is used to convert to z-scores

#calculating propotion of a value in a set of given observation.
#the pnorm function is used. pnorm(x, mean(x),sd(x))
x <- heights %>% filter(sex == 'Female') %>% pull(height)

#Getting the exact value between values of interest, this is also called normal approximation
"mean(variable_name>value & mean variable_name > value)"

#Apporximation
"pnorm(value, mean(variable_name),sd(variable_name)) - pnorm(value, mean(variable_name),sd(variable_name))"
pnorm(70.5, mean(x), sd(x))

table(x)
#plotting distribution of exact heights in data
plot(prop.table(table(x)), xlab = "a = Height in inches", ylab = "Pr(x = a)")
mean(x <= 68.5) - mean(x <= 67.5)

#QUANTILES
#Quantiles
#they are cutoff points that divide a dataset into intervals with set probabilities.
#the qth  quantile is the value at which q% of the observation are equal to or less than that value
#quantile(data,q)


#PERCENTILES
# they are the quantiles that divide a dataset into 100 intervals each with 1% probability. determined by:
# p <- seq(0.01, 0.9, 0.01)
#quantile(data, p)

#QUARTILES
#They divide a dataset into 4 parts each with 25% probability.
#the summary() function returns the minimum, quartiles and maximum of a vector.

library(dslabs)
data(heights)
summary(heights$height)
p <- seq(0.01, 0.99, 0.01)
percentiles <- quantile(heights$height, p)
percentiles[names(percentiles) == '10%']
percentiles[names(percentiles) == '35%']


#FINDING QUANTILES WITH QNORM()

#QNORM
#the qnorm() gives the theoretical value of a quantile with probabity *p* of 
# observing a value equal to or less than the quantile value given a normal 
# distribution with the mean and the sd (standard deviation).
# qnorm(p, mean, sd)
#by default, sd = 1 and mean = 0, and when qnorm() is called with no arguments
# we get the quantiles for the standard normal distribution

#RELATION TO PNORM
# pnorm() gives the probability that a value from a standard normal distribution
# will be less than or equal to a z-score value
# pnorm() and qnorm() are inverse functions

#QUANTILE-QUANTILE PLOT
index <- heights$sex == 'Male'
x <- heights$height[index]
z <- scale(x)
mean(x <= 69.5)
p <- seq (0.05, 0.95, 0.05)
observed_quantiles <- quantile(x,p)
throretical_quantiles <- qnorm (p, mean = mean(x), sd = sd(x))
plot(throretical_quantiles, observed_quantiles)
abline(0,1)