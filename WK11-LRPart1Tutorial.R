#Load Libraries
library(dplyr)
library(ggplot2)

#Dataset Review
cars
str(cars)


#The cars dataset contains 50 observations and two variables. One dependent variable (Speed) and one Independent variable (dist = distance).

ggplot(cars, aes(x = dist, y = speed))+
  geom_point(colour = "red") + geom_smooth(method = "lm", fill = NA) +
  labs(title = "Original Model",
       x = "Distance",
       y = "Speed")

#Upon visual inspection, the relationship appears to be linear, has a positive (upsloping) direction, and looks to be moderately strong. 
#The strength of the relationship can be quantified using the Pearson correlation coefficient.

#Correlation
cor(cars$dist,cars$speed)


#This is a strong positive correlation.


#Let's look a few transformations that might help improve the model
#Transformation using Sqrt
cor(sqrt(cars$dist), sqrt(cars$speed))
#There is a small increase in correlation


#Transformation using Log
cor(log1p(cars$dist), log1p(cars$dist))
#Large increase in correlation moving it to a perfect


#Plot with Line (adjusted) - Sqrt
ggplot(cars, aes(x = sqrt(dist), y = sqrt(speed))) +
  geom_point(colour = "red") + geom_smooth(method = "lm", fill = NA) +
  labs(title = "Transformed Model - SQRT",
       x = "Distance",
       y = "Speed")

#Upon visual inspection, it can clearly be
#seen that the sqrt transformation has reduced the residual values (note the left-hand scale) as well as the effect of the outliners.

# #Plot with Line (adjusted) - Log
ggplot(cars, aes(x = log1p(dist), y = log1p(speed))) +
  geom_point(colour = "red") + geom_smooth(method = "lm", fill = NA) +
  labs(title = "Transformed Model - Log",
       x = "Distance",
       y = "Speed")

#Similar to the SQRT transformation,
#it can clearly be seen that the residual values (note the left-hand scale again) have decreased considerably as well as the effect of the outliers

#Linear Model - No Transformation
lmodel <- lm(speed ~ dist, data = cars)
summary(lmodel)


#Note: That the R2 statistic is 65% and Error is 3.156


# Plotting Fitted vs. Residual and QQPlot
par(mfrow = c(1, 2))
plot(fitted(lmodel), resid(lmodel), col = "grey", pch = 20,
     xlab = "Fitted", ylab = "Residuals", main = "Fitted versus Residuals")
abline(h = 0, col = "darkorange", lwd = 2)
qqnorm(resid(lmodel), main = "Normal Q-Q Plot", col = "darkgrey")
qqline(resid(lmodel), col = "dodgerblue", lwd = 2)

#Linear Model - Sqrt Transformation
lmodel_sqr <- lm(sqrt(speed) ~ sqrt(dist), data = cars)
summary(lmodel_sqr)

#Note: That the R2 statistic is 71% and Error is 0.3941

# Plotting Fitted vs. Residual and QQPlot - Sqrt
par(mfrow = c(1, 2))
plot(fitted(lmodel_sqr), resid(lmodel_sqr), col = "grey", pch = 20,
     xlab = "Fitted", ylab = "Residuals", main = "Fitted versus Residuals")
abline(h = 0, col = "darkorange", lwd = 2)
qqnorm(resid(lmodel_sqr), main = "Normal Q-Q Plot", col = "darkgrey")
qqline(resid(lmodel_sqr), col = "dodgerblue", lwd = 2)


#Log Transformation
lmodel_log = lm(log(speed) ~ log(dist), data = cars)
summary(lmodel_log)

#Note: That the R2 statistic is 74% and Error is 0.1969
# Plotting Fitted vs. Residual and QQPlot - Log
par(mfrow = c(1, 2))
plot(fitted(lmodel_log), resid(lmodel_log), col = "grey", pch = 20,
     xlab = "Fitted", ylab = "Residuals", main = "Fitted versus Residuals")
abline(h = 0, col = "darkorange", lwd = 2)
qqnorm(resid(lmodel_log), main = "Normal Q-Q Plot", col = "darkgrey")
qqline(resid(lmodel_log), col = "dodgerblue", lwd = 2)

#Comparing the Residual Standard Error using the original and transformed response,
#we also see that that log transformed model simply fits better, with a smaller average squared error.
#Original Model
#Residual standard error: 3.156 (R2 = 0.65)
#Transformed Model -SQRT Residual standard error: 0.3941 (R2 = 0.71)
#Transformed Model - Log
#Residual standard error: 0.1969 (R2 = 0.74)


#RMSE Comparison
#Orginial Model
sqrt(mean(resid(lmodel) ^ 2))

#SQRT Model
sqrt(mean((cars$speed - ((fitted(lmodel_sqr)))^2) ^ 2))

#Log Model
sqrt(mean((cars$speed - exp(fitted(lmodel_log))) ^ 2))


#Note: Since the variables have been transformed you need to covert them back to calculate RMSE.
