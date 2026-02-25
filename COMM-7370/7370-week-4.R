# Loading packages ---------
# install.packages("tidyverse")
# install.packages("rstatix")
# install.packages("summarytools")
# install.packages("here")

library(tidyverse)
library(rstatix)
library(summarytools)

# Read data into R ---------------
gss <- read_csv(here::here("COMM-3710", "LA", "GSS.csv"))
glimpse(gss)

# Discuss data types

# Descriptive statistics --------------

gss |> freq(childs) # what is the issue? Does it need wrangling?

# What kind of data is this? What type of data do we need if we want to calculate M, SD?

gss |> freq(year)

gss <- gss |> 
  mutate(
    nchild = case_when(
        childs == "0" ~ 0,
        childs == "1" ~ 1,
        childs == "2" ~ 2,
        childs == "3" ~ 3,
        childs == "4" ~ 4,
        childs == "5" ~ 5,
        childs == "6" ~ 6,
        childs == "7" ~ 7,
        childs == "8 or more" ~ 8
    )
  )

gss |> freq(nchild)

gss |> descr(nchild) #descr is the function for descrtiptive stats

gss <- gss |> 
  mutate(
    dchild = case_when(
        nchild <= 1 ~ "low",
        nchild > 1 ~ "high"
    )
  )

gss |> freq(dchild)
