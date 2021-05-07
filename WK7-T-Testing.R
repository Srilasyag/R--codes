#To test if the midwest average is less than the national average

#First state your hypothesis
#Null hypothesis H???: ??s = 32
#Alternative hypothesis Ha: ??s < 32

#Load data
library(ggplot2)
data(midwest)
midwest
#One Sample t-test - Less than 32
t.test(midwest$percollege, mu = 32, alternative = "less")

#The results below show a p-value < .05 supporting the alternative hypothesis that "the true mean is less than
#32%.


#One Sample t-test - Greater than 32
t.test(midwest$percollege, mu=32, alternative = "greater")
#One Sample t-test - Equal to 32
t.test(midwest$percollege, mu=32)