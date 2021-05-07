#Load Library
library(openintro)

#View Dataset
View(satgpa)

#View first few lines of dataset
head(satgpa)


#View key information of dataset
str(satgpa)

#Mean
mu <- mean(satgpa$sat_m)
mu


#Standard Deviation
sd <- sd(satgpa$sat_m)
sd

#Hypothesis Testing
#Step 1: Null and alternative hypotheses as follows:
#Ho: ?? = ??o
#Ha: ?? ??? ??o
#Furthermore, since we are testing if the national average is 50, we have the following setup:
#Ho: ?? = 50
#Ha: ?? ??? 50

#Step 2: The significance level = 0.05

Step 3: Two-Tail Test
#Calculate z parameters
mu0 <- 50 # Specify the mean
alpha <- 0.05 # Specify the significance level
sigma <- 8.45 # population standard deviation
n <- nrow(satgpa) # get the sample size

#Calculate z
z<-(mu-mu0)/(sigma/sqrt(n))
z

#Calculate p-value
2*pnorm(abs(z),lower.tail=FALSE)
#p-values (we multiple by 2 since it's a
#two-side test)

#Step 4: Conclusion
#Since p-value of [1] 8.72779e-61 is much lower than 0.05 confidence interval, therefore we
#reject the null hypothesis that ?? = 50.
#Conclusion: We reject the null hypothesis that the population mean (or national average in SAT math percentile) is equal to 50 at the 0.05 level.
