library(dslabs)

library(tidyverse)

data("us_contagious_diseases")

head(us_contagious_diseases)

tail(us_contagious_diseases)

str(us_contagious_diseases)

sum(is.na(us_contagious_diseases))

#creating a new variable to hold measles disease rate per 10000 removing Alaska and Hawaii and adjusting for weeks per week
sample <- us_contagious_diseases %>% filter(!state%in% c('Alaska', 'Hawaii') & disease == 'Measles') %>% mutate(rate = count/population * 10000 * 52/weeks_reporting) %>% mutate (state = reorder(state, rate))

#plot disease rates per year in Alabama
sample %>% filter(state == 'Alabama') %>% ggplot(aes(year, rate, label = state)) + geom_line()+ 
  xlab('Years') + ylab('Cases per 10000') +
  geom_vline(xintercept = 1963, color='red') + 
  ggtitle('Measles rates per year in Alabama')


#to show disease rate per year, three variables are used.
sample %>% ggplot(aes(year, state, fill = rate)) +
  geom_tile(color = 'grey50') +
  scale_x_continuous(expand = c(0,0)) +
  scale_fill_gradientn(colors= RColorBrewer::brewer.pal(9,'Greens'), trans = 'sqrt') +
  geom_vline (xintercept = 1963, col = 'Purple') +
  theme_minimal() +
  theme(panel.grid = element_blank()) + 
  ggtitle('Measles diseas in the US') +
  ylab('states')+
  xlab('years')

#Time series plot-all diseases in Alabama
us_contagious_diseases %>% filter(state=="Alabama", weeks_reporting >= 10) %>% 
  group_by(year, disease) %>%
  summarize(rate = sum(count)/sum(population)*10000) %>%
  ggplot(aes(year, rate, color = disease)) + 
  geom_line() + ggtitle('All diseases rate in Alabama')

# Time series plot-all diseases in the United States
us_contagious_diseases %>% 
  filter(!is.na(population)) %>% 
  group_by(year, disease) %>% 
  summarize (rate  = sum(count)/sum(population) * 10000) %>% 
  ggplot(aes(year, rate, color = disease)) +
  geom_line()

#titanic exercise
options(digits = 3)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

head(titanic)
str(titanic)
count_sex <- titanic %>%
  filter(!is.na(Age)) %>%
  group_by(Sex) %>% summarize(count = sum(length(Sex)))

count_sex

titanic %>%
  ggplot(aes(Age, fill = Sex)) +
  geom_density(alpha = 0.2) +
  facet_grid(Sex ~ .)

#using count
titanic %>%
  ggplot(aes(Age, y = ..count.., fill = Sex)) +
  geom_density(alpha = 0.2, position = "stack")

titanic %>%
  ggplot(aes(Age, fill = Sex)) +
  geom_density(alpha = 0.2)

params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))

#Age Distribution QQPLoT
titanic %>% ggplot(aes(sample = Age)) +
  geom_qq(dparams = params) +
  geom_abline()

#titanic survival bar plot
titanic %>% ggplot(aes(Sex, fill = Survived)) +
  geom_bar(position = position_dodge())


#Survival chances by age group
titanic %>% ggplot(aes(Age, y = ..count.., fill = Survived)) +
  geom_density(alpha = 0.2)

#Passenger survival in relation to fares paid
titanic %>% filter(Fare > 0) %>%
  ggplot(aes(Survived, Fare)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.2) +
  scale_y_continuous(trans = 'log2')

#passenger survival  by class
titanic %>% ggplot(aes(Pclass, fill = Survived)) +
  geom_bar()

titanic %>% ggplot(aes(Pclass, fill= Survived)) +
  geom_bar(position = position_fill())

titanic %>% ggplot(aes(Survived, fill = Pclass)) +
  geom_bar(position = position_fill())


titanic %>% ggplot(aes(Age, y = ..count.., fill = Survived)) +
  geom_density(alpha = 0.5) + facet_grid(Sex~Pclass)

#Second Assessment
library(dslabs)
data(stars)
options(digits = 3)
str(stars)
head(stars)

#mean and standard deviation of magnitude
mean(stars$magnitude)
sd(stars$magnitude)

stars %>% select (magnitude) %>% ggplot(aes(magnitude)) +
  geom_density()

stars%>% summarize(mean = mean(temp), mini = min(temp), max = max(temp))

#stars temperature distribution
stars %>% ggplot(aes(type,temp, color = magnitude)) +
  geom_point()

stars %>% ggplot(aes(temp, magnitude)) +
  geom_point()

#Stars luminoisty and temperature relationship
stars %>% ggplot(aes(temp, magnitude, color = magnitude)) +
  geom_point() +
  scale_x_continuous(trans = 'log10') + 
  scale_y_reverse() +
  scale_x_reverse()

## Climate change exercise
data("temp_carbon")
data("greenhouse_gases")
data("historic_co2")

head(temp_carbon)

y <- temp_carbon %>% filter(!is.na(temp_anomaly)) %>% select(year, temp_anomaly)

y %>% ggplot(aes(year, temp_anomaly)) + 
  geom_line() + 
  geom_hline (yintercept=0, col = 'blue')

y %>% ggplot(aes(year, temp_anomaly)) + 
  geom_line() + 
  geom_hline (yintercept=0, col = 'blue')

y %>% ggplot(aes(year, temp_anomaly)) + 
  geom_line() + 
  geom_hline (yintercept=0, col = 'blue') +
  ylab("Temperature anomaly (degrees C)") +
  ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018") +
  geom_text(aes(x = 2000, y = 0.05, label = "20th century mean"), col = "blue")

#20th century
twentieth_century <- c(1901:2000)

# mean of temperature anomaly
s <- mean(y$temp_anomaly)

#earliest year with temperature above the 20th century mean
y %>% filter(temp_anomaly >= s) %>% summarize(min_year = min(year))

#last year with temperature below the 20th century mean
y %>% filter(temp_anomaly <= s) %>% summarize (max_year = max(year))

# year where the temperature anomaly exceeded 0.5 degrees for the first time
y %>% filter (temp_anomaly >= 0.5) %>% summarize (first_year = min(year))

#adding land and ocean
temp_carbon %>%
  filter(year %in% c(1880:2020)) %>%
  ggplot() +
  geom_line(aes(year,temp_anomaly)) +
  geom_line(aes(year,ocean_anomaly),col="blue") +
  geom_line(aes(year,land_anomaly), col="brown") +
  geom_hline(yintercept = 0, col="black",alpha=0.5) +
  geom_vline(xintercept = 2018, col="black",alpha=0.5)

#using green house gases data
data("greenhouse_gases")
str(greenhou~se_gases)
head(greenhouse_gases)
tail(greenhouse_gases)

greenhouse_gases %>%
  ggplot(aes(year,concentration)) +
  geom_line() +
  facet_grid(gas~., scales = "free") +
  geom_vline(xintercept = 1850) +
  ylab("Concentration (ch4/n2o ppb, co2 ppm)") +
  ggtitle("Atmospheric greenhouse gas concentration by year, 0-2000")

temp_carbon %>%
  ggplot(aes(year,carbon_emissions)) +
  geom_line()

#year, co2, source

co2_time <- historic_co2 %>%
  ggplot(aes(year,co2,color=source)) +
  geom_line()


co2_time

co2_time_new <- historic_co2 %>%
  filter(year>1500) %>%
  ggplot(aes(year,co2,color=source)) +
  geom_line()

co2_time_new

historic_co2 %>%
  ggplot(aes(year,co2,color=source)) +
  geom_line() +
  xlim(-800000,-775000)

historic_co2 %>%
  ggplot(aes(year,co2,color=source)) +
  geom_line() +
  xlim(-375000,-330000)

historic_co2 %>%
  ggplot(aes(year,co2,color=source)) +
  geom_line() +
  xlim(-140000,-120000)

historic_co2 %>%
  ggplot(aes(year,co2,color=source)) +
  geom_line() +
  xlim(1700,2018)
