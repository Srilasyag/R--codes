#Load Library
library(openintro)

#View Dataset
View(satgpa) #this is a sample data

#View first few lines of dataset
head(satgpa) #first 6 rows of data, tail will execute last 6


#View key information of dataset
str(satgpa)#str is structure, gives the types of datasets 

#Mean
mu <- mean(satgpa$sat_m)#average of the the sat mathematics score for the 1000 observations
mu


#Standard Deviation
sd <- sd(satgpa$sat_m) #standard deviation of the sat mathematics score for the 1000 observations
sd

#Hypothesis Testing
#Step 1: Null and alternative hypotheses as follows:
#Ho: ?? = ??o
#Ha: ?? ??? ??o
#Furthermore, since we are testing if the national average is 50, we have the following setup:
#Ho: ?? = 50
#Ha: ?? ??? 50

#Step 2: The significance level = 0.05

#Step 3: Two-Tail Test
#Calculate z parameters
mu0 <- 50 # Specify the mean #as asssuming mean of the population dataset 50
alpha <- 0.05 # Specify the significance level (95%) significance of 0.01 is 99% also known as p value
sigma <- 8.45 # population standard deviation asssumed same as sample standard deviation from line 19
n <- nrow(satgpa) # get the sample size

#Calculate z
z<-(mu-mu0)/(sigma/sqrt(n)) #formula in notes, (sample mean- pop mean)/ standard error
z

#Calculate p-value
2*pnorm(abs(z),lower.tail=FALSE)
#lower tail true is a right tail test
#p-values (we multiple by 2 since it's a
#two-side test)(equal to and no equal to. If greater or less than than it is one tail. mean less than 50 then left tail test, if mean greater than 50 right tail test )

#Step 4: Conclusion
#Since p-value of [1] 8.72779e-61 is much lower than 0.05 confidence interval, therefore we
#reject the null hypothesis that ?? = 50.
#Conclusion: We reject the null hypothesis that the population mean (or national average in SAT math percentile) is equal to 50 at the 0.05 level.
