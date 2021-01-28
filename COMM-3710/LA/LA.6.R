## LA.6: Examining Relationships

## Load packages
library(tidyverse)
library(magrittr)
library(descr)
library(rstatix)


## 1: Set working directory and load Utilities.csv dataset
setwd("C:/Users/SaraK/Downloads/sarakyeo.github.io/COMM-3710/LA")
utilities <- read.csv("Utilities.csv")

# Apply data management code to create season variable
utilities %<>% 
        mutate(season = case_when(
                month == 12 ~ "winter",
                month == 1 ~ "winter",
                month == 2 ~ "winter",
                month == 3 ~ "spring",
                month == 4 ~ "spring",
                month == 5 ~ "spring",
                month == 6 ~ "summer",
                month == 7 ~ "summer",
                month == 8 ~ "summer",
                month == 9 ~ "fall",
                month == 10 ~ "fall",
                month == 11 ~ "fall"))

# View frequency table of season variable
freq(utilities$season)


## 2: Is there a relationship between total bill and season?
freq(utilities$totalbill) # continuous
freq(utilities$season) # categorical with more than 2 categories

# 2a: What statistical test did you use? ANOVA
utilities %>% anova_test(totalbill ~ season)

# 2b. What is the test statistic and p-value?
# F = 70.838, p = 7.58e-26, i.e., p <. 05

# 2c. Is there a sig. relationship?
# Yes