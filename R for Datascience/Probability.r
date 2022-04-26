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
