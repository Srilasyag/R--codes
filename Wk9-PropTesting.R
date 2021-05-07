#One Proportion
#Let's test the null hypothesis that 50% of infants start walking by 12 months of age. In this
#sample, 36/50=.72 of the infants walked by 1 year.
#First we state the Hypothesis
#H0: The proportion of babies who start walking and are 12 months of age is 50% or p = 0.5
#Ha: The proportion of babies who start walking and are not 12 months of age is not 50% or p ??? 0.5

#Two-sided One Proportion Test
prop.test(36,50,p=0.5,correct=FALSE)
#Looking at the results we find that 72% of infants began walking before age 12 months.
#p-value is less than 0.05 (p=0.001863), so we reject the null hypothesis since the
#proportion is actually 72%.

#Note similar to t-tests adding an "alternative" function can create one-sided (i.e. tail) tests:
#One-sided One Proportion Test
 prop.test(36,50,p=0.5,correct=FALSE,alternative = "greater")
prop.test(36,50,p=0.5,correct=FALSE,alternative = "less")


#Two Proportion
#Out of 29 males sampled, 9 think their sexual partner is responsible to ask about safer sex. Out
#of the 31 females sampled, 4 think their sexual partner is responsible to ask about safer sex.
#Are the proportions for males and females who think their partner is responsible for asking
#about safer sex significantly different?

#H0: The proportion of males think their sexual partner is responsible to ask about safer sex is
#equal to the proportion of females who think their sexual partner is responsible to ask about
#safer sex.
#Ha: The proportion of males think their sexual partner is responsible to ask about safer sex is
#not equal to the proportion of females who think their sexual partner is responsible to ask about
#safer sex.

#Two-sided Two Proportion Test
prop.test(x=c(9,4),n=c(29,31), conf.level=0.95, correct=FALSE)

#Since the P-value (0.08846) is large (larger than our alpha level of 5%), we fail to reject the
#null hypothesis. We have insufficient evidence to conclude the two proportions for males and
#females are not significantly different.

#One-sided Two Proportion Test
prop.test(x=c(9,4),n=c(29,31), conf.level=0.95, correct=FALSE,
          alternative = 'greater')
prop.test(x=c(9,4),n=c(29,31), conf.level=0.95, correct=FALSE,
          alternative = 'less')
