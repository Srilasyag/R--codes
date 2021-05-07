#Load Data
attach(InsectSprays)
data(InsectSprays)
str(InsectSprays)


#Descriptive statistics
#Mean, variance, number of elements in each cell
#Visualize the data - boxplot; look at distribution, look for outliers
#We'll use the tapply() function which is a helpful shortcut in processing data, basically allowing you to
#specify a response variable, a factor (or factors) and a function that should be applied to each subset of the
#response variable defined by each level of the factor.


#Let's look at the means:
#Descriptive Statistics
  tapply(count, spray, mean)

#The variances:
tapply(count, spray, var)    

#And sample sizes
tapply(count, spray, length)

#And a boxplot:
#Boxplot
  boxplot(count ~ spray)

#How does the data look? Notice the outliers in C and D?
  
  
#Default order is alphabetical. R needs, for example, the control condition to be 1st for treatment
#contrasts to be easily interpreted.
# If they're not automatically in the correct order - i.e. if they were ordered variables, but came out
#alphabetically (e.g. "Very.short","Short","Long","Very.long" or "A", "B", "Control"), re-order the
#variables for ordered IV:
  
#To change to, for example, F < B < C < D < E < A, use:
#Re-Order Variables
 Photoperiod<-ordered(spray,levels=c("F","B","C","D","E","A"))  
 
 tapply(count,Photoperiod,mean)
 
 
 #If you want to check that a variable is a factor (especially for variables with numbers as factor levels). We use the is.factor directive to find this out
 is.factor(spray)
#______________________________________________________________________________________
 
 
 #Run 1-way ANOVA
 #a. Run an ANOVA using aov( )
 aov.out = aov(count ~ spray, data=InsectSprays)
 summary(aov.out)
 
 
 #Since the F-value (Pr(>F) = <2e-16) is less than 0.05 we reject the Ho and accept the Ha, that one sample
 #mean is not equal to the others.
 #Also note that the two stars ( ***) indicate that we can also reject the Ho at the 0
# confidence level as well.
 #____________________________________________________________________________________________
 
 #2-Way ANOVA
 
 #Rename Dataset
 Mydata <- anova2
 
 
 #Now, we use the command as.factor() to indicate that our grouping variables are grouping variables. Type:
  #as.factor(). Then, include the reference to the grouping variables followed by a closed bracket.
 
 #Creating Groups
 Mydata$Grouping1 <- as.factor(Mydata$Grouping1)
 Mydata$Grouping2 <- as.factor(Mydata$Grouping2)
 
 #Two-way ANOVA
 aov_out2 <-aov(Outcome ~ Grouping1*Grouping2, data=Mydata)
 summary(aov_out2)
 
 
# We can see that the F-value for Grouping 1 is 6.634, the F-value for Grouping 2 is 1.609, and the F-value
 #for the interaction term is 1.099.
# We can also see that the p-value for Grouping 1 is < .05, whereas the p-values for the other two effects are
 #> .05. So, only the effect of Grouping 1 is statistically significant, and the groups only differ in regards to
 #the Grouping 1 variable.