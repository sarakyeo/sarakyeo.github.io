#Aly Hill
#u1235528
#1/27/2023
#7370 data analysis 1 

#Installing and loading packages -----------------------------------------

#Install and load tidyverse, summary tools, rstatix

#Install tidyverse
install.packages("tidyverse")
#Install rstatix
install.packages("rstatix")
#install summarytools
install.packages("summarytools")

#Load tidyverse
library(tidyverse)
#Load rstatix 
library(rstatix)
#Load summary tools
library(summarytools)

# Combination  ------------------------------------------------------------
#Practicing with the C function
?c
#This is a generic function which combines the function's arguments. 

#The default method combines its arguments to form a vector. All arguments are coerced to a common type which is the type of the returned value, and all attributes except names are removed.
#personal notes_Vectors are like columns 

#Use the C function to combine info from a table

#The assignment operator (arrow) assigns a value to a variable. In this case, it's assigning a vector to 'Aname'
#Use alt then dash to create an assingment operator
#Now, assigning values to the object 'Aname'; each input in quotations is an argument
Aname <- c("C. Clark", "A. Hayes", "C. Hooks", "K. Bell","A. Joens")

#Write a new vector with different arguments
Ateam <- c("Iowa", "Middle Tenn", "Ohio", "FGCU", "Iowa State")

#Write a new vector (object); personal note: numbers don't go in quotations
ppg <- c(26.6,26.4,25.1,24.3,24.2)

#Write another new vector (object)
pts <- c(799,663,628,632,678)

#A data frame is is like a table where your vectors appear together as separate columns 
#The tibble function combines vectors together into a table
#Now, build a data frame out of the previously created vectors using the tibble command; personal note: do not use quotations for objects 
dataframepractice <- tibble(Aname,Ateam,ppg,pts)

#Look up class function 
?class
#R possesses a simple generic function mechanism which can be used for an object-oriented style of programming. Method dispatch takes place based on the class of the first argument to the generic function.
#This helps determine what this data is and what we can do with it
#Run class function for vector to learn the data category, e.g., is the vector numeric, character, factors
class(dataframepractice$Aname)

#The data type pops up when you run each vector 
class(dataframepractice$Ateam)
class(dataframepractice$ppg)
class(dataframepractice$pts)

#To read data into R, use the read_csv() function 
#Use this function, to read in the HELP.csv dataset
df <- read_csv("HELP.csv")

#Now, we will practice filtering data
#Start with the HELP data frame (called df)
#Select female-only cases from the HELP data using the sex variable using the filter() function
#To do this, write the function, and, in the parentheses, write the variable and use'==' to look for a specific condition (Female in this case)

df %>% #%>% is called a forward pipe operator; it  acts as a 'then' statement to tell R in what order to perform the functions
  filter(sex=="female") %>% # Select female-only cases
  
#Next, use descr() to get descriptive statistics, e.g., mean, mode, range
  descr(i1) # Use the descr() to get descriptive statistics
#Now, using the descriptive statistics returned, identify the mean, max, and minimum 
#Mean:14.93
#Max: 71.00
#Min: 0.00

#Now, use the same filter() function used previously to look for instances of 'male' in the sex variable
df %>% 
  filter(sex=="male") %>% # Select male-only cases
#Again, use the descr() function to generate descriptive statistics 
  descr(i1) 
#Again, identify the mean, max, and min
#Mean:18.83
#Max:142.00
#Min:0.00

#Finally, use the filter() function to find instances of 'alcohol' in the substance variable
df %>% 
  filter(substance=="alcohol") %>% 
#Again, use the descr() function to generate descriptive statistics 
  descr(mcs)
#Again, identify the mean, max, and min
#Mean: 31.86
#Max:62.18
#Min:7.23

#Go me! I did it! 