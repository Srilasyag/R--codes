#Step 1: Install dplyr
Install dplyr


#Load Library
library(dplyr)
library(psych)
#Load Data and rename
data.ex1=alertness
#Review Key Statistics
describe(data.ex1)

#ANOVA formula
# One-way ANOVA
# The first argument is always the dependent variable.
aov.ex1 = aov(Alertness~Dosage,data=data.ex1)

#ANOVA results
summary(aov.ex1)

#Since the F-value (Pr(>F) = 0.00298) is less than 0.05 we reject the Ho and accept the Ha, that one sample mean
#is not equal to the others.
#Also note that the two stars ( **) indicate that we can also reject the Ho at the 0.01
#confidence level as well.#conducted test at 0.05 but 99% confident
#lower p-value stars number goes up
single star 95%


#Two-way ANOVA
#The purpose of this study was to demonstrate that Tooth Growth treated with different Doses will grow
#adequately.
#First state your hypothesis
#H0: The means of all supp groups are equal
#Ha: The mean of at least one supp group is different
#H0: The means of the dose groups are equal
# Ha: The means of the dose groups are different
#H0: There is no interaction between the supp and dose
#Ha: There is interaction between the supp and dose


#Load Data
my_data <- ToothGrowth
my_data
# Convert dose as a factor and recode the levels as "D0.5", "D1", "D2"
my_data$dose <- factor(my_data$dose,
                       levels = c(0.5, 1, 2),
                       labels = c("D0.5", "D1", "D2"))
head(my_data)


#Two way Anova Model
fitTooth <- aov(len ~ supp + dose, data = my_data)
summary(fitTooth)

#From the ANOVA table we can conclude that both supp and dose are statistically significant. dose is the most
#significant factor variable. These results would lead us to believe that changing delivery methods (supp) or the
#dose of vitamin C, will impact significantly the mean tooth length.
#Also note that the three stars (***) indicate that we can also reject the Ho at the 0-
#confidence level as well.