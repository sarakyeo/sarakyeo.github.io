## LA.4: Working with Data

## Load packages
library(tidyverse)
library(descr)
library(Hmisc)

## 1: Load HELP data set from LA.3
helpdata <- read.csv("HELP.csv")

## 2: 
helpdata$ExtremeMCS <- ifelse(helpdata$mcs < 20, 1, 0)

## 3
helpdata$SuicidalThought <- ifelse(helpdata$g1b == "no", 0, 1)

## 4
helpdata$HomelessStatus <- ifelse(helpdata$homeless == "housed", 0, 1)

## 5
helpdata <- transform(helpdata,
                      RiskTotal = ExtremeMCS + SuicidalThought + HomelessStatus)

## 6
freq(helpdata$ExtremeMCS)
freq(helpdata$SuicidalThought)
freq(helpdata$RiskTotal)