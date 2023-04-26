#Load packages and help dataset
library(tidyverse)
library(summarytools)
library(rstatix)
df <- read_csv("HELP.csv")

#To examine the frequency distribution of variable, var1, in the data frame, use the following function

df %>% #reminder that %>% tells R the order in which to perform functions
  freq(var1) #Examine freq dist of var1 in data frame (df) using the freq() function

df %>%
  freq(sex) # Examine freq of females in the data set; reminder: no quotes on objects
# The number of females in the data set is 107

#Find the frequency of patients have never been hospitalized for medical problems and who have been hospitalized fewer than five times
df %>% 
  freq(d1)
#The number of patients who have never been hospitalized is 20.31 (according to the cumulative column)
#The number of patients who have been hospitalized fewer than five times is 83.22 

#To find data that meets certain criteria, use the filter() function 
#The & means 'and' will look for both criteria listed, e.g., age & sex
#In this case, seatch for the 'females' within the sex variable and cases in which there were less than 10 'Lifetime number of hospitalizations for medical problems' 
df %>%
  filter(sex == "female" & d1 < 10) %>%
#Now, use the freq() function to examine the distribution of age in the filtered data, i.e., the age frequency for females who experienced less than ten lifetime number of hospitalizations for medical problems
  freq(age)

df %>%
#Now, use the filter() function to determine how many patients who are 40 or older whose primary substance of abuse is cocaine 
  filter(age >= 40 & substance == "cocaine") %>%
  freq(age)
#The total number of patients is 27

#Now, use the descr() function to find the mean age of patients who are 40 or older whose primary substance of abuse is cocaine 
  df %>% 
  filter(age >= 40 & substance == "cocaine") %>%
    descr(age)
# he mean age is 45.37
  
#To recode (change) a column of data, use the following code
  df <- df %>%
#The following function mutate() tells R how to change the data, while the case_when() function tells it when to change
#The following line of code uses these functions to say that when an individuals Physical Component Score (pcs) is 40 or less, to output 'low'
    mutate(dpcs = case_when(pcs <= 40 ~ "low",
                            pcs > 40 ~ "high"))
  
#To check that I have created the new variable, dpcs, correctly, I use freq() to visualize the table
  df %>%
    freq(dpcs)
  
#Now, using the same function, recode respondents with depressions scores of 30 or lower into a 'low' category and those who have scores higher than 30 into a 'high' category.
  df <- df %>% 
  mutate(dcesd = case_when( cesd <= 30 ~ "low",
                          cesd > 30 ~ "high"))
  df %>%
    freq(dcesd)
  #Again, use the freq() function visualize the table
  #There are 271 patients labeled 'high' and 182 labeled 'low'
  
#Now, find the mean age of patients in each category using the filter() function
  df %>% filter(dcesd =="low") %>% 
  descr(age)
#The mean age for the "low" category is 36.03
  
  df %>% filter(dcesd =="high") %>% 
    descr(age)
# The mean age for the "high" category is 35.40

#Now, make a new variable called ExtremeMCS and code it as 1 if a patient is at risk based on his/her mcs score and 0 otherwise.
  df <- df %>% 
    mutate(ExtremeMCS = case_when(mcs < 20 ~ 1,
                              mcs > 20 ~ 0))
  df %>%
    freq(ExtremeMCS)
#Again, use the freq() function to visualize the table 
#There are 91 patients at risk for returning to detoxification 
#In a percentage,79.91% of patients are at a low risk of returning to detoxification
 
#If a patient has not experienced thoughts of suicide in the last 30 days, code them as 0 for SuicidalThought.
#If a patient is housed, code them as 0 for HomelessStatus.
  df <- df %>% 
    mutate(SuicidalThought = case_when(g1b == "yes" ~ 1,
                              g1b == "no" ~ 0))

  df <- df %>% 
    mutate(HomelessStatus = case_when(homeless == "housed" ~ 0,
                                       homeless == "homeless" ~ 1))
  
  df %>%
    freq(SuicidalThought)
  
#Construct a new variable called RiskTotal that quantifies the number of risk factors for each patient
# The + symbol ads numeric columns together

  df <- df %>% 
  mutate(RiskTotal = ExtremeMCS + SuicidalThought + HomelessStatus)
                              
  df %>%
    freq(RiskTotal)
# The frequency table of risk total shows that 94.92 of patients have fewer than three risk factors in the dataset

#gg plot is a way to graph and plot R data
#There are several chart types available, including a histogram
#To create a graph using gg plot, first assign a gg plot object to gg
#Then, tell gg plot the data frame I'm trying to plot, e.g., 'df'
#aes tells gg plot how to map a given variable
#Using gg plot, make a histogram of age where x is is age 
 gg <- ggplot(df, aes(x=age)) + 
#Next, use the geom_bar() function to create a bar layer
   geom_bar()
  #To view gg, type 'gg' and run it
 gg
 
 #Is the normally distributed? 
  #No
 
 #Is it skewed or symmetric? If skewed, is the skew positive or negative? 
  #From the plot, I observe a slight skew to the right 
 
 #From the graph, what do you think the mean age of respondents is in this dataset?
 #I think the mean age is ~ 35
 
 #Now, determine the actual mean age of the patients using the descr() function 

df %>%
  descr(age)
#The mean of the data is 35.65 

#Now, use ggplot to create a scatter plot where x equals age and y equals i1 
gg <- ggplot(df, aes(x=age, y=i1)) + 
  #Next, use the geom_point() function to create a bar layer
  geom_point()

#Again, run 'gg' to visual the graph
gg

#Is there a relationship between age and i1? Is it positive or negative? Is it strong or weak?
#There appears to be weak positive relationship between age and i1

#Now, use the cor_test() function to determine the correlation between two continuous variables
df %>%
cor_test(age, i1)
#Is the relationship between age and i1 significant? What is the Pearson’s correlation coeﬀicient
#The r value is .21 and is statistically significant (p = .00000896)

#Now, perform a t-test on the data to determine whether there are differences in Physical Component Scores according to sex
#Here, pcs is the continuous variable and sex is the categorical variable 
#To do this, use the following code

df %>%
  t_test(pcs~sex) #where varx is categorical and vary is continuous; personal note: use ~  notation in t-tests

#Once you have conducted the test, state the value of the test statistic and the p-value in your R script as comments. Note that for -p-values that are less than 0.001, we typically report them as𝑝 < .001.
# The t statistics is -3.49, and the p-value <.001 

# To graph means with error bars using ggplot, use the following code
df %>%
  ggplot(aes(x = sex, y = pcs)) +
  stat_summary(fun = mean,
               geom = "point") +
  stat_summary(fun.data = mean_cl_boot,
               geom = "errorbar")

