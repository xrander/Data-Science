library(tidyverse)
library(dslabs)
data(murders)
r <- murders %>% summarize (rate =sum(total)/sum(population)*1000000) %>% .$rate
p <- murders %>% ggplot(aes(population/10^6, total, label = abb))
m <- p + geom_abline(intercept = log10(r), lty = 2, color = 'red') +
  geom_point(aes(col = region), size = 2)+
    geom_text(nudge_x = 0.06) +
  scale_x_continuous(trans = 'log10') +
  scale_y_continuous(trans = 'log10') +
  xlab('Populations in millions (log scale)') + 
  ylab('Total number of murders(log scale)') +
  ggtitle('US GUN MURDERS IN 2010') +
  scale_color_discrete(name = 'Region')
print(m)
library(ggthemes)
library(ggrepel)
m + theme_economist()
library(dslabs)
data("gapminder")
head(gapminder)
tail(gapminder)
#to get the mortality rate of two countries from gapminder data
gapminder %>% filter(year== 2011 & country %in% c('Nigeria', 'Ghana')) %>% select(country, infant_mortality)
gapminder %>% filter(year == 2010) %>%ggplot(aes(fertility, life_expectancy, color = continent)) + 
  geom_point()
#faceting
# comparing across continents and across select years
gapminder %>% filter(year%in% c(2005, 2010, 2015)) %>%ggplot(aes(fertility, life_expectancy, color = continent))+
  geom_point() + facet_grid(continent~ year)+ ggtitle ('Comparison of continents Life expentancy and fertility of 5 years interval from 2005 to 2015')
#to have a viewable dimension, we use facet_wrap()
#comparing across all continents across specific years
gapminder %>% filter(year%in% c(1995, 2000, 2005, 2010, 2015)) %>%ggplot(aes(fertility, life_expectancy, color = continent))+
  geom_point() + facet_wrap(.~ year) + ggtitle('Life expentancy and fertility of 5 years interval from 2005 to 2015')
#TIME SERIES PLOT
gapminder %>% filter (country == 'Denmark') %>% ggplot(aes(x=year,y= fertility)) +
  geom_line()
#for two countries
gapminder %>% filter (country == c('Denmark','Nigeria')) %>% ggplot(aes(x=year,y= fertility, color = country)) +
  geom_line()
#Adding labels to the map
countries <- c('South Korea', 'Germany')
labels <- data.frame(country = countries, x = c(1975, 1965), y = c(60, 72))
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, life_expectancy, col = country)) +
  geom_line() +
  geom_text(data = labels, aes(x, y, label = country), size = 5) +
  theme(legend.position = "none")
#Gapminder GDP Transformation
gapminder <- gapminder %>% mutate(dollars_per_day = gdp/population/365)
gapminder %>% filter(year == 2010 & !is.na(gdp)) %>% ggplot(aes(dollars_per_day)) +
   geom_histogram(binwidth = 1, color = 'green')
#transforming into log2
gapminder %>% filter(year == 2010 & !is.na(gdp)) %>% ggplot(aes(log2(dollars_per_day))) +
  geom_histogram(binwidth = 1, color = 'green')
#boxplot and stratification
length(levels(gapminder$region))
m <- gapminder %>% filter(dollars_per_day & !is.na(dollars_per_day), region %in% c('Eastern Africa', 'Western Africa', 'Northern Africa', 'Southern Africa'))
m
m %>% ggplot(aes(region, dollars_per_day)) + geom_boxplot()
gapminder %>% filter(year == 2010 & !is.na(gdp)) %>%  mutate(region = reorder(region,dollars_per_day, FUN = median)) %>%  ggplot(aes(region, dollars_per_day, fill = continent)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab('') +
  scale_y_continuous(trans='log2')
