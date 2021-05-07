#Example 1
#In the built-in data set survey, the Smoke column records the students smoking habit, while the Exer column records their exercise level. 
#The allowed values in Smoke are "Heavy", "Regul" (regularly), "Occas" (occasionally) and "Never". As for Exer, they are "Freq" (frequently),
#"Some" and "None".

#Test the hypothesis whether the students smoking habit is independent of their exercise level at .05 significance level.
#First let's determine the Hypothesis Statement
#Ho: Smoking habit is independent of the exercise level of the students
#Ha: Smoking habit is dependent of the exercise level of the students

#Load Libraries
library(MASS)

#Create Table
tbl = table(survey$Smoke, survey$Exer) 
tbl # the contingency table

#Chi-squared Statistic
chisq.test(tbl)

#As the p-value 0.4828 is greater than the .05 significance level,
#we do not reject the null hypothesis that the smoking habit is independent of the exercise level of the students.

#The warning message found in the solution above is due to the small cell values in the contingency table. 
#To avoid such warning, we combine the second and third columns of tbl, and save it in a new table named ctbl.
#Then we apply the chisq.test function against ctbl instead.

#New Table
ctbl = cbind(tbl[,"Freq"], tbl[,"None"] + tbl[,"Some"]) 
ctbl

#Chi-squared New Table
chisq.test(ctbl)


#As the p-value 0.3571 is greater than the .05 significance level,
#we do not reject the null hypothesis that the smoking habit is independent of the exercise level of the students.

#As the p-value 0.3571 is greater than the .05 significance level, we do not reject the null hypothesis that the smoking habit is independent of the exercise level of the students.

#EXample 2
#Load and View Cars93 Dataset
print(str(Cars93))

#The above result shows the dataset has many Factor variables which can be considered as categorical variables.
#For our model we will consider the variables "AirBags" and "Type". 
#Here we aim to find out any significant correlation between the types of car sold and the type of Air bags it has. 


#If correlation is observed we can estimate which types of cars can sell better with what types of air bags.

#First let's determine the Hypothesis Statement
#Ho: Type ofAirBags is not correlated with type of car sold
#Ha: Type ofAirBags is correlated with type of car sold


# Create a data frame from the main data set.
car.data <- data.frame(Cars93$AirBags, Cars93$Type)

# Create a table with the needed variables.
car.data = table(Cars93$AirBags, Cars93$Type)
print(car.data)


# Perform the Chi-Square test.
print(chisq.test(car.data))


#We have a chi-squared value of 33.001 and the p-value 0.0002723 is less than the .05 significance level, we reject the null hypothesis and 
#accept the alternative hypothesis which states that indicates correlation exists between type of airbag and type of car sold.


#Load Library
library(descr)
#Cross Tab
crosstab(Cars93$AirBags,Cars93$Type, prop.r=TRUE,
         prop.c=TRUE,prop.chisq = TRUE, chisq = TRUE, row.labels = TRUE)
