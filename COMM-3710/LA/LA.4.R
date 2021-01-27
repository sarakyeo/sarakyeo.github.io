## LA.4: Working with Data

## Load packages and set working directory
library(tidyverse)
library(descr)
library(Hmisc)
library(magrittr) # only required if using pipe function, %<>% 

setwd("C:/Users/SaraK/Downloads/sarakyeo.github.io/COMM-3710/LA")


## 1: Load HELP data set from LA.3
helpdata <- read.csv("HELP.csv")


## 2: Create ExtremeMCS variable
freq(helpdata$mcs)
helpdata$ExtremeMCS <- ifelse(helpdata$mcs < 20, 1, 0)
# or...
helpdata %<>% 
        mutate(ExtremeMCS = case_when(mcs < 20 ~ 1,
                                      mcs >= 20 ~ 0))


## 3: Create SuicidalThought variable based on g1b variable
freq(helpdata$g1b)
helpdata$SuicidalThought <- ifelse(helpdata$g1b == "no", 0, 1)
# or...
helpdata %<>% 
        mutate(SuicidalThought = case_when(g1b == "no" ~ 0,
                                           g1b == "yes" ~ 1))


## 4: Create HomelessStatus variable based on homeless variable
freq(helpdata$homeless)
helpdata$HomelessStatus <- ifelse(helpdata$homeless == "housed", 0, 1)
# or...
helpdata %<>% 
        mutate(HomelessStatus = case_when(homeless == "housed" ~ 0,
                                          homeless == "homeless" ~ 1))


## 5: Construct RiskTotal by summing ExtremeMCS, SuicidalThought, and HomelessStatus
helpdata <- transform(helpdata,
                      RiskTotal = ExtremeMCS + SuicidalThought + HomelessStatus)
# or...
helpdata %<>%
        rowwise() %>% 
        mutate(RiskTotal = ExtremeMCS + SuicidalThought + HomelessStatus)


## 6: Frequency tables of ExtremeMCS, SuicidalThought, and RiskTotal.
freq(helpdata$ExtremeMCS)
freq(helpdata$SuicidalThought)
freq(helpdata$RiskTotal)

## 6a: 91 patients thought to be at risk based on their mcs score.
## 6b: 28.04% of patients have experienced suicidal thoughts.
## 6c: 94.9% of patients have fewer than 3 risk factors.
