#Load Library
library(ggplot2)

#Load Data
data(carsDB)

#1 Construct a scatterplot with smoothing for mpg vs. disp

ggplot(data = carsDB,aes(x = mpg, y = disp)) + geom_point()+ stat_smooth(method = 'lm')+labs(title="Scatter Plot MPG and DISP with Smoothing")+
theme(plot.title = element_text(hjust=0.5)) + xlab('MPG') + ylab('DISP(cu.in)')

#2 Construct a scatterplot with smoothing for mpg vs. hp

ggplot(data = carsDB,aes(x = mpg, y = hp)) + geom_point()+ stat_smooth(method = 'lm')+labs(title="Scatter Plot MPG and HP with Smoothing")+
theme(plot.title = element_text(hjust=0.5)) + xlab('MPG') + ylab('HP')




#3. Construct a scatterplot with smoothing for mpg vs. wt
ggplot(data = carsDB,aes(x = mpg, y = wt)) + geom_point()+ stat_smooth(method = 'lm')+labs(title="Scatter Plot MPG and WT with Smoothing")+
  theme(plot.title = element_text(hjust=0.5)) + xlab('MPG') + ylab('Weight(1000)')






#4. Please explain the following:
# a) Identifiable Trends for each of the three (3) scatterplots

For the first scatterplot of mpg vs. displ, It can be concluded that as the displacement decreases, mpg increases. 


For the second scatterplot of mpg vs. hp, It can be concluded that as the mpg increases, hp decreases.

For the third scatterplot of mpg vs wt, It can be concluded that as mpg increases, the wt decreases.

#b) Any anomalies that you see for each of the three (3) scatterplots
For the first scatterplot of mpg vs displacement, it can be seen that there are  anomalies  in the range of 100 to 400 cubic inches. 
These values fall away from the trendline.The maximum disp around 460 cubic inches at around 33 mpg, and the minimum disp around 71 cubic inches is around 33 mpg.

For the second scatterplot of mpg vs hp, it can be seen that there are anomalies  in the range of 100 to 350 hp.
These values fall away from the trendline.
The maximum HP  occurs at 15 mpg and the minimum HP occurs around 32 mpg.

For the third scatterplt of mpg vs weight(1000), it can be seen that there are anomalies in the range of 2000 lb to 5500 lbs.
These values fall away from the trendline. The maximum weight around 5500 lbs occurs around 11 mpg, and the minimum weight around 1400 lbs occurs around 34 mpg.

