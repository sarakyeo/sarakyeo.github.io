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

# or ...

mwage <- mean(cps$wage[cps$sex == "M"])
fwage <- mean(cps$wage[cps$sex == "F"])


## 3: 
t.test(cps$wage ~ cps$sex, var.equal = TRUE)

## 4
res.cor <- cor.test(cps$wage, cps$exper, method = "pearson")
res.cor

## 5
tbl <- table(cps$sector, cps$satisfaction)
chisq.test(tbl)