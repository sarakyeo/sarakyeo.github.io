# Abby Jones
# u1368713
# 03/07/2023
# Data Analysis 1 

##Installing and loading packages ----------------------------------------

#First, install packages 
install.packages("tidyverse")
install.packages("summarytools")
install.packages("rstatix")
#Then, load packages 
library(tidyverse)
library(summarytools)
library(rstatix)

#Set working directory 
setwd("/Users/abbyjones/Documents/Data Analysis R data ")

## Manually entering data --------------------------------------------------

#Learning about the c() function, open documentation for the c() function 
?c() 
#Description
#This is a generic function which combines its arguments. The default method combines its arguments to form a vector. All arguments are coerced to a common type which is the type of the returned value, and all attributes except names are removed.
#This function combines values into a list. 

#Create objects using the assignment operator (<-) and use the c() function to assign values
Aname <- c('C. Clark', 'A. Hayes', 'C. hooks', 'K. Bell', 'A. Joens')
Ateam <- c('Iowa', 'Middle Tenn', 'Ohio', 'FGCU', 'Iowa State')
ppg <- c(26.6, 26.4, 25.1, 24.3, 24.2)
pts <- c(799, 663, 628, 632, 678)

#Calling objects to make sure I have created them correctly
Aname
Ateam
ppg
pts

#Put the objects into a data frame, players, using the tibble() function 
players <- tibble(Aname, Ateam, ppg, pts)

View(players)

#Open documentation about the class() function to learn about it 
?class()
#Description 
#R possesses a simple generic function mechanism which can be used for an object-oriented style of programming. Method dispatch takes place based on the class of the first argument to the generic function.
#This function tells you about the types of data stored in the table/list/etc.

#Examine the data in the players data frame using the class() function and extractor operator $ for each column 
class(players$Aname)
class(players$Ateam)
class(players$ppg)
class(players$pts)

#data type for colum Aname: character
#data type for column Ateam: character
#data type for column ppg: numeric
#data type for column pts: numeric

#Read data into R using read_csv() function
helpobject <- read_csv("HELP.csv")

View(helpobject)

#Using pipe operator
#shortcut: Command + shift + M 

#Question 8.a. What is the name of the variable that measures the average number of drinks consumed per day in the last 30 days?
#Answer: i1 

#Determine the average number of drinks among females
#Start with HELP data frame: helpobject, then pipe operator 
helpobject %>% 
  filter(sex=="female") %>% #Select female-only cases in the data set 
  descr(i1) #Use the descr() function to get descriptive statistics 

#Question 8.b. What is the minimum, maximum, and mean number of average drinks consumed per day in the past 30 days among females in the sample?
#Answer: 
#Minimum: 0
#Maximum: 71
#Mean: 14.93 

#Determine the average number of drinks among males 
helpobject %>% 
  filter(sex=="male") %>% 
  descr(i1)

#Question 9 Answer:
#Minimum: 0 
#Maximum: 142
#Mean: 18.83

#Question 10:

#Get descriptive statistics for the SF-36 mental component score among females in the sample whose primary substance abuse is alcohol
helpobject %>% 
  filter(sex=="female") %>% #Select female-only cases
  filter(substance=="alcohol") %>%  #Select only alcohol use cases 
  descr(mcs)

#Mean: 26.49
#Minimum: 7.23
#Maximum: 55.48

#Get descriptive statistics for the SF-36 mental component score among females in the sample whose primary substance abuse is alcohol
helpobject %>% 
  filter(sex=="male") %>% 
  filter(substance=="alcohol") %>% 
  descr(mcs)

#Mean: 33.23
#Minimum: 9.16
#Maximum: 62.18

#Get descriptive statistics for the SF-36 mental component score among males and females whose primary substance abuse is alcohol 
helpobject %>% 
  filter(substance=="alcohol") %>% 
  descr(mcs)

#Mean: 31.86
#Minimum: 7.23
#Maximum: 62.18