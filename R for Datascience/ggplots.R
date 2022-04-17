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