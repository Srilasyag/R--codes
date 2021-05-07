#Probability for one die
face = seq(1:6)
face
p = c(1, 1, 1, 1, 1, 1) / 6
data.frame(face, p)


#Spike Plot
plot(face, p, type="h", xlim=c(0,6), ylim=c(0,1))
points(face, p, pch=16, cex=2)
points(face, p, pch=15, cex=3.5, col="red")
#pch point character ,dimensions
#cex size


#SAMPLING FROM A UNIFORM DISTRIBUTION
sample(face, size=1)
#random sample, a single roll of the die
sample(face, size=2)
sample(face, size=1, prob=p)


#Let's roll a pair of dice and get their sum.
sum(sample(face, size=2, replace=T))
#rolling two dies, with replacement
#Roll dice 100 time
sample(face, size=100, replace=T)



#Describing Results
results = sample(face, size=100, replace=T)
results
sort(results,decreasing=TRUE)#ascending 
table(results)
# We obtain a frequency table of our results.
table(results) / length(results)
#We obtain a relative frequency table of our results.
#Note: length(results) is 100 here.
hist(results, prob=T, breaks=seq(-0.5, 6.5, by=1), ylim=c(0,1))

lines(c(0.5,6.5), c(1/6,1/6), col="blue")
pie(table(results), face)


#NON UNIFORM DISTRIBUTION
x = c(2, 4, 8, 16)
p2 = c(1/8, 1/8, 1/4, 1/2)
#population
data.frame(x, p2)
#We see a tabular description of the distribution
plot(x, p2, type="h", xlim=c(0,20), ylim=c(0,1))
points(x, p2, pch=16, cex=2)
#We see a probability spike plot of the distribution.
results2 = sample(x, size=100, replace=T, prob=p2)
results2
#created a sample of 100 from the population

#Mean(OR EXPECTED VALUE) of a Distribution(the=theoretical)
data.frame(x, p2)
#population dataset
#We see a tabular description of the distribution
the.mean = sum(x*p2)
the.mean

#VARIANCE AND STANDARD DEVIATION OF A DISTRIBUTION
the.var = sum(x^2 * p2) - the.mean^2
the.var

#Standard deviation of this distribution.
the.std = sqrt(the.var)
the.std


results2
#This was our sample of size 100 from the distribution.
mean(results2)
#Compare this sample mean with the.mean, the theoretical mean of the
#distribution.
var(results2)
# We do want the sample variance here.
#Compare this sample variance with the.var, the theoretical variance of the
#distribution.
sd(results2)
#Compare this sample standard deviation with the.sd, the theoretical
#standard deviation of the distribution. 
