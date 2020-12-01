## LA.7

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
cps <- read.csv("CPS.csv")

## 2
mwage <- mean(cps$wage[cps$sex == "M"])
fwage <- mean(cps$wage[cps$sex == "F"])

## 3
t.test(cps$wage ~ cps$sex, var.equal = TRUE)

## 4
res.cor <- cor.test(cps$wage, cps$exper, method = "pearson")
res.cor

## 5
tbl <- table(cps$sector, cps$satisfaction)
chisq.test(tbl)