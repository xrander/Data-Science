#summarizing data
#we have median, mean and stdev among others
#we use group_by, summarize, pull, dot placeholder and arrange
library(dplyr)
library(dslabs)
data(murders)
murders <- mutate(murders, rate = total/population *10^5)
a <- murders %>%
  filter(region == 'West') %>%
  summarize(minimun = min(rate),
            maximum = max(rate),
            median = median(rate),
            mean = mean(rate))
a
#quantile function
#the quantile function produces the variable range which we want usually from 0-1
quantile(x, c(0, 0.5, 1))
#the result provided is usually in vectorm, to make it a dataframe we have to call a function
my_quantile <- function(x){
  r <- quantile(x,c(0,0.5,1))
  data.frame(minimum = r[1], median = r[2], maximum =r[3])
}
murders %>%
  filter(region == 'West') %>%
  summarize(my_quantile(rate))

#Pull to Access Column
us_md_rate <- murders %>%
  summarize (rate= sum(total)/sum(population) * 10^5)
us_md_rate
class(us_md_rate)
'
"data.frame"
'
#the class is saved as a data.frame to make it a vector we can use the pull function
us_md_rate <- murders %>%
  summarize(rate = sum(total)/sum(population) * 10^5) %>%
  pull(rate)
us_md_rate
class(us_md_rate)
#the class is now numeric
#The dot placeholder
#the dot is a placeholder for data that's being piped
us_md_rate <- murders %>%
  summarize(rate = sum(total)/sum(population) * 10^5) %>%
  .$rate
us_md_rate
#the group_by() function
murders %>% group_by(region)
murders %>%
  group_by(region) %>%
  summarize (median = median(rate))
#Sorting table
#arrange is useful for ordering an entire table
murders %>% arrange(population) %>% head()
murders %>% arrange(desc(population)) %>% head()
murders %>% arrange(region, state)%>% head(20)
murders %>% arrange(region, state)
#top_n function
murders%>%top_n(10,rate)
murders %>% arrange(desc(rate)) %>% top_n(10, rate)


NHANES %>% filter(AgeDecade == '40-49', Gender == 'male') %>% group_by(Race1) %>% summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE)) %>% arrange(average)