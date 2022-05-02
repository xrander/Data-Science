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
suits <- c('Diamonds', 'Clubs','Hearts', 'Spades')
numbers <- c('Ace', 'Deuce', 'Three', 'Four', 'Five','Six','Seven',
             'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King')

deck <- expand.grid(number=numbers, suit=suits)

deck <- paste(deck$number, deck$suit)                       

#Probability for selecting a king at first draw
kings <- paste('King', suits)

mean(deck %in% kings)

# PROBABILITY FOR SELECTING KING ON A SECONF DRAW WITHOUT REPLACEMENT

#code for all the permutation of all the cars
card <- permutations (52, 2, v=deck)

#Grabbing the first and second column
first_card <- card[,1]
second_card <-card[,2]

# here the first_card variable takes value from the first column while the
# second_Card variable takes value from the second column.

#to check the first_card that is a king
sum(first_card%in%kings)

#to check the probability of a selecting a king in the second card given
# the first card selected was king is given below
sum(first_card%in%kings & second_card%in%kings) /
  sum(first_card%in%kings)

# The code above is synonymous to 
mean(first_card%in% kings & second_card%in%kings) /
mean(first_card%in%kings)

## Combination
combinations(5,2)

#To compute all the natural 21
aces <- paste('Ace', suits)
facecard <- c('King', 'Queen', 'Jack', 'Ten')
facecard<- expand.grid(number = facecard, suit = suits)
facecard <- paste(facecard$number, facecard$suit)
card_hands <- combinations(52,2, v =deck)

#result for the first card drawn being ace and the second a facecard
mean(card_hands[,1] %in% aces & card_hands[,2] %in% facecard)

#using a monte carlo to draw natural 21
hand <- sample(deck,2)
#for proportion of getting a 21
R <- 100000
mc <- replicate(R, {
  hand <- sample(deck,2)
  (hand[1]%in% aces & hand[2] %in% facecard)|
    (hand[2] %in%aces & hand[1] %in% facecard)
  })
mean(mc)
