#Load Libraries
library(MASS)

#Load and View carsdatabase_1_ 
print(str(carsdatabase_1_))



#Gives number of rows and columns in dataset
dim(carsdatabase_1_)


#Hypothesis Statement
#Ho: Number of cylinders(Cylinders) is not correlated with type of car sold (Type)
#Ha:Number of cylinders(Cylinders) is correlated with type of car sold (Type)

# Create a data frame from the main data set.
carsdata.data <- data.frame(carsdatabase_1_$Cylinders, carsdatabase_1_$Type)

# Create a table with the needed variables.
carsdata.data = table(carsdatabase_1_$Cylinders, carsdatabase_1_$Type)
print(carsdata.data)

# Perform the Chi-Square test.
print(chisq.test(carsdata.data))

#We have a chi-squared value of 78.935 and the p-value 1.674e-07 is less than the .05 significance level, 
#We reject the null hypothesis and accept the alternative hypothesis which states that a correlation
#exists between Number of cylinders and Type of car sold.

#ALTERNATIVE METHOD
#Load Library
library(descr)
#Cross Tab
crosstab(carsdatabase_1_$Cylinders,carsdatabase_1_$Type, prop.r=TRUE,
         prop.c=TRUE,prop.chisq = TRUE, chisq = TRUE, row.labels = TRUE)

#Part D
#Create Table 
tbl = table(carsdatabase_1_$Cylinders, carsdatabase_1_$Type) 
# the contingency table
tbl 
#Enhanced Solution
#The warning message found in the solution above is due to the small cell values in the contingency table. To avoid such warning, we combine the second and third columns of tbl, and save it in a new table named ctbl. Then we apply the chisq.test function against ctbl instead.
#New Table
ctbl = cbind(tbl[,"Compact"], tbl[,"Large"] + tbl[,"Midsize"]+ tbl[,"Small"]+ tbl[,"Sporty"]+ tbl[,"Van"])
ctbl

#Chi-squared New Table
chisq.test(ctbl)


#New Table 1
ctbl1 = cbind(tbl[,"Compact"]+ tbl[,"Midsize"]+ tbl[,"Small"], tbl[,"Large"] + tbl[,"Sporty"]+ tbl[,"Van"])
ctbl1

#Chi-squared New Table1
chisq.test(ctbl1)



#New Table 2
ctbl2 = cbind( tbl[,"Midsize"],tbl[,"Sporty"]+tbl[,"Compact"]+ tbl[,"Large"] + tbl[,"Small"]+ tbl[,"Van"])
ctbl2

#Chi-squared New Table1
chisq.test(ctbl2)
