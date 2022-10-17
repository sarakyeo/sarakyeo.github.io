library(tidyverse)
library(rstatix)
library(summarytools)

setwd("./COMM-3710")

comm3710 <- read_csv("fall22-grades.csv")
head(comm3710)

graphdta <- comm3710 %>% 
        gather(., key = "variable",
               value = "value")

# Examine lab assignment grades -------------------------------------------
comm3710 %>% 
        select(LA1:LA4) %>% 
        group_by() %>% 
        descr()

graphdta %>% 
        filter(variable == "LA1" |
                       variable == "LA2" |
                       variable == "LA3" |
                       variable == "LA4") %>% 
        ggplot(aes(x = variable, y = value)) +
                geom_boxplot() +
        scale_x_discrete(name = "") +
        scale_y_continuous(name = "Score",
                           expand = c(0,0),
                           limits = c(-0.5, 12.5),
                           breaks = seq(0, 12, 1)) +
        theme_bw()


# Examine quiz grades -----------------------------------------------------
comm3710 %>% 
        select(Q1:Q7) %>% 
        group_by() %>% 
        descr()

graphdta %>% 
        filter(variable == "Q1" |
                       variable == "Q2" |
                       variable == "Q3" |
                       variable == "Q4" |
                       variable == "Q5" |
                       variable == "Q6" |
                       variable == "Q7") %>% 
        ggplot(aes(x = variable, y = value)) +
        geom_boxplot() +
        scale_x_discrete(name = "") +
        scale_y_continuous(name = "Score",
                           expand = c(0,0),
                           limits = c(-0.5, 11.5),
                           breaks = seq(0, 11, 1)) +
        theme_bw()
