# Abby Jones
# u1368713
# 04/20/23
# Data Analysis 3

## Installing and loading packages -----------------------------------------

# First, install packages 
install.packages("tidyverse")
install.packages("summarytools")
install.packages("rstatix")

#Then, load packages
library(tidyverse)
library(summarytools)
library(rstatix)

#Set working directory 
setwd("/Users/abbyjones/Documents/Data Analysis R data ")


## Reading in Data ---------------------------------------------------------

# Read in the CPS data (CPS.csv) using the read_csv() function 
cpsdata <- read_csv("CPS.csv")

## Question 2 --------------------------------------------------------------

# Determine the mean wage earned per hour among males and females. 
# Filter the data by sex and use the descr() function 

cpsdata %>% 
  filter(sex=="M") %>% 
  descr(wage)
# Mean wage earned per hour among males: 9.99 dollars an hour 

cpsdata %>% 
  filter(sex=="F") %>% 
  descr(wage)
# Mean wage earned per hour among females: 7.88 dollars an hour 

# Visualize the mean wage earned per hour by sex in a figure.
# Use ggplot() and stat_summary()

cpsdata %>% 
  ggplot(aes(x = sex, y = wage)) + 
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar")

## Question 3 --------------------------------------------------------------

# Based on the means and the plot from the previous question, 
# I hypothesize that males do earn significantly higher wages than females.

# Implement the appropriate statistical test to determine whether males earn higher wages than females. 
# Dependent variable (wage) is continuous, independent variable (sex) is categorical 
# One group is being compared, so conduct a t-test

cpsdata %>% 
  group_by() %>% 
  t_test(wage ~ sex)

# The test statistic is -4.89 and p-value < .001 
# Does your test support or refute your hypothesis? 
# Because the absolute value of the test statistic is greater than 2, 
# and the p-value <.001,
# it supports the hypothesis that there is a significant difference in the mean wages based on sex. 

## Question 4 --------------------------------------------------------------
# Visualize the relationship between wages earned per hour and number of years of work experience.
# Create a scatter plot where x=exper and y=wage using ggplot() and geom_point()

cpsdata %>% 
  ggplot(aes(x = exper, y = wage)) + 
  geom_point()
  
# I hypothesize that there will be a weak positive relationship between experience and wage
# Test hypothesis using the appropriate statistical test. 
# Because the dependent variable wage is continuous and the independent variable exper is continuous, I will use a Pearson's correlation 

cpsdata %>% 
  cor_test(wage, exper, method = "pearson")
  
# The test statistic = 2.02 and the p-value = 0.0443, the correlation coefficient is 0.087 
# The correlation coefficient is less than one, but it is positive, so it supports the hypothesis of a weak positive relationship. 
# The p-value is less than 0.05 so I am confident in these results. 

## Question 5 --------------------------------------------------------------

# Plot the mean of job satisfaction by job sector. 
# Using ggplot() and stat_summary()

cpsdata %>% 
  ggplot(aes(x = sector, y = satisfaction)) + 
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar")

# Formulate a hypothesis about whether there are differences in satisfaction by job section
# There does not appear to be significant differences in satisfaction by job section. 
# I hypothesize that there is no statistically significant difference in satisfaction by job section. 

# Conduct and report the appropriate statistical test. 
# The dependent variable satisfaction is categorical. 
# The independent variable sector is categorical. 
# So I will conduct a chi-square test. 

tbl <- table(cpsdata$sector, cpsdata$satisfaction)
tbl %>% 
  chisq_test()

# Pearsons r = 3.65, p value = 0.819
# This is not sufficient to reject the null hypothesis, so my hypothesis is supported. 


## Question 6 --------------------------------------------------------------

# Visualize mean wage per hour by job sector.
# Use ggplot() and stat_summary()

cpsdata %>% 
  ggplot(aes(x = sector, y = wage)) + 
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar")

# Formulate a hypothesis about the relationship between these variables. 
# I hypothesize that there is a difference in wages per hour based on job sector. 

# Conduct an appropriate statistical test and report your results. 

# Dependent variable wage is continuous, independent variable sector is categorical
# More than 2 groups being compared 
# So I should use an ANOVA test 

cpsdata %>% 
  anova_test(wage ~ sector)

# The test statistic = 16.796 and the p-value = 4.64e-20 
# Given how small the p-value is, the null hypothesis is rejected. 
# My hypothesis that there is a difference in wages per hour based on job sector is supported. 
