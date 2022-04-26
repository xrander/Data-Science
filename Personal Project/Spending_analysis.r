library(tidyverse)
library(dplyr)

#Loading tab_Delimited file
self_data <- read.delim(file = '/home/xrand/Documents/Personal Project/self_analysis.txt')

#previewing self_data
str(self_data)
head(self_data)
tail(self_data)

#removing _empty spaces by slicing
self_data <- self_data[1:240, 1:9]

#previewing new_data
head(self_data)
tail(self_data)

#Converting NAs to 0.00
self_data$Earnkr <- ifelse(is.na(self_data$Earnkr)== TRUE, 0.00, self_data$Earnkr)
self_data$Spendingkr <- ifelse(is.na(self_data$Spendingkr)== TRUE, 0.00, self_data$Spendingkr) 

str(self_data)
#analyzing mean_spending per month
mean_expenditure <- self_data %>%
  group_by(Month) %>%
  summarize (mean_spending = mean(Spendingkr),
             standard_deviation_spending = sd(Spendingkr),
             standard_deviation_earning = sd(Earnkr),
             mean_earning = mean(Earnkr))

mean_expenditure

ggplot(mean_expenditure, aes(mean_earning, mean_spending, color = Month)) +
  geom_point()
             
             
#Savings
sum(self_data$Earnkr) - sum(self_data$Spendingkr)

self_data$Month <- as.factor(self_data$Month)
str(self_data)


month_expenditure <- self_data %>%
  select(Month) %>%
  group_by(Month)
  


month_expenditure  
