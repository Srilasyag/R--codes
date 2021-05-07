#Load Library
library(ggplot2)

#Load Data
data(carsDB)
carsDB

#Disp vs. hwy pointplot
ggplot(data=carsDB,aes(x=mpg,y=hp,color=cyl))+geom_point()

#Disp vs. hwypoint-Blue Colors
ggplot(data=carsDB,aes(x=hp,y=qsec))+geom_point(color="blue")

#Specifying Geometric Shapes for a number of graphs
#Left column :x and y mapping needed!
ggplot(data=carsDB, aes(x = wt, y = vs)) + geom_point()
ggplot(data=carsDB, aes(x = disp, y = mpg)) + geom_smooth()

#Right column:
ggplot(data = carsDB, aes(x = cyl)) + geom_bar(color="red", fill="black")
ggplot(data = carsDB, aes(x = hp)) + geom_histogram(color="red", fill="blue",binwidth=1)

#plot with both a point and smoothed line
ggplot(data= carsDB, aes(x =disp, y = hp))+geom_point(color = "blue")+geom_smooth(color = "red")

#Color aesthetic passed to each geom layer
# color aesthetic passed to each geom layer
# color aesthetic passed to each geom layer
ggplot(data= carsDB, aes(x = disp, y = hp, color = cyl)) + geom_point()+ geom_smooth(se = FALSE)

#positional adjustment

# position = "dodge": values next to each other
ggplot(data=carsDB, aes(x = cyl, fill = hp)) + geom_bar(position = "dodge")
## position = "fill": percentage chart
ggplot(data=carsDB, aes(x = vs, fill = hp)) + geom_bar(position = "fill")

#Labels and Annotations
#Adding titles
ggplot(data=carsDB, aes(x = hp, y = mpg, color = cyl)) +geom_point()+
  labs(title = "Hp and Wt",
       subtitle = "Fuel economy data from 1999 and 2008 for 38 popular models of cars",
       x = "Hp (horsepower",
       y = "Fuel Efficiency (miles per gallon)",
       color = "Car Type")
#Side by Side Graphs 
#Load Library
library(cowplot)
#Create side by side graph
dodgeplot<-ggplot(data=carsDB, aes(x = model, fill =cyl )) + geom_bar(position = "dodge")
fillplot<-ggplot(data=carsDB, aes(x = model, fill =cyl )) + geom_bar(position = "fill")
plot_grid(dodgeplot, fillplot, labels = c('Dodge','Fill'),align="h")






#______________________________

#PART 2
#mpg vs hp
ggplot(data=carsDB,aes(x=mpg,y=hp,col=factor(cyl)))+geom_point()+labs(title="Scatter Plot
MPG and HP")+ theme(plot.title = element_text(hjust=0.5))
#mpg(miles/galloon) is assigned to the x-axis
# hp(Horsepower) is assigned to the y-axis
# factor(cyl) {Number of cylinders} determines the color
#The geometry used is scatter plot. We can create a scatter plot by using the geom_point() function.
#inferences
#As mpg(miles/gallon) increases hp(Horsepower) decreases.
#8-cylinder cars have the highest horsepower and lowest mpg.
#6-cylinder cars have a horse power range of 100-175 and mpg is in the range of 17.5-22.5
# 4-cylinder cars have lowest horse power and highest mpg.

#Wt vs. mpg
ggplot(data = carsDB,aes(x = wt, y = mpg)) + geom_point()+ stat_smooth(method = 'lm')+labs(title="Scatter Plot MPG and HP with Smoothing")+
theme(plot.title = element_text(hjust=0.5)) + xlab('Weight(1,000)') + ylab('MPG')
#We are assigning wt (weight (1000 lbs) to the x-axis and mpg (miles/gallon) to the y-axis.
#The geometry used is scattered plot. We can create a bar chart by using the geom_point() function.
#stat_smooth, which does not plot the original data but a smoothed version of it.
# theme(),which centers the plot title
#Cyl by Gear
ggplot(data = carsDB,aes(x=cyl,fill=factor(gear)))+geom_bar()+
labs(title="Histogram CYL by Gear")+ theme(plot.title = element_text(hjust=0.5))
#We are assigning cyl(number of cylinders) to the x-axis.
# factor(gear) i.e number of gears which is a categorical variable will determine the colour of the bars
# The geometry used is bar chart. We can create a bar chart by using the geom_bar() function.
#Results:
# If it is a 4-cylinder car, it would most probably have 4-forward gears.
# Most of the 6-cylinder cars have 4-forward gears followed by 3 gears and and 5 gears.
#There is no 8-cylinder car which has 4-forward gears. Most of these cars have 3-forward gears.
#Using Position Fuction
ggplot(data = carsDB,aes(x=cyl,fill=factor(gear)))+geom_bar(position = "fill")+ labs(title="Histogram CYL by Gear (Proportion)")+ theme(plot.title =
element_text(hjust=0.5))
#The attribute "position" is given as "fill", i.e. we'll get the bar plot in terms of proportion.
#BoxPlot
ggplot(data=carsDB, aes(factor(cyl), mpg))+ geom_boxplot(aes(fill = factor(cyl))) +
labs(title="Boxplot Cyl vs MPG")+ theme(plot.title = element_text(hjust=0.5))
#cyl(# of Cylinders) is assigned to the x-axis
#mpg(mpg) is assigned to the y-axis
# The geometry used is boxplot. We can create a boxplot by using the geom_boxplot() function.
