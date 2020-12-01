## LA.3: Examining Data

## Load packages
library(tidyr)
library(dplyr)
library(ggplot2)
library(descr)
library(ggpubr)
library(rstatix)
library(rmarkdown)

## 1
helpdata <- read.csv("HELP.csv") # load HELP.csv

## 2
freq(helpdata$female) # freq table for sex
freq(helpdata$d1) # freq table for d1

## 3
datasub <- subset(helpdata, substance == "cocaine" & age >= 40) # subset data

## 4
freq(datasub$female) # freq table for sex (subset of data)