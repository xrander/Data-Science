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

n <- 50
bdays <- sample(1:365, n, replace = TRUE)
any(duplicated(bdays))
r <- 10000
results <- replicate(r,{
  bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))
})
mean(results)


#Sapply

compute_prob <- function(n, r = 10000){
  sameday <- replicate(r,{
    bdays <- sample(1:365,n, replace=TRUE)
    any(duplicated(bdays))
  })
  mean(sameday)
}

n <- seq(1:60)


prob <- sapply(n, compute_prob)
plot(n, prob)

exact_prob <- function(n){
  prob_unique <- seq(365, 365-n+1)/365
  1-prod(prob_unique)
}
ex_prob <- sapply(n, exact_prob)

#number of experiment s needed for a monte carlo simulation
B <- 10^seq(1, 5, len = 100)    # defines vector of many B values
compute_prob <- function(B, n = 22){    # function to run Monte Carlo simulation with each B
  same_day <- replicate(B, {
    bdays <- sample(1:365, n, replace = TRUE)
    any(duplicated(bdays))
  })
  mean(same_day)
}

prob <- sapply(B, compute_prob)    # apply compute_prob to many values of B
plot(log10(B), prob, type = "l")    # plot a line graph of estimates 

simulated_game <- sample(c('lose', 'win'), 4,
                         replace = TRUE, prob =c(0.6,0.4))
simulated_game

#In the 200m dash finals in the Olympics, 8 runners compete for 3 medals
#(order matters). In the 2012 Olympics, 3 of the 8 runners were from Jamaica
#and the other 5 were from different countries.
#The three medals were all won by Jamaica
#(Usain Bolt, Yohan Blake, and Warren Weir). 

#Use the information above to help you answer the following four questions.
#1. How many different ways can the 3 medals be distributed across 8 runners?
permutations(8,3)

#2 How many different ways can the three medals be distributed among the 3 runners 
#from Jamaica?
permutations(3,3)

#3. What is the probability that all 3 medals are won by Jamaica?
win_jam <- 3/8* 2/7 * 1/6
#prob. of any jamaican not winning
1-win_jam

#4. Run a Monte Carlo simulation on this vector representing the countries
# of the 8 runners in this race:
set.seed(1)

R <- 10000

results <- replicate(R, {
  win_jam <- 3/8 *2/7 *1/6
})

mean(results)


#another method
runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador",
             "Netherlands", "France", "South Africa")

outcome <- c('win','lose')

possible_results <- expand.grid(runner = runners, result = outcome)
possible_results <- paste(possible_results$runner, possible_results$result)

win_ja <- 'Jamaica win'
sum(possible_results %in% win_ja)
possible_results
paste(runners, outcome)
#unresolved

# RESTAURANT MANAGEMENT

# Use the information below to answer the following five questions.

#A restaurant manager wants to advertise that his lunch special offers
#enough choices to eat different meals every day of the year. He doesn't
#think his current special actually allows that number of choices, but
#wants to change his special if needed to allow at least 365 choices.

#A meal at the restaurant includes 1 entree, 2 sides, and 1 drink.
#He currently offers a choice of 1 entree from a list of 6 options,
#a choice of 2 different sides 
#from a list of 6 options, and a choice of 1 drink from a list of 2 options.

#1. How many meal combinations are possible with the current menu?
entree <- combinations (6,1)
sides <- combinations(6,2)
drinks <- combinations(2,1)
6 * nrow(sides) * 2

#2. The manager has one additional drink he could add to the special.
#How many combinations are possible if he expands 
#his original special to 3 drink options?
drinks_1 <- combinations(3,1)
6 * nrow(sides) * 3

#3. The manager decides to add the third drink but needs to expand 
#the number of options. The manager would prefer not to change his menu 
#further and wants to know if he can meet his goal by letting customers choose more sides.
# How many meal combinations are there if customers can choose 
# from 6 entrees, 3 drinks, and select 3 sides from the current 6 options?

sides_1 <- combinations(6,3)

6 *nrow(sides_1) * 3

#4. The manager is concerned that customers may not want 3 sides with their meal.
#He is willing to increase the number of entree choices instead, but if he adds
#too many expensive options it could eat into profits. He wants to know how many
# entree choices he would have to offer in order to meet his goal.
#- Write a function that takes a number of entree choices and returns the number
#of meal combinations possible given that number of entree options, 3 drink choices,
#and a selection of 2 sides from 6 options.
#- Use sapply() to apply the function to entree
#option counts ranging from 1 to 12.
#What is the minimum number of entree options required in order
#to generate more than 365 combinations?
entree_choices <- function(k){
  print(k * nrow(sides) * nrow(drinks_1))
}
options <- seq(1:12)

sapply(options, entree_choices)
'minimum number from result is 9'

#5. The manager isn't sure he can afford to put that many entree choices on the
#lunch menu and thinks it would be cheaper for him to expand the number of sides.
#He wants to know how many sides he would have to offer to meet his goal of at
#least 365 combinations.
#- Write a function that takes a number of side choices and returns the number
#of meal combinations possible given 6 entree choices, 3 drink choices, and
#a selection of 2 sides from the specified number of side choices
#- Use sapply() to apply the function to side counts ranging from 2 to 12.
#What is the minimum number of side options required in order to generate more
#than 365 combinations?


sides_choice <- function(w) {
  print(nrow(entree) * nrow(combinations(w,2)) * nrow(drinks_1))
}
options_sides <- seq(2,12)
sapply(options_sides, sides_choice)

# Esophageal cancer and alcohol/tobacco use, part 1

# Case-control studies help determine whether certain exposures are associated
#with outcomes such as developing cancer. The built-in dataset esoph contains 
#data from a case-control study in France comparing people with esophageal 
#cancer (cases, counted in ncases) to people without esophageal cancer 
#(controls, counted in ncontrols) that are carefully matched on a variety of 
#demographic and medical characteristics. The study compares alcohol intake in 
#grams per day (alcgp) and tobacco intake in grams per day (tobgp) across cases 
#and controls grouped by age range (agegp).
library(tidyverse)
head(esoph)
esoph
#1. How many groups are in the study?
str(esoph) 'this shows the number of observation '

#2. How many cases are there?
all_cases <- sum(esoph$ncases)

#3. How many controls are there?
all_controls <- sum(esoph$ncontrols)
all_controls

#4. What is the probability that a subject in the highest alcohol consumption
#group is a cancer case?

#to get the max alcohol consumption

max(esoph$alcgp)
esoph %>% filter(alcgp == '120+') %>%
  summarize(cases = sum(ncases),
            total = sum(ncontrols) + sum(ncases),
            probability = cases/total)

#5. What is the probability that a subject in the lowest alcohol consumption
#group is a cancer case?

#to get the min alcohol_consumption
min(esoph$alcgp)
esoph %>% filter(alcgp == '0-39g/day') %>%
  summarize (cases = sum(ncases),
            total = sum(ncontrols)+sum(ncases),
            prob = cases/total)

#6. Given that a person is a case, what is the probability that
#they smoke 10g or more a day?

#num of all cases of tobacco cases
all_cases_tob <-esoph %>% summarize(tot = sum(ncases))
greater_than_10g <- esoph %>% filter(tobgp != '0-9g/day') %>%
  summarize (total = sum(ncases))

#probability of tobacco greater or equal to 10g/day intake
probability = greater_than_10g/all_cases_tob
probability

#7. Given that a person is a control, what is the probability that they
#smoke 10g or more a day?

#sum of all controls
all_controls_tob <-esoph %>% summarize(tot = sum(ncontrols))

#sum of control greate than 10g per day
greater_than_10g_control <- esoph %>% filter(tobgp != '0-9g/day') %>%
  summarize (total = sum(ncontrols))

#probability they smoke 10g or more a day
greater_than_10g_control/all_controls_tob

#For cases, what is the probability of being in the highest alcohol group?

#8. For cases, what is the probability of being in the highest alcohol group?
#all cases
all_cases <- sum(esoph$ncases)
#high alcohol group total
high_alcgp <- esoph %>%
  filter(alcgp == '120+') %>%
  summarize (total = sum(ncases))
probability_high_alcgp <- high_alcgp/all_cases
probability_high_alcgp

#9. For cases, what is the probability of being in the highest tobacco group

#hihg tobacco group total
high_tobacoo <- esoph %>%
  filter(tobgp == '30+') %>%
  summarize(total = sum(ncases))

probability_high_tobgp <- high_tobacoo/all_cases
probability_high_tobgp

#10. For cases, what is the probability of being in the highest alcohol group
#and the highest tobacco group?

#sum of cases with high alcohol and high tobacco intake
highest_alcgp_tobgp <- esoph %>%
  filter (tobgp == '30+' & alcgp == '120+') %>%
  summarize(total = sum(ncases))

probability_alc_tob <- highest_alcgp_tongp/all_cases
print(probability_alc_tob)

#11. For cases, what is the probability of being in the highest alcohol group
#or the highest tobacco group?

#sum of cases with high alcohol or high tobacco intake
highest_alcgp_or_tobgp <- esoph %>%
  filter (tobgp == '30+' | alcgp == '120+') %>%
  summarize(total = sum(ncases))

probability_alc_or_tob <- highest_alcgp_or_tobgp/all_cases

print(probability_alc_or_tob)

#12. For controls, what is the probability of being in the highest alcohol group?

#sum of all controls
all_controls <- sum(esoph$controls)

#total for high alcohol controls
high_alcgp_ctrl <- esoph %>%
  filter(alcgp == '120+') %>%
  summarize(total= sum(ncontrols))

probability_alc_ctrl <- high_alcgp_ctrl/all_controls
print(probability_alc_ctrl)

#13. How many times more likely are cases than controls to be in the 
#highest alcohol group?
esoph %>% 
  filter(alcgp == '120+') %>%
  summarize(case_sum = sum(ncases),ctrl_sum = sum(ncontrols),
            ctrl_prob = ctrl_sum/all_controls,
            cases_prob = case_sum/all_cases, ratio = cases_prob/ctrl_prob)

#14. For controls, what is the probability of being in the highest tobacco group?<

#total for high_tobacco controls
high_tob_ctrl <- esoph %>%
  filter(tobgp == '30+') %>%
  summarize(total= sum(ncontrols))

probability_tob_ctrl <- high_tob_ctrl/all_controls
print(probability_tob_ctrl)

#15. For controls, what is the probability of being in the highest alcohol
#group and the highest tobacco group?

#sum for max of alcohol and tobacco
highest_alcgp_and_tobgp_ctrl <- esoph %>%
  filter (tobgp == '30+' & alcgp == '120+') %>%
  summarize(total = sum(ncontrols))

probability_alc_and_tob_ctrl <- highest_alcgp_and_tobgp_ctrl/all_controls

print(probability_alc_and_tob_ctrl)

#16. For controls, what is the probability of being in the highest alcohol
#group or the highest tobacco group?

#sum for max of either alcohol or tobacco
highest_alcgp_or_tobgp_ctrl <- esoph %>%
  filter (tobgp == '30+' | alcgp == '120+') %>%
  summarize(total = sum(ncontrols))

probability_alc_or_tob_ctrl <- highest_alcgp_or_tobgp_ctrl/all_controls

print(probability_alc_or_tob_ctrl)

#How many times more likely are cases than controls to be in the highest 
#alcohol group or the highest tobacco group?

esoph %>% 
  filter(tobgp == '30+' | alcgp == '120+') %>%
  summarize(case_sum = sum(ncases),ctrl_sum = sum(ncontrols),
            ctrl_prob = ctrl_sum/all_controls,
            cases_prob = case_sum/all_cases, ratio = cases_prob/ctrl_prob)
