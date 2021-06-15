## LA.3: Examining Data
## Student Name and ID

## Load packages
library(tidyverse)
library(descr)

## Set working directory--used Ctrl+Shift+H, then copied and pasted command
## into R script
setwd("C:/Users/SaraK/Downloads/sarakyeo.github.io/COMM-3710/LA")

## STEP 1
## Load HELP.csv dataset into R
hdata <- read.csv("HELP.csv") # this command loads HELP.csv
# loaded data, whcih contains 453 observations of 27 variables

## STEP 2
## Make frequency tables for sex and d1
## Note: I need the descr package for the freq() function
freq(hdata$sex) # freq table for sex
freq(hdata$d1) # freq table for d1

## 2a. How many patients in the study are female?
freq(hdata$sex) # 107 patients in the study are female

## 2b. How many have never been hospitalized for medical problems?
freq(hdata$d1) # 92 have never been hospitalized for medical problems

## 2c. What percentage of patients in the study have been hospitalized fewer
##     than 5 times?
lessfive <- (92 + 120 + 92 + 36 + 37) / 453
lessfive # 83.2%


## STEP #
## Subset data to incl substance == cocaine and over 40 years old
hsub <- filter(hdata, substance == "cocaine" & age >= 40) # subset data
# contains 27 obs of 27 var

## Make frequency table for age
freq(hsub$age)

## 3a. How many patients are between the ages of 45 and 45?
ans <- 4 + 4 + 3 + 3 + 1 + 2
ans # 17 patients are between 40 and 45


## 4. Make freq table based on subset
freq(hsub$sex) # freq table for sex (subset of data)

## 4a. 27 patients are at least 40 years old and have cocaine listed as his/her
##     primary abuse substance.

## 4b. 74.07% patients are at least 40 years old, have cocaine listed as his/her
##     primary abuse substance, and are male.




