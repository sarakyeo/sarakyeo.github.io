## LA.5

## Load packages
library(tidyr)
library(descr)
library(ggpubr)
library(rstatix)
library(rmarkdown)
library(formatR)

## 1: Load Utilities.csv data set
utilities <- read.csv("Utilities.csv")


## 2: 
hist(utilities$totalbill)


## 3
plot(utilities$month, utilities$gasbill)

## 4
plot(utilities$month, utilities$elecbill)

## 5
plot(utilities$kwh, utilities$elecbill)

## 6
plot(utilities$ccf, utilities$gasbill)

## 7
utilities$season[utilities$month == 12 | utilities$month == 1 | utilities$month == 2] <- "winter"
utilities$season[utilities$month == 3 | utilities$month == 4 | utilities$month == 5] <- "spring"
utilities$season[utilities$month == 6 | utilities$month == 7 | utilities$month == 8] <- "summer"
utilities$season[utilities$month == 9 | utilities$month == 10 | utilities$month == 11] <- "fall"
freq(utilities$season)

## 8
utilities$DonorStatus <- ifelse(utilities$donate == "yes", 1, 0)

## 9
sorted <- reorder(utilities$season, utilities$DonorStatus)
counts <- table(utilities$DonorStatus, sorted)
barplot(counts)