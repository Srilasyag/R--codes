#Simulating Coin Flips
#In these exercises, you'll practice using the rbinom() function, which generates random "flips" that are either 1
#("heads") or 0 ("tails").

# Generate 10 separate random flips with probability .3
rbinom(10,1,.3)
# Generate 100 occurrences of flipping 10 coins, each with 30% probability
rbinom(100,10,.3)

#Calculating Density of a Binomial
#If you flip 10 coins each with a 30% probability of coming up heads, what is the probability exactly 2 of them
#are heads?
# Calculate the probability that 2 are heads using dbinom
dbinom(2,10,.3)
#Calculating Cumulative Density of a Binomial
#If you flip ten coins that each have a 30% probability of heads, what is the probability at least five are heads?
# Calculate the probability that at least five coins are heads
1-pbinom(4,10,.3)
#Calculating the Expected Value
#What is the expected value of a binomial distribution where 25 coins are flipped, each having a 30% chance of
#heads?
#Calculate this using the exact formula you learned in the lecture: the expected value of the binomial is size *
#p. Confirm with a simulation of 10,000 draws from the binomial.
# Calculate the expected value using the exact formula
25*.3
# Confirm with a simulation using rbinom
mean(rbinom(10000,25,.3))
#Randomly simulate 100,000 flips of A (40% chance), B (20% chance), and C (70% chance). What fraction of
#the time do all three coins come up heads?
# Simulate 100,000 flips of coin A, B, C (40%, 20%, 70% chance of heads respectively) rbinom(100000, 1, .4)
A <- rbinom(100000, 1, .4)
B <- rbinom(100000, 1, .2)
C <- rbinom(100000, 1, .7)
# Estimate the probability A, B, and C are all heads
mean(A&B&C==1)

#Let's imagine that we want to take a sample from things that are not numbers. For example, pretend we are
#taking M&Ms out of a jar that has blue, green, and red M&Ms, and we want to pretend we're randomly taking
#M&Ms o#Probability with Replacement
candy = c("blue","green","red")
sample(candy, size=20, replace=T)
#In the above example, "replace=T" is required since there are only three items in our list. It means that we can
#sample the same item more than one time, sort of like taking a piece of candy out, recording what color it is,
#putting it back in the jar, mixing the candy up again, and then taking another sample.
#Now, imagine that the M&M jar has more of a certain color of candy. In this case, we'd also be concerned with
#probability.
#With defined probabilities
sample(candy, size=20, replace=T, prob=c(0.7, 0.2, 0.1))
# A second time
sample(candy, size=20, replace=T, prob=c(0.7, 0.2, 0.1))

#Simulating the Probability without replacement 
#Probability without Replacement
sample(candy, size=3, replace=F)
#With defined Probabilites
sample(candy, size=3, replace=F, prob=c(0.7, 0.2, 0.1))

