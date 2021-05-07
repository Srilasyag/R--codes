#One Sample T-Test Example

#First state your hypothesis
#Null hypothesis H???: ??s = 75
#Alternative hypothesis Ha: ??s ??? 75

#Create Dataset
sample = c(65, 78, 88, 55, 48, 95, 66, 57, 79, 81)

#Histogram
hist(sample, freq=F,col='yellow',main="Sample Dataset", xlab='Scores')
lines(density(sample), col="red")

#Summary Statistics
summary(sample)

#One Sample t-test
t.test(sample, mu=75)

#if you want to test whether the mean is less than 75(on-tailed test), type this:
#One Sample t-test - Less than 75
t.test(sample, mu=75,alternative = "less")

#if you want to test whether the mean greater than 75 (one-tailed test), type this:
#One Sample t-test - Greater than 75
t.test(sample, mu=75, alternative = "greater")

#Paired Data T-test example
#Null hypothesis H???: ??d = 0
#Alternative hypothesis Ha: ??d ??? 0
#Paired Sample t-test
Sampleafter= c(12.9, 13.5, 12.8, 15.6, 17.2, 19.2, 12.6, 15.3, 14.4, 11.3)
Samplebefore= c(12.7, 13.6, 12.0, 15.2, 16.8, 20.0, 12.0, 15.9, 16.0, 11.1)
t.test(Sampleafter,Samplebefore, paired=TRUE)

#Two Sample T-test

#Null hypothesis H???: ??testa = ??testb
#Alternative hypothesis Ha: ??testa ??? ??testb

#Two sample t-test

#Two sample t-test
testa=c(175,168,168,190,156,181,182,175,174,179)
testb=c(185,169,173,188,186,175,174,179,180)
t.test(testa,testb, var.equal=TRUE, paired=FALSE)




#CALCULATING POWER OR SAPLE SIZE


#Ho: that the coin is fair and lands heads 50% of the time (??=50)
#Ha: that the coin is loaded to land heads more then 50% of the time (??>0)
#How many times should we flip the coin to have a high probability (or power)say 0.80, of correctly rejecting
#the null of ??= 0.5 if our coin is indeed loaded to land heads 75% of the time?



#Load Library
library(pwr)

#Create Power Statistic
p.out <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.50),sig.level = 0.05, power = 0.80,
alternative = "greater")

#The function tells us we should flip the coin 22.55127, which we round up to 23. Always round sample size
#stimates up. If we're correct that our coin lands heads 75% of the time, we need to flip it at least 23 times to
#ave an 80% chance of correctly rejecting the null hypothesis at the 0.05 significance level.
plot(p.out)