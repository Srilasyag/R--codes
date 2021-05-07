#Example 1: A fair die can be modelled with a discrete random variable with outcome 1
#through 6, each with the equal probability of 1/6.
#The expected value is: (1+2+3+4+5+6)/6 =3.5

#Die Frequency
#Suppose you throw the die 10,000 times and plot the frequency of each outcome. Here's the R
#syntax to simulate the throwing a die 10,000 times


DieOutcome <- sample(1:6,10000, replace= TRUE)
hist(DieOutcome, col ="light blue")
abline(v=3.5, col = "red",lty=1)
#abline is to create a lie at 3.5, showing the mean of the # of times of die outcome
#lty is the kind of line quality

#We will take samples of size 10 , from the above 10000 observation of outcome of die roll, take
#the arithmetic mean and try to plot the mean of sample. we will do this procedure k times (in
#this case k= 10000 )
#Sample of 10 (1000 observations)#sample of 10 , 1000 observations or (1000 observations of sample size 10)
x10 <- c()# sample of 10 from above 10000 observations
k =1000
for ( i in 1:k) {
  x10[i] = mean(sample(1:6,10, replace = TRUE))}
hist(x10, col ="pink", main="Sample size =10",xlab ="Outcome of die roll")
abline(v = mean(x10), col = "Red")
abline(v = 3.5, col = "blue")
#v stands for vertical line at 3.5


#Sample Size
#In theory, we know as the sample increases, we get better bell shaped curve. As the n
#approaches infinity , we get a normal distribution. Lets do this by increasing the sample size to
#30, 100 and 1000 in above example 1.

#Sample of 30, 100 and 1000
x30 <- c()
x100 <- c()
x1000 <- c()
k =10000
for ( i in 1:k){
  x30[i] = mean(sample(1:6,30, replace = TRUE))
  x100[i] = mean(sample(1:6,100, replace = TRUE))
  x1000[i] = mean(sample(1:6,1000, replace = TRUE))
}
par(mfrow=c(1,3))
hist(x30, col ="green",main="n=30",xlab ="die roll")
abline(v = mean(x30), col = "blue")
hist(x100, col ="light blue", main="n=100",xlab ="die roll")
abline(v = mean(x100), col = "red")

hist(x1000, col ="orange",main="n=1000",xlab ="die roll")
abline(v = mean(x1000), col = "red")