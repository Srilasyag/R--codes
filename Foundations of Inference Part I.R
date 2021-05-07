#Create Dataset
x <- c(25.7, 38.5, 29.3, 25.1, 30.6, 34.6, 30.0, 39.0, 33.7, 31.6,
       25.9, 34.4, 26.9, 23.0, 31.1, 29.3, 34.5, 35.1, 31.2, 33.2,
       30.2, 36.4, 37.5, 27.6, 24.6, 23.9, 27.0, 29.5, 30.1, 29.6,
       27.3, 31.2, 32.5, 25.7, 30.1, 24.2, 24.1, 26.4, 31.0, 20.7,
       33.5, 32.2, 34.7, 32.6, 33.5, 32.7, 25.6, 31.1, 32.9, 25.9)
#Create the mean, standard deviation, and standard error
mean.x <- mean(x)
sd.x <- sd(x)
SE.x <- sd(x) / sqrt(length(x))
#Show the mean, standard deviation and standard error
mean.x
sd.x
SE.x