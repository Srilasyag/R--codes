#load library
library(ggplot2)
#Uniform Distribution
data_uniform = runif(n=10000,min=0,max=10)
ggplot()+
aes(x=data_uniform) +geom_histogram(bins=100,fill="magenta1")

#Normal Distribution
data_normal = rnorm(10000, mean=0, sd=1)
ggplot() +
aes(x=data_normal)+
geom_histogram(bins=100,fill="magenta1")

#Bernoulli Distribution
data_bernoulli = (rbinom(p=0.5,size=1,n=10000))
ggplot()+
aes(x=data_bernoulli)+
geom_bar(fill="magenta2",width = 0.1)

#Binomial Distribution
data_binomial = rbinom(p=0.5,size=10,n=10000)
ggplot()+
  aes(x=data_binomial)+
  geom_bar(fill="magenta3",width = 0.2)

#Negative Binomial Distribution
data_negbinomial = rnbinom(p=0.5,size=10,n=10000)
ggplot()+
  aes(x=data_negbinomial)+
  geom_bar(fill="magenta3",width = 0.2)

#Poisson Distribution
data_poisson = rpois(n=10000,lambda=3)
ggplot()+
  aes(x=data_poisson)+
  geom_bar(fill="magenta1",width=.2)

#Geometric Distribution
data_geometric = (rgeom(n=10000,p=0.5))
ggplot()+
  aes(x=data_geometric)+
  geom_bar(fill="magenta2",width = 0.1)

# Store the data in the variable my_data
my_data <- ToothGrowth
my_data
#QQ Plot
qqnorm(my_data$len, pch = 1, xlab = "Theoretical Quantiles", ylab = "Sample Quantiles")
qqline(my_data$len, col = "steelblue", lwd = 2)
#. Fitting a Normal Distribution Curve

#Histogram with Normal Curve
histNC <- ggplot(my_data, aes(x=len)) +
  labs(title="Tooth Growth")+ theme(plot.title = element_text(hjust=0.5)) +
  xlab('Length')
histNC <- histNC + geom_histogram(binwidth=2, colour="black",
                                  aes(y=..density.., fill=..count..))
histNC <- histNC + scale_fill_gradient("Count", low="light blue", high="blue")
histNC <- histNC + stat_function(fun=dnorm,
                                 color="red",
                                 args=list(mean=mean(my_data$len),
                                           sd=sd(my_data$len)))
histNC


#Ho: Sample Distribution is Normal
#Ha: Sample Distribution is Not Normal
#Shapiro-Wilk Test
shapiro.test(my_data$len)
