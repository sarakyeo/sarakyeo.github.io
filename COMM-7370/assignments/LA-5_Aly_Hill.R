#Load packages and CPS dataset
library(tidyverse)
library(summarytools)
library(rstatix)
df <- read.csv("CPS_data.csv")

#Determine the mean wage earned per hour among males and females.

df %>% 
  filter(sex=="M") %>%
  descr(wage)

#The mean wage for males per hour is $9.99 

df %>% 
  filter(sex=="F") %>% 
  descr(wage)

#The mean wage for females per hour is $7.88

#Visualize the mean wage earned per hour by sex in a figure

gg <- ggplot(df, aes(x=sex, y=wage)) + 
  geom_boxplot()
gg

#Implement the appropriate statistical test to determine whether males have significantly higher wages earned per hour than females. 
#Because the ind variable is categorical and the dep variable is continuous, the t_test() is the best to understand if males have significantly higher wages earned per hour than females.
#Formulate a hypothesis about the relationship between the mean hourly wage among males and females
#[H0] There is no statistically significant difference between the mean hourly wage among males and females 
#[H1] There is a statistically significant difference between the mean hourly wage among females and males

df %>%
  t_test(wage~sex)

#Report the test statistic and p-value 
#The test statistic is -4.89 and the p-value is .000001, demonstrating a significant difference in means between wages among males and females
#I reject the null hypothesis 

#Visualize the relationship between wages earned per hour and number of years of work experience
#Use ggplot to create a scatter plot where x equals work experience and y equals wages earned per hour 

gg <- ggplot(df, aes(x=exper, y=wage)) + 
  geom_point()
gg

#Formulate a hypothesis about the relationship between hourly wage and years of work experience 
#[H0]There is no relationship between hourly wage and years of work experience  
#[H1] There is a relationship between hourly wage and years of work experience

df %>%
  cor_test(exper, wage)

#Report the test statistic and p value
#The correlation coefficient is .087 and the p-value is .0443, which supports a weak positive relationship between years of work experience and hourly wage
#I reject the null hypothesis 

#Plot the mean of job satisfaction by job sector
#Formulate a hypothesis about the relationship between these variables and test that hypothesis using the appropriate statistical test
#[H0] There is no statistically significant difference in mean job satisfaction between job sectors
#[H1] There is a statistically significant difference in mean job satisfaction between job sectors

df %>% 
  group_by(sector) %>%
  summarize(mean_satisfaction=mean(satisfaction)) %>%

ggplot(aes(x=sector, y=mean_satisfaction)) +
  geom_bar(stat="identity")

df %>% 
  anova_test(satisfaction~sector)

#Report the test statistic and p-value
#The F statistic is .517 and the p-value is .822, demonstrating that the means between job sectors and job satisfaction is not significantly different 

#Does your test support or refute your hypothesis?
#I fail to reject the null hypothesis 

#Visualize mean wage per hour by job sector
#Formulate a hypothesis about the relationship between these variables, conduct an appropriate statistical test and report your results.
#[H0] There is no statistically significant difference in mean wage between job sectors 
#[H1] There is a statistically significant difference in mean wage between job sectors 


df %>% 
  group_by(sector) %>%
  summarize(mean_wage=mean(wage)) %>%
  
  ggplot(aes(x=sector, y=mean_wage)) +
  geom_bar(stat="identity")

df %>% 
  anova_test(satisfaction~sector)

#Report the test statistic and p value
#The F statistic is 16.796 and the p-value is 4.64e-20, demonstrating a strong statistically significant difference in mean hourly wage between job sectors  

#Does your test support or refute your hypothesis?
#I reject the null hypothesis


