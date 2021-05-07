#In a sample of 65 students, we recorded the hair color (categories blond, brown, dark) and eye color (categories bright, dark).
#The table below summarizes the counts. Null hypothesis: Hair and Eye color are independent. Alternative Hypothesis: Hair and eye color are associated.
#(Note: Sampling design is multinomial, where two categorical responses are recorded.)

> #Example 1
table1=matrix(c(12,2,8,25,6,12),ncol=3)
colnames(table1)=c("blond","brown","dark")
rownames(table1)=c("bright","dark")
table1

chisq.test(table1)

#Conclusion: There is sufficient evidence (P-value=0.0003) that hair and eye color of students are associated.

#Example 2:
#We asked n1=25 females (group 1) and n2=17 males (group 2) how they preferred their Sunday morning breakfast egg 
#(Sunny Side Up, Over Easy or Scrambled). The data are summarized in the table below. Is the distribution of egg preference the same for males and females?
#(Are the proportions homogeneous across the two groups?) Null hypothesis: distributions are the same for females and males; 
#Alternative Hypothesis: Distributions are not the same (Note: Sampling design is product multi(=bi) nomial.)

#Example 2
table2=matrix(c(5,9,12,3,7,5),ncol=3)
colnames(table2)=c("Sunny","Over Easy","Scrambled")
 rownames(table2)=c("Females","Males")
 table2
 
 #chisq.test(table2)
# Warning message:
  # In chisq.test(table2) : Chi-squared approximation may be incorrect
#Conclusion: We don't trust the approximation
 
 
 Example 3:
  #Suppose we have 105 patients under study and 50 of them were treated with the drug. 
 #Moreover, the remaining 55 patients were kept under control samples.
 #Thus, the health condition of all patients was checked after a week.
   
   
H0: The two variables are independent. H1: The two variables relate to each other.
data_frame <- read.csv("https://goo.gl/j6lRXD") #Reading CSV
str(data_frame)
tbl = table(data_frame$treatment, data_frame$improvement)
str(tbl)
 chisq.test(tbl, correct=FALSE)
 
# Conclusion: We have a chi-squared value of 5.5569. 
 #Since we get a p-Value less than the significance level of 0.05, 
 #we reject the null hypothesis and conclude that the two variables are in fact dependent with 95% confidence.
 
 
 
 #Try out:
   #Load Library
   library(descr)
 #Cross Tab
 crosstab(data_frame$treatment, data_frame$improvement, prop.r=TRUE,
          prop.c=TRUE,prop.chisq = TRUE, chisq = TRUE, row.labels = TRUE)
   