#### ------------- Part 3 of homework ------------- ####

#import packages
library(ggplot2)

#set path to working directory
setwd("~/Desktop/university-of-the-cumberlands/R/hw1/chicago_house_income")

#create data set
houseData <- read.table("Houses.txt", header = TRUE)

#create histogram of price
ggplot(houseData, aes(x=price)) + 
  geom_histogram(binwidth = 10, color = "black",fill = "white") + 
  labs(x = "Price of House (in Thousands of Dollars)", y = "Frequency", 
        title = "Histogram of the Price of House")

#Find the percentage of observations that fall within one 
#standard deviation of the mean.

#calculate the mean and standard deviation of price
meanPrice <- mean(houseData$price)
stdevPrice <- sd(houseData$price)

#create the lower and upper bounds of one stdev away from the mean
lower_stdev_bound <- meanPrice - stdevPrice
upper_stdev_bound <- meanPrice + stdevPrice

#determine the total amount of data points within the range
total_observations_one_stdev <- sum(houseData$price >= lower_stdev_bound & 
                                      houseData$price <= upper_stdev_bound)
  
#determine the total determine the total amount of data points 
total_observations <- length(houseData$price)

#determine the percentage of data within one stdev aways from the mean
percentage_observations_one_stdev = 
  total_observations_one_stdev/total_observations * 100

#create a box plot for the data
ggplot(houseData, aes(x=price)) + 
  geom_boxplot() + 
  labs(x = "Price of House (in Thousands of Dollars)", 
                        title = "Box Plot of the Price of House") +
  theme(axis.text.y = element_blank())
