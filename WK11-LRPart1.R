#The built-in mtcars dataset in R is used to visualise the relationship between fuel efficiency (mpg) and engine displacement (disp).
#First we state the Hypothesis
#H0: A relationship between fuel efficiency(mpg) and engine displacement(disp) doesn't exist
#Ha: A relationship between fuel efficiency(mpg) and engine displacement(disp) does exist

#Load Libraries
library(dplyr)
library(ggplot2)

#Dataset Review
mtcars
str(mtcars)

#Disp vs. mpg
ggplot(mtcars,aes(x = disp, y = mpg)) + geom_point(colour = "red")

#Upon visual inspection, the relationship appears to be linear, 
#has a negative direction, and looks to be moderately strong. The strength of the relationship can be quantified using the Pearson correlation coefficient.

#Correlation
cor(mtcars$disp, mtcars$mpg)
#This is a strong negative correlation.


#If the relationship is non-linear, a common approach in linear regression modelling 
#is to transform the response and predictor. Common transformations include natural and base ten logarithmic,
#square root, cube root and inverse transformations. 
#The mpg and disp relationship are already linear but it can be strengthened using a square root transformation.

#Correlation with Transformation
cor(sqrt(mtcars$disp), sqrt(mtcars$mpg))

#The next step is to determine whether the relationship is statistically significant and not just some random occurrence.

#OLS line
ggplot(mtcars, aes(x = sqrt(disp), y = sqrt(mpg))) + geom_point(colour = "red") + geom_smooth(method = "lm", fill = NA)


#Create Linear Model
lmodel <- lm(sqrt(mpg) ~ sqrt(disp), data = mtcars)
summary(lmodel)

#Since the P-value (6.443e-12 ) is smaller than 0.001 we reject the Ho and conclude that relationship between fuel efficiency(mpg) and engine displacement(disp) does exist
#The multiple R-squared value (R-squared) of 0.7973 gives the variance explained and can be used as a measure of predictive power (in the absence of overfitting).


