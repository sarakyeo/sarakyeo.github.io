#Olivia Webster 
#u1419519
#01/28/2023
#Data Analysis Assignment 1 COMM 7370


# Installing and loading packages -----------------------------------------

# install and load tidyverse
# install and load summary tools
# install and load rstatix all by doing install.packages("name") then library(name)

install.packages("tidyverse")
library(tidyverse)

install.packages("summarytools")
library(summarytools)

install.packages("rstatix")
library(rstatix)

#now run the script by pressing "run" or ctrl enter

# C/combine function practice ---------------------------------------------

# Learning about the c() function - to learn about a function, do question mark and letter
?c
# this tells you about the description, usage, gives examples, etc.
# "This is a generic function which combines its arguments. The default method combines its arguments to form a vector. All arguments are coerced to a common type which is the type of the returned value, and all attributes except names are removed."

# Using the c command for manual data entry for the new table.
# name of thing to assign value to, then arrow (assignment symbol) to assign, then C to make the vector/column, then quote the info SEPARATELY as an argument, make sure to separate with commas so the function knows to separate for line.
Aname <- c("C. Clark", "A. Hayes", "C. hooks", "K. Bell", "A. Joens")

#in environment we see the thing we have assigned value to (chr = character)

# now, do the same vector c() with the next data column
Ateam <- c("Iowa", "Middle Tenn", "Ohio", "FGCU", "Iowa State")

# and now create 2 more vectors with c() with the remaining data - if it is NUMBER then NO quotes because quotes MAKE it a CHARACTER
ppg <- c(26.6, 26.4, 25.1, 24.3, 24.2)

pts <- c(799, 663, 628, 632, 678)

# now assign a value to your choice of name for table and run the function tibble(name of vector, name of vector) and it makes a combined table
PracticeTable <- tibble(Aname, Ateam, ppg, pts)

# the c() makes vector and a vector is a TYPE of object - objects in the tibble() do not need ""

# Step 6 - look up new function through ? thing
?class
# this will tell me the classification for our table so we know how we can play with the data - you must pull the object out 

class(PracticeTable$Aname)
#the data type is named and this one is "character" (that is the type of data we are working with)

class(PracticeTable$Ateam)
#also character 

class(PracticeTable$ppg)
#this data type is numeric

class(PracticeTable$pts)
#this data type is also numeric 


# step 7:
# to read data into R, use the read_csv() function - name assign funx - (df = data frame)
df <- read_csv("HELP.csv")

# start with HELP df (named df in mine) 
# THEN select female-only cases from HELP using the sex variable
# THEN Use descr() to get descriptive stats

df %>% # start with your table/data frame
  filter(sex=="female") %>% #this filters out to make sex only female
  descr(i1) # this gives you the info from the codebook provided in assignment
# now you run it!

# 8 b) Min: 0.00, Max: 71.00, Mean: 14.93

# 9 
df %>% 
  filter(sex=="male") %>% 
  descr(i1) 
# 9 b) Min: 0.00, Mean: 18.83, Max: 142.00

# step 10
df %>%
  filter(substance=="alcohol") %>% 
  descr(mcs)
  
# 10) Min: 7.23, Mean: 31.86, Max: 62.18
