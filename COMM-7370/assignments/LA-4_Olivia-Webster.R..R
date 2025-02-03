#Olivia Webster 
#u1419519
#01/29/2023 + 04/05/2023
#Data Analysis Assignment 2 COMM 7370


#first things first! Load ya packages (step 1)

library(tidyverse)
library(summarytools)
library(rstatix)

# load the help dataset next

df <- read_csv("HELP.csv") 

# step 2

df %>% 
  freq(sex)
# a) 107 patients are female in this study
# frequency of sex - locate the female and the number 

df %>% 
  freq(d1)
# b) 92 patients have never been hospitalized for medical problems.
# c) 83.22% of patients have been hospitalized 4 times or less.

# this shows the frequency from the column of d1, which provides the requested info

# step 3 - find cocaine and at least 40 years old
# do this by filtering first, you know you're looking for a substance equal to cocaine AND age less than 40 (39) then you'll want the frequency of age

df %>% 
  filter(substance=="cocaine" & age > 39) %>% #or age >= 40)
  freq(age)
# a) total of 27 patients are included in this subset

df %>% 
  filter(substance=="cocaine" & age > 39) %>%
  descr(age)
# b) The mean of this subset is 45.37 years.

# step 4
#mutate makes a new column from existing one to improve or manipulate it somehow
#you can override and create new table by keeping the same name "df"
# I am creating a new df tibble that INCLUDES my mutation (AKA adding the dcesd column) that has less than or equal to 30 as low and more than 30 high
df <- df %>% 
  mutate(dcesd = case_when(cesd <= 30 ~ "low",
                           cesd > 30 ~ "high"))

df %>% 
  freq(dcesd)

# a) there are 271 respondents in the "high" category and 182 respondents in the "low" category.

# start with your data frame, THEN filter - to get the category, you'll need to do new column name equals low, then to get the age info, descr(age)
df %>% 
  filter(dcesd=="low") %>% 
  descr(age)

df %>% 
  filter(dcesd=="high") %>% 
  descr(age)
# 4 b) The mean age of respondents in the low category 36.03 years AND the mean age of respondents in the high category is 35.40 years.

# step 5
# mutating the tibble/table by adding a new column (ExtremeMCS) under the conditions (case_when) the mcs column is greater than 20 is 1 and less than or equal to is 20 is 0.

df <- df %>% 
  mutate(ExtremeMCS = case_when(mcs < 20 ~ 1,
                           mcs >= 20 ~ 0))

df %>%
  freq(ExtremeMCS)
# 5 a) There are 91 patients are at risk of returning to the detoxification unit in the next 12 months (because 1 is less than 20, which is the warning number)
# 5 b) 79.91% of patients are at low risk of returning to detox within the next 12 months.

# step 6 
df <- df %>% 
  mutate(SuicidalThought = case_when(g1b == "yes" ~ 1,
                                     g1b == "no" ~ 0))
df <- df %>% 
  mutate(HomelessStatus = case_when(homeless == "housed" ~ 0,
                                    homeless == "homeless" ~ 1))
# again, creating/overriding a new df, now, new column (vector) name = case_when (condition) CHECK THE TABLE FOR VARIABLES!!!! (column name == column variable ~(if this then return) new variable) 

df <- df %>% 
  mutate(RiskTotal = ExtremeMCS + SuicidalThought + HomelessStatus)
#now add them all together 
# df override to make new column RiskTotal and add together 3!

df %>% 
  freq(RiskTotal) 
# 6 a) 94.92% of patients have fewer than 3 risk factors!

# 7 - tidyverse is already installed - make sure to run the package!
# following along with ch. 5 graphing with ggplot
# practice df%>%
  # ggplot(aes(x = x_var, y = y_var)) +
  # geom_point()

# Step 8

df%>%
  ggplot(aes(x = age)) +
  geom_bar()
# The graph follows a bell curve shape with trailing data at the 50-60 end.
# Nothing before 18 though! Seems slightly skewed positively.
# The mean age is likely around 37.

# Step 9
df %>% 
  descr(age)
# The mean age is 35.65, so I wasn't too off!

# Step 10
df%>%
  ggplot(aes(x = age, y = i1)) +
  geom_point()
# There appears to be a weak positive relationship between age and i1.

# Step 11
df%>%
  cor_test(age, i1) 
#it looks like p = 0.00000896 

# Step 12
df%>%
  # t_test(pcs, sex) - old code, doesn't work
  t_test(pcs ~ sex)

df %>%
  ggplot(aes(x = sex, y = pcs)) +
  stat_summary(fun = mean,
  geom = "point") +
  stat_summary(fun.data = mean_cl_boot,
               geom = "errorbar")

# Test statistic is -3.49 
# P-value p < .001.


