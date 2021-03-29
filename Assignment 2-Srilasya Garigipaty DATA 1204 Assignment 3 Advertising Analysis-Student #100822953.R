#Load data
library(ggplot2)

#Histogram
hist(sample, freq=F,col='yellow',main="Ad2 Analysis Data Set", xlab='sales')
lines(density(sample), col="red")
hist(adanalysis$adtype2)
#Create Dataset
sample = adanalysis$adtype2


#Summary Statistics
summary(sample)


#Hypothesis
#H???: ??s = 30000(null hypothesis)
#Ha: ??s >30000 (alternative hypothesis)


#One Sample t-test - Greater than 30000
Test<-t.test(sample, mu=30000, alternative = "greater")
attributes(Test)

? t.test
?attributes

Test$statistic
Test$parameter
Test$p.value
Test$conf.int
Test$null.value
Test$stderr
Test$alternative
Test$method