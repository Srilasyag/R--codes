#Build Linear Model
simple.fit<-lm(Sales~Spend, data=mktgbudget)
LinearModel<-simple.fit
#Summary of Key Statistics of the Model
summary(LinearModel)

#Null and alternate hypothesis
#Ho: ??=0, co-efficient ?? of the predictor is zero and not statistically significant
#Ha: ?? ???0, co-efficient ?? of the predictor is not equal to zero and is statistically significant

#The summary statistics above tells us a number of things. One of them is the model p-Value (bottom last line)
#and the p-Value of individual predictor variables (extreme right column under 'Coefficients')

#A larger t-value indicates that it is less likely that the
#coefficient is not equal to zero purely by chance. So, higher the t-value, the better. What this means to us? when
#p Value is less than significance level (< 0.05), we can safely reject the null hypothesis that the co-efficient ?? of
t#he predictor is zero. In our case, both these p-Values are well below the 0.05 threshold, so we can conclude our
#model is indeed statistically significant.

#Y(Sales) = 1383.4714 +(10.6222)*X(Spend), 

#Prediction
newdata = data.frame(Spend=10000) # wrap the parameter
predict(LinearModel, newdata) # apply predict


#Prediction
newdata = data.frame(Spend=4000) # wrap the parameter
predict(LinearModel, newdata) # apply predict
