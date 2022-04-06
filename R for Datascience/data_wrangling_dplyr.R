#data_Wrangling
#for this, dplyr library will be introduced
install.packages('dplyr')
library(dplyr)
'
mutate() - change data table by adding a new column or changing existing column
select() - to subset data by selecting specific columns
filter()- to filter data by subsetting rows
%>% - called the pipe operator, and similar to | pipe in git'
library(dslabs)
data(murders)
#mutate will help create a new column name called rate below
murders <- mutate(murders, rate = total/population*100000)
murders
#using the filter() function
filter(murders, rate <= 0.71)
new_table <- select(murders, state, region, rate)
filter(new_table, rate <= 0.71)
murders %>% select(state, region, rate) %>% filter(rate <=0.71)
#when we use the pipe function (%>%) we no longer need to specify what should be
#operated on as the dplyr functions assumes that whatever is being piped is what
#should be operated on.

#CREATING DATAFRAME
#data.frame() is the function mostly used.
#data.frame() by default turns character into factors. To avoid this we add an argument
biodata <- data.frame(name = c('Christianah', 'Michael', 'Emmanuel', 'Motunrayo'),
                        age = c(27, 25, 34, 27),
                        sex = c('Female', 'Male', 'Male', 'Female'))
biodata
#if the class of the variable is factor it can be changed using the argument (stringsAsFactors=False)
my_state <- mutate(murders, rate= total/population *150000, rank = rank(-rate)) %>% filter(region %in% c('Northeast', 'South'), rate < 1) %>% select(state, abb, rank, rate)
my_state
