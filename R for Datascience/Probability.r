install.packages(gtools)
library(gtools)

options(digits = 3)

# Probability
beads <- rep(c('black', 'yellow', 'green'), times = c(5,8,7))
beads
# Sample 1 beads at random without replacement
sample(beads,1)

# Performing a Monte Carlo Simulation
# r is equal to the number of times we want to create a sample
r <- 100000

# code to repeat the random sample in r times
event <- replicate(r, sample(beads, 1))

#to see the distribution we use table
tab <- table(event)
tab

#to get the proportion, we use the prop. table
prop.table(tab)

#to randomly select a sample with replacement
events <- sample (beads, r, replace = TRUE)
prop.table(table(events))

# The code above helps to create replications without
# using the replicate() function

# SETTING RANDOM SEED
set.seed(1986)

#using mean() in probability
beads <- rep(c('yellow', 'blue'), times = c(4,6))

#printing variable
beads
#To find the probability of drawing a yellow, we can use the mean()
mean(beads == 'yellow')

#simple probability exercise
box <- rep(c('Cyan', 'Magenta', 'Yellow'), times = c(3,5,7))

#The probability of choosing a cyan ball
mean(box == 'Cyan')

#The probability of choosing a cyan ball at first draw and not choosing choosing
# a cyan ball at the second draw without replacement
mean(box == 'Cyan') * (1 - 2/14)

#The probability of choosing a cyan ball at first draw and not choosing choosing
# a cyan ball at the second draw with replacement
mean(box == 'Cyan') * (1 - mean(box == 'Cyan'))

#Combination and Permutation
#Generating decks of cards
suits <- c('Diamonds', 'Clubs', 'Hearts', 'Spades')
numbers <- c('Ace', 'Deuce', 'Three', 'Four', 'Five','Six','Seven',
             'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King')
deck <- expand.grid(number=numbers, suit=suits)
deck <- paste(deck$number, deck$suit)                       

#Probability for kings
kings <- paste('King', suits)
mean(deck %in% kings)
