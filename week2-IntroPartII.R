
#Load Libraries
library(lattice)
library(psych)
library(gmodels)

#View Dataset
drug

#Set Calculations to 3 digits
options(digit=3)

#Mean of CESD
mean(drug$cesd)
#Standard Deviation of CESD
sd(drug$cesd)
#Variance of CESD
var(drug$cesd)
#Median of CESD
median(drug$cesd)

#Basic Stats of CESD
describe(drug$cesd)

boxplot(mcs~cesd,data=drug,main="Epidemiologic Studies",xlab="cesb",ylab="mcs")

#Histogram of CESD
x=drug$cesd
h<-hist(x, breaks=10, col="red", xlab="CESD",
        main="Epidemiologic Studies")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)
#Corrolation  describe(drug$cesd)

cor(drug$mcs,drug$cesd,use="complete.obs")
#Crosstab Table
mytable=CrossTable(drug$sex,drug$homeless) #Sex will be rows
abline(lm(drug$mcs~drug$cesd),col="red")
#Probabilty table of Sex and Homeless
mytable
