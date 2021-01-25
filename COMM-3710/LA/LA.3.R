## LA.3: Examining Data
## Student Name

## Load packages
library(tidyverse)
library(descr)

## Set working directory
setwd("C:/Users/SaraK/Downloads/sarakyeo.github.io/COMM-3710/LA")

## 1: Load dataset
hdata <- read.csv("HELP.csv") # load HELP.csv
        # loaded data of 453 observations of 27 variables

## 2: Make frequency tables for sex and d1
freq(hdata$sex) # freq table for sex
freq(hdata$d1) # freq table for d1

## 3: Subset data to incl substance == cocaine and over 40 years old
hsub <- subset(hdata, substance == "cocaine" & age >= 40) # subset data
        # contains 27 obs of 27 var

## 4: Make freq table based on subset
freq(hsub$sex) # freq table for sex (subset of data)