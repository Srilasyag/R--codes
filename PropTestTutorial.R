
#Example 1:
 # Suppose our data are such that out of a sample of n=180 trials (=students), 120
  #resulted in successes (=indicated that they are in favor of lowering the drinking age
  #to below 18 years). Our goal is to test hypotheses and construct confidence
  #intervals about the true (unknown) proportion of successes (proportion of students
#Let's look at a two-sided test of the (alternative) hypothesis that the true
#proportion is different from 0.6 first.
#H0: p = 0.6
#Ha: p ??? 0.6

 #Example 1 - One-side Test
 prop.test(x=120, n=180, p=0.6, correct=FALSE)
 
 #the P-value for the two-sided test is 0.06789. At a significance level of
 #(alpha=) 5%, we have insufficient evidence (P-value > 0.05) to reject the null
 #hypothesis. There is insufficient evidence to conclude that the true proportion of
 #students who are in favor of lowering the drinking age is different from 0.6.
 
 
# Example 2
 #For this problem, it's probably more natural to ask: "Is the proportion of students
 #who want to lower the drinking age significantly larger than 60%?" This requires a
 #one-sided test.
 #H0: p = 0.6
 #Ha: p > 0.6
 
 #Example 2 - One-side Test - Greater Than
prop.test(x=120,n=180, p=0.6, alternative="greater", correct=FALSE)

#Conclusion: At a 5% significance level, there is sufficient evidence (P-value < 5%)
#to reject the null hypothesis and conclude that the true proportion of students in
#favor of lowering the drinking age is significantly larger than 60%.


#Example 3
#A survey conducted in two distinct populations will produce different results. It is
#often necessary to compare the survey response proportion between the two
#populations. Here, we assume that the data populations follow the normal
#distribution.
#In the built-in data set named quine, children from an Australian town is classified
#by ethnic background, gender, age, learning status and the number of days absent
#from school.

#load the MASS package
install.packages("MASS")
head(quine)
str(quine)

#In R, we can tally the student ethnicity against the gender with the table function.
#As the result shows, within the Aboriginal student population, 38 students are
#female. Whereas within the Non-Aboriginal student population, 42 are female.

table(quine$Eth, quine$Sex)

#Problem
#Assuming that the data in quine follows the normal distribution, find the 95%
#confidence interval estimate of the difference between the female proportion of
#Aboriginal students and the female proportion of Non-Aboriginal students, each
#within their own ethnic group.


#We apply the prop.test function to compute the difference in female proportions.
#The Yates's continuity correction is disabled for pedagogical reasons.

prop.test(table(quine$Eth, quine$Sex), correct=FALSE)


#Conclusion: The 95% confidence interval estimate of the difference between the
#female proportion of Aboriginal students and the female proportion of Non-
#Aboriginal students is between -15.6% and 16.7%.
