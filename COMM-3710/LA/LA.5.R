## LA.5

## Load packages
library(tidyverse)
library(descr)
library(ggpubr)
library(rstatix)
library(rmarkdown)
library(formatR)

## 1: Load Utilities.csv data set
utilities <- read.csv("Utilities.csv")

---

## 2: Graph distribution of customers' total monthly bill
hist(utilities$totalbill)

## 2a: The distribution is slightly skewed to the right. Most of the monthly total bills are between $100 and $150.

---

## 3: Graph gas bill by month
plot(utilities$month, utilities$gasbill)

# or...

utilities %>% 
        ggplot(aes(x = factor(month), y = gasbill)) + 
        geom_point()

## 3a: Based on the graph, which month do you think has the highest average gas bill? Dec

## 3b: Calculate the average gas bill for the months of January and December. Which is higher?
jan <- filter(utilities, month == 1)
mean(jan$gasbill)

dec <- filter(utilities, month == 12)
mean(dec$gasbill)

# or...

utilities %>% 
        filter(., month == 1) %>% 
        summarise(jan = mean(gasbill)) # $180.38

utilities %>% 
        filter(., month == 12) %>% 
        summarise(dec = mean(gasbill)) # $179.28

---

## 4: Graph electric bill by month
plot(utilities$month, utilities$elecbill)
# or...
utilities %>% 
        ggplot(aes(x = factor(month), y = elecbill)) +
        geom_point()

## 4a: Based on graph, which month do you think has highest electric bill? Dec

## 4b: Calculate the average electric bill for the months of September and December. Which is higher?
sep <- filter(utilities, month == 9)
mean(sep$elecbill)

mean(dec$elecbill)

# or...

utilities %>% 
        filter(month == 12) %>% 
        summarise(dec = mean(elecbill)) # $87.21

utilities %>% 
        filter(month == 9) %>% 
        summarise(sep = mean(elecbill)) # $99.16

---

## 5: Graph gas usage and gas bill
        plot(utilities$ccf, utilities$gasbill)

# or...
utilities %>% 
        ggplot(aes(x = ccf, y = gasbill)) + 
        geom_point()

---
        
## 6: Graph electricity usage and electric bill
        plot(utilities$kwh, utilities$elecbill)

# or...
utilities %>% 
        ggplot(aes(x = kwh, y = elecbill)) + 
        geom_point()

---
        
## 7: Create season variable
utilities$season[utilities$month == 12 | utilities$month == 1 | utilities$month == 2] <- "winter"
utilities$season[utilities$month == 3 | utilities$month == 4 | utilities$month == 5] <- "spring"
utilities$season[utilities$month == 6 | utilities$month == 7 | utilities$month == 8] <- "summer"
utilities$season[utilities$month == 9 | utilities$month == 10 | utilities$month == 11] <- "fall"
freq(utilities$season)

# or...

require(magrittr)
utilities %<>% 
        rowwise() %>% 
        mutate(season = case_when(month == 12 | month == 1 | month == 2 ~ "winter",
                                  month == 3 | month == 4 | month == 5 ~ "spring",
                                  month == 6 | month == 7 | month == 8 ~ "summer",
                                  month == 9 | month == 10 | month == 11 ~ "fall"))

---

## 8: Create DonorStatus variable
utilities$DonorStatus <- ifelse(utilities$donate == "yes", 1, 0)

# or...

require(magrittr)
freq(utilities$donate)
utilities %<>%
        rowwise() %>% 
        mutate(DonorStatus = case_when(donate == "yes" ~ 1,
                                       donate == "no" ~ 0))


## 9: Make bar chart to display count or proportion of donors by season
sorted <- reorder(utilities$season, utilities$DonorStatus)
counts <- table(utilities$DonorStatus, sorted)
barplot(counts)

# or...

utilities %>% 
        ggplot(aes(x = season, fill = factor(DonorStatus))) +
        geom_bar(position = position_fill(reverse = TRUE)) +
        scale_x_discrete(limits = c("winter",
                                    "spring",
                                    "summer",
                                    "fall")) +
        scale_fill_discrete(labels = c("No", "Yes")) +
        scale_y_continuous(expand = c(0,0)) +
        labs(x = "", y = "Proportion", fill = "Donor Status")

## 9a: There does not seem to be a relationship between season and donation.