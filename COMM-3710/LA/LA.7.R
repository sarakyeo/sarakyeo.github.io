## LA.7: Practice Data Analysis

## Set working directory and load packages
setwd("C:/Users/SaraK/Downloads/sarakyeo.github.io/COMM-3710/LA")

library(tidyverse)
library(magrittr)
library(descr)
library(ggpubr)
library(rstatix)
library(rmarkdown)
library(formatR)


## 1: Load CPS data
cps <- read.csv("CPS.csv")


## 2: Find mean wage earned per hour for men and women.
cps %>% 
        subset(sex == "M") %>% 
        summarise(M = mean(wage, na.rm = TRUE)) # $9.99

cps %>% 
        subset(sex == "F") %>% 
        summarise(M = mean(wage, na.rm = TRUE)) # $7.88

# or...

mwage <- mean(cps$wage[cps$sex == "M"])
fwage <- mean(cps$wage[cps$sex == "F"])


## 3: Conduct appropriate statistical test
cps %>% 
        t_test(., wage ~ sex, var.equal = TRUE)

# or...

t.test(cps$wage ~ cps$sex, var.equal = TRUE)

## 3a: t-test to compare continuous DV and categorical IV.
## 3b: t = -4.84
## 3c: p < .05; The mean wage earned per hour for females is significantly lower than that of males.


## 4: Conduct appropriate statistical test
freq(cps$exper)
cps %>% 
        cor_test(., exper, wage, method = "pearson")

# or...

cor.test(cps$wage, cps$exper, method = "pearson")

## 4a: Pearson's correlation to compare two continuous variables.
## 4b: r = 0.087
## 4c: p = .044; There is a weak positive correlation (r = .087) between number of years of work experience and wages earned per hour.


## 5: Conduct appropriate statistical test
tbl <- table(cps$sector, cps$satisfaction)
chisq.test(tbl)

# or...

chisq_test(tbl)

## 5a: Chi-squared test 
## 5b: X2 = 3.65 
## 5c: p = .819; There is no significant difference in job satisfaction by sector.