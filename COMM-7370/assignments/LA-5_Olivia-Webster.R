#Olivia Webster 
#u1419519
#04/05/2023
#Data Analysis Assignment 3 COMM 7370


#first things first! Load ya packages (step 1)

library(tidyverse)
library(summarytools)
library(rstatix)

# load the help dataset next

df <- read_csv("CPS.csv") 

# Step 1
# Packages loaded, codebook reviewed, CPS data read into R

# Step 2
df %>% 
  filter(sex=="M") %>% 
  descr(wage) 
# The mean wage per hour for males is 9.99
df %>% 
  filter(sex=="F") %>% 
  descr(wage)
#The mean wage per hour for females is 7.88
#visualize the mean wage earned per hour by sex in a figure - attempted!
# but I think I just plotted all of the wages, not the mean wages, and the graph looks funny.
ggplot(
  data = df,
  mapping = aes(x = sex, y = wage)) +
  geom_boxplot()

# Step 3
# Hypothesis: Males will have a significantly higher wages earned per hour than females.

CPS %>%
  t_test(wage ~ sex)

#utilized the graph from assignment two to select this t test
#My test supports my hypothesis.

# Step 4
#Hypothesis: More years of work experience will result in a higher wage.
ggplot(
  data = df,
  mapping = aes(x = exper, y = wage)) +
  geom_point()
# There is a weak-positive relationship, thus somewhat supporting my hypothesis.

# Step 5
# Hypothesis: Employment satisfaction will not differ by job sector.

df %>%
  group_by(sector) %>%
  summarize(mean_sat = mean(satisfaction)) %>%
  
ggplot(aes(x = sector, y = mean_sat)) +
  geom_bar(stat = "identity")

# new - mean_sat to label those means - new Y needs to be the means. 

df %>%
  anova_test(satisfaction ~ sector)

# The results do differ by job sector - this refutes the hypothesis.

# Step 6

#Hypothesis: Mean wages will be significant different by sector.

df %>%
  group_by(sector) %>%
  summarize(mean_wage = mean(wage)) %>%
  
  ggplot(aes(x = sector, y = mean_wage)) +
  geom_bar(stat = "identity")

df %>%
  anova_test(wage ~ sector)
# There is a strong statistical difference between mean wages across sectors - this supports the hypothesis.

