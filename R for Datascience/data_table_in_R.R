library(tidyverse)
library(dslabs)
library(data.table)
data(murders)
#mutate, filter, select, group_by and summarize will be used
#first step when using data.table is to cover the data.frame to data.table objects
#setDT
murders <- setDT(murders)
#selecting in data.table
#method 1
murders[, c('state', 'region')] |> head()
#method 2 using dot(.) the  quotation marks are not needed
murders[, .(state, region)] |> head()
#adding or changing column in data.table
# := is update by reference
murders[, rate :=total/population *100000] |> head()
#for multiple columns, ":=" is used data.table is designed to avoid memory wastage
murders[, ":="(rate = total/population * 10^5, rank = rank(population))] |> head()
#changes in data.table is usually referenced between a xy relation copy() is used to actually create a new copy

# SUBSETTING
#Subsetting data for dplyr it is filter(murders, rate <= 0.7)
murders[rate <= 0.7] |> head()
# combining filter and select murders %>% filter(rate <= 0.7) %>% select(state, rate)
murders[rate <=0.7, c('state', 'rate')]

# SUMMARIZING
data("heights")
heights <- setDT(heights)
s <- heights[, .(average=mean(height), standard_deviation=sd(height))]
s <- heights[sex == 'Female', .(average = mean(height), standard_deviation = sd(height))]
median_min_max <- function(x){
  qs <- quantile(x, c(0, 0.5, 1))
  data.frame(median = qs[2], minimum= qs[1], maximum = qs[3])
  }
heights [, .(median_min_max(height))]
#by is used to split data by a variable
heights [, .(average=mean(height), standard_deviation = sd(height)), by = sex]

## Sorting data frames
murders[order(population, decreasing=TRUE)]
#nested ordering
murders[order(region, rate)] |> head()
