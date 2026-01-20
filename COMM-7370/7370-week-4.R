# Loading packages ---------
library(tidyverse)
library(rstatix)
library(summarytools)
library(psych)
library(huxtable)

# Read data into R ---------------
gss <- read_csv(here::here("COMM-3710", "LA", "GSS.csv"))
glimpse(gss)

# Discuss data types

# Descriptive statistics --------------
gss |> freq(childs) # what is the issue? Does it need wrangling?
# What kind of data is this? What type of data do we need if we want to calculate M, SD?
