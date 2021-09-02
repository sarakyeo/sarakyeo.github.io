# Name: Louise Belcher
# Student ID: u0000001
# Date: MM/DD/YYYY
# COMM 3710 Assignment: LA.3


# Installing and Loading Packages -----------------------------------------
# Install tidyverse package
install.packages("tidyverse")
# Install magrittr package
install.packages("magrittr")
# Install summarytools package

# Install rstatix package

# Load tidyverse package
library(tidyverse)
# Load magrittr package
library(magrittr)
# Load summarytools package
# Load rstatix package


# Set working directory ---------------------------------------------------
setwd("C:/Users/sarak/Documents/_git-repos/sarakyeo.github.io/COMM-3710")


# Check out c() function in R ---------------------------------------------
# Pull up help page for c()
?c

# The c() function... [add description here]


# Entering data -----------------------------------------------------------
# Enter data into Aname
Aname <- c("C.Clark", "A. Hayes", "C. Hooks", "K. Bell", "A. Joens")

# Enter data into Ateam
Ateam <- c()

# Enter data into ppg
ppg <- c(26.6, 26.5, 25.1, 24.3, 24.2)

# Enter data into pts
pts <- c()



# Check and combine -------------------------------------------------------
# Check Ateam, Aname, ppg, and pts
Aname
ppg

# Combine objects into tibble
mydata <- tibble(Aname, ppg)
# If you need help with the tibble function, pull up the help documentation.



# Examine data types in mydata tibble -------------------------------------
# First, pull up and read documentation for class() 
?class

# The class() function ... [add description here]

# Check class of each column in mydata tibble
class(mydata$Aname)
class(mydata$ppg)

# Ateam is ...
# Aname is ...
# ppg is ...
# pts is ...


# Run and complete learnr tutorial ----------------------------------------
# Install learnr package
# Load learnr package


# Answers to Step 10 ------------------------------------------------------
# 10a. 
# 10b. 
# 10c. 
# 10d. 






