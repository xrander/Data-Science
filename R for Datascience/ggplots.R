library(tidyverse)

library(dplyr)

library(dslabs)

data(murders)

r <- murders %>% summarize (rate =sum(total)/sum(population)*1000000) %>% .$rate

p <- murders %>% ggplot(aes(population/10^6, total, label = abb))

m <- p + geom_abline(intercept = log10(r), lty = 2, color = 'red') +
  geom_point(aes(col = region), size = 2)+  geom_text(nudge_x = 0.06) +
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

#west developing countries chart
west <- c('Northern America', 'Northern Europe', 'Western Europe', 'Eastern Asia', 'Australia and New Zealand')

gapminder %>% filter(year == 2010 & !is.na(gdp)) %>% mutate(group = ifelse(region%in%west, 'West','Developing')) %>% ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth = 1, color = 'violet')+
  scale_x_continuous(trans = 'log2') +
  facet_grid(.~group)

#comparison of wealth distribution between years
gapminder %>% filter(year%in%c (2005, 2010) & !is.na(gdp)) %>% mutate(group = ifelse(region%in%west, 'West','Developing')) %>% ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth = 1, color = 'violet')+
  scale_x_continuous(trans = 'log2') +
  facet_grid(year~group)

countries_1 <- gapminder %>% filter(year==2005 & !is.na(dollars_per_day)) %>% .$country

countries_2 <- gapminder %>% filter(year==2010 & !is.na(dollars_per_day)) %>% .$country

country_list <- intersect(countries_1, countries_2)

gapminder %>% filter(year %in% c(2005, 2010) & country%in%country_list) %>% mutate(group = ifelse(region%in%west, 'West','Developing')) %>% ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth = 1, color= 'black', fill = 'red')+
  scale_x_continuous(trans = 'log2') +
  facet_grid(year~group)

#side by side comparison
gapminder %>% filter(year%in%c(2005, 2010) & !is.na(gdp)) %>%  mutate(region = reorder(region,dollars_per_day, FUN = median)) %>%  ggplot() +
  geom_boxplot(aes(region, dollars_per_day, fill = factor(year))) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab('') +
  scale_y_continuous(trans='log2')

#smooth density with counts on y-axis
gapminder %>% filter(year = 2010 & country%in%country_list)%>%mutate(group = ifelse(region%in%west, 'West','Developing'))%>%ggplot(aes)

#Smooth density plots
gapminder %>% filter(year == 2010 & country %in% country_list) %>% mutate(group = ifelse(region %in% west, "West", "Developing")) %>% group_by(group) %>% summarize(n = n()) %>% knitr::kable()
'areas under each plots add to one'
gapminder %>% filter(year%in%c(1980, 2000) & !is.na(dollars_per_day)) %>% ggplot(aes(x=dollars_per_day, fill = year))+
  geom_density() + facet_grid(year~.)

v <- gapminder%>%filter(year%in%c(2005,2010) & country%in%country_list) %>% mutate(group=ifelse(region%in%west, 'West', 'Developing')) %>% ggplot(aes(dollars_per_day, y=..count.., fill= group))+
  scale_x_continuous(trans='log2')

v+geom_density(alpha=0.2, bw=0.5) +
  facet_grid(year~.)

#using case_when function to define groups
gapminder <- gapminder %>% mutate(group = case_when( .$region%in%west ~ 'West', .$region%in%c('Eastern Asia','South-Eastern Asia') ~ 'East Asia',
                                                     .$region%in%c('Caribbean', 'Central America', 'South America') ~ 'Latin America',
                                                     .$continent == 'Africa'&.$region != 'Northern Africa' ~ 'Sub-Saharan Africa', TRUE ~ 'Others'))
#creating levels using factor from the groups
gapminder <- gapminder%>%mutate(group = factor(group, levels = c('West','Latin America', 'Sub-Saharan Africa', 'Others', 'East Asia')))

#Redefining v
v <- gapminder%>%filter(year%in%c(2005,2010) & country%in%country_list)%>% ggplot(aes(dollars_per_day, y=..count.., fill= group))+
  scale_x_continuous(trans='log2')

#making stacked density plot
v + geom_density(alpha = 0.3, bw = 0.75, position = 'stack') +
  facet_grid(year~.)
#weighted stacked density plot
gapminder %>% filter(year%in%c(2005, 2010) & country %in% country_list) %>% group_by(year)%>% mutate(weight = population/sum(population*2))%>%
  ungroup() %>% ggplot(aes(dollars_per_day, fill=group, weight=weight)) +
  scale_x_continuous(trans = 'log2') + 
  geom_density(alpha = 0.2, bw=0.75, position='stack')+
  facet_grid(year~.)
