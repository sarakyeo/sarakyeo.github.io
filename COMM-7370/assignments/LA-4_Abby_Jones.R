# Abby Jones
# u1368713
# 04/20/23
# Data Analysis 2

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


## Reading in data ---------------------------------------------------------

# Read in the HELP data (HELP.csv) using the read_csv() function 
helpobject <- read_csv("HELP.csv")

## Analysis ----------------------------------------------------------------

# Examine variables of interest using a frequency distribution using the freq() function

# variables: sex
helpobject %>% 
  freq(sex) #Examine the frequency distribution of sex in helpobject data frame

# variables: d1 (lifetime number of hospitalizations based on medical problems)
helpobject %>% 
  freq(d1) #Examine the freq distribution of d1 in helpobject data frame

# Question 2a. How many patients in the study are female?
# Answer: 107 patients
# Question 2b. How many patients in the study have never been hospitalized for medical problems?
# Answer: 92 patients
# Question 2c. What percentage of patients in the study have been hospitalized fewer than 5 times?
# Answer: 83.22% 

# Subset the data to include only respondents who meet certain criteria using the filter() function
# Include respondents whose primary substance abuse is cocaine and who are at least 40 years old, then freq dist freq() of age in this subset 

helpobject %>% 
  filter(substance=="cocaine" & age <= 40) %>% 
  freq(age)

# Question 3a. How many patients are included in this subset?
# Answer: 129 patients
# Question 3b. What is the mean age in this subset? 
#Use descriptive statistics: descr()
helpobject %>% 
  filter(substance=="cocaine" & age <= 40) %>% 
  descr(age)
#Answer: 32.39

# Use the mutate() function to recategorize continuous variables as categorical variables 
# Categorize respondents by their depression scores, cesd 
# Into new variable dcesd with two categories: low <= 30, high > 30 using the case_when() function

helpobject <- helpobject %>% 
  mutate(dcesd = case_when(cesd <= 30 ~ "low", cesd > 30 ~ "high"))

# To check that you made the new variable dcesd correctly, use freq()
helpobject %>% 
  freq(dcesd)

# Question 4a. How many respondents are in each category?
# Answer: high = 271, low = 182 
# Question 4b. What is the mean age of respondents in each category? 
# Use the filter() and descr() functions here 

helpobject %>% 
  filter(dcesd=="low") %>% 
  descr(age)

helpobject %>% 
  filter(dcesd=="high") %>% 
  descr(age)

# Answer: for dcesd=low, the mean age of respondents is 36.03. For dcesd=high, the mean age is 35.40

# Make new variable ExtremeMCS, code it as 1 if mcs < 20, 0 if mcs >= 20
helpobject <- helpobject %>% #write the new variable back into data frame
  mutate(ExtremeMCS = case_when(mcs < 20 ~ 1, mcs >= 20 ~ 0))

# To check that you made the new variable ExtremeMCS correctly, use freq()
helpobject %>% 
  freq(ExtremeMCS)

# Question 5a: How many patients are at risk of returning to the detoxification unit in the next 12 months? 
# Answer: 91 patients 
# Question 5b: What percentage of patients are at low risk of returning to the detoxification unit in the next 12 months?
# Answer: 79.91% of patients 

# Create new variables using the mutate function
# If g1b = "no", SucidalThought = 0, if g1b = "yes", SuicidalThought = 1 

helpobject <- helpobject %>% 
  mutate(SuicidalThought = case_when(g1b=="yes" ~ 1, g1b=="no" ~ 0))

helpobject %>% 
  freq(SuicidalThought)

# If homeless = "homeless", HomelessStatus = 1, if homeless = "housed", HomelessStatus = 0

helpobject <- helpobject %>% 
  mutate(HomelessStatus = case_when(homeless=="homeless" ~ 1, homeless=="housed" ~ 0))

helpobject %>% 
  freq(HomelessStatus)

# Create new variable RiskTotal that sums the number of risk factors for each patient 
# Sum up ExtremeMCS, SuicidalThought, and HomelessStatus 

helpobject <- helpobject %>% 
  rowwise() %>% # Tells R to add the variables row by row 
  mutate(RiskTotal = ExtremeMCS + SuicidalThought + HomelessStatus)

helpobject %>% 
  freq(RiskTotal)

# Question 6a. What percentage of patients in the study have fewer than 3 risk factors?
# Answer: 94.92% of patients

# Using ggplot() make a histogram of age using geom_bar()
helpobject %>% 
  ggplot(aes(x=age)) +
  geom_bar()

# Question 8: It is not normally distributed, it appears to be slightly positively skewed.
# Based on the graph, I would guess that the mean is around 38 years. 

helpobject %>% 
  descr(age)

# Question 9: The mean is 35.65. My estimate was a bit high, but it matches fairly closely. 

# Using ggplot() make a scatterplot with age on the x-axis and i1 on the y-axis
# Use geom_point()
helpobject %>% 
  ggplot(aes(x=age, y=i1)) +
  geom_point()

# Question 10: There does appear to be a weak, positive relationship between age and i1. 

# Test the correlation between age and i1 using cor_test()
helpobject %>% 
  cor_test(age, i1)

# Question 11: The correlation coeffecient (r) = 0.21. 
# The p-value is 0.00000896, which means the relationship between age and i1 is significant. 

# Test if there is a difference between pcs among males and females in the sample
# Using an independent samples t-test 
helpobject %>% 
  group_by() %>% 
  t_test(pcs~sex)

# The test statistic is -3.49 and p < 0.001 

# Graph the means for each variable with error bars using ggplot()
helpobject %>% 
  ggplot(aes(x = sex, y = pcs)) +
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar")

