#Simple Regression Model
simple.fit<-lm(happiness ~ income, data = incomedata)
LinearModel<-simple.fit
summary(LinearModel)

#Y(happiness) = 0.20 +(0.71)*X(income), So, each additional 1 unit in happiness would translate into an
#increase of 0.91 (0.20+0.71) unit in income

#Ho: ??=0, co-efficient ?? of the predictor is zero and not statistically significant
#Ha: ?? ???0, co-efficient ?? of the predictor is not equal to zero and is statistically significant
#p-value (< 2.2e-16) is significantly lower than the significance level (< 0.05), we can safely reject the null
#hypothesis that the co-efficient ?? of the predictor is zero, so we can conclude our model is indeed statistically
#significant.

#Prediciton
incomedata
newdata~data.frame(income<-c(mean(incomedata$income),median(incomedata$income)))
predict(LinearModel,newdata)

newdata~