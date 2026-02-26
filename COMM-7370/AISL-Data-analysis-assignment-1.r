# 1) Using journal article at this link: https://doi.org/10.1080/21548455.2022.2123259
# Data and codebook downloaded from OSF.

# 2) Load packages ----
library(tidyverse)
library(rstatix)
library(summarytools)

# 3) Read data into R ----
aisl <- read_csv(here::here(
  "COMM-3710", "LA", "humor-data.csv"
))
glimpse(aisl)
# 3a) There are X,XXX observations in this dataset.
# 3b) There are XXX variables in this dataset. 

# Filter R based on Q1 and Q2 ----
aisl |> freq(Q1) # no need to filter based on Q1

aisl |> freq(Q2) # no need to filter based on Q2

# 4) X,XXX participants are at least 18 years old and 
# consented to participate.

# 5) Add answer here...
humor |> freq(issue)

# 6) Add answer here...
humor |> freq(gwhumor)
humor |> freq(aihumor)
humor |> freq(mhumor)

# 7) Creating `mirth` from five variables.

humor |> 
  select(Q86_1:Q86_4, Q86_7) |> 
  freq()

humor <- humor |> # write col back into dataframe
  rowwise() |> # mutate by row
  mutate(
    mirth = mean( # take mean of the 5 variables 
      c(Q86_1, Q86_2, Q86_3, Q86_4, Q86_7),
      na.rm = TRUE
    )
  )

humor |> freq(mirth)

## Generic mutate function to create an index

df <- df |> 
  rowwise() |> 
  mutate(
    newvar = mean(
      c(oldvar1, oldvar2, oldvar3),
      na.rm = TRUE
    )
  )
