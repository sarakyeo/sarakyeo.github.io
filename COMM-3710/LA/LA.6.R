## LA.6: Examining Relationships

## Load packages
library(tidyr)
library(dplyr)
library(ggplot2)
library(descr)
library(ggpubr)
library(rstatix)
library(rmarkdown)
library(formatR)

## 1
utilities <- read.csv("Utilities.csv")
utilities$season[utilities$month == 12 | utilities$month == 1 | utilities$month == 2] <- "winter"
utilities$season[utilities$month == 3 | utilities$month == 4 | utilities$month == 5] <- "spring"
utilities$season[utilities$month == 6 | utilities$month == 7 | utilities$month == 8] <- "summer"
utilities$season[utilities$month == 9 | utilities$month == 10 | utilities$month == 11] <- "fall"
freq(utilities$season)

## 2
res.aov <- utilities %>% anova_test(totalbill ~ season)
res.aov