## LA.8: Practice Data Analysis

## Set working directory and load packages
setwd("C:/Users/SaraK/Downloads/sarakyeo.github.io/COMM-3710/LA")

library(tidyverse)
library(magrittr)
library(descr)
library(rstatix)
library(Hmisc)
library(psych)


## Q1: Load dataset
ithaca <- read.csv("Ithaca.csv")


## Q2: Data management

## Q2a: tvnaat, tvhardat, tvsoftat
# tvnaat
freq(ithaca$tvnaat)
ithaca$ctvnaat <- ithaca$tvnaat
ithaca %<>% 
        mutate(ctvnaat = replace(ctvnaat, ctvnaat == 99, NA))
# or...
freq(ithaca$tvnaat)
ithaca$ctvnaat <- ithaca$tvnaat
ithaca$ctvnaat[ithaca$tvnaat == 99] <- NA
freq(ithaca$ctvnaat)

# tvhardat
freq(ithaca$tvhardat)
ithaca$ctvhardat <- ithaca$tvhardat
ithaca$ctvhardat[ithaca$tvhardat == 99] <- NA
freq(ithaca$ctvhardat)

# tvsoftat
freq(ithaca$tvsoftat)
ithaca$ctvsoftat <- ithaca$tvsoftat
ithaca$ctvsoftat[ithaca$tvsoftat == 99] <- NA
freq(ithaca$ctvsoftat)

## Q2b: sex and marit
# sex
freq(ithaca$sex)
ithaca$csex <- ithaca$sex
ithaca$csex[ithaca$sex == 9] <- NA
ithaca$csex[ithaca$sex == 1] <- "M"  ## I know that 1 = M from
ithaca$csex[ithaca$sex == 0] <- "F"  ## the codebook.
freq(ithaca$csex)
# or...
ithaca %<>% 
        mutate(csex = case_when(sex == 1 ~ "M",
                                sex == 0 ~ "F"))

# marit
freq(ithaca$marit)
ithaca$cmarit <- ithaca$marit
ithaca$cmarit[ithaca$marit == 1] <- "single"
ithaca$cmarit[ithaca$marit == 2] <- "married"
ithaca$cmarit[ithaca$marit == 3] <- "divorced/separated"
ithaca$cmarit[ithaca$marit == 4] <- "widowed"
ithaca$cmarit[ithaca$marit == 5] <- NA
ithaca$cmarit[ithaca$marit == 9] <- NA
freq(ithaca$cmarit)
# or...
ithaca %<>% 
        mutate(cmarit = case_when(marit == 1 ~ "single",
                                  marit == 2 ~ "married",
                                  marit == 3 ~ "divorced/separate",
                                  marit == 4 ~ "widowed"))


## Q3: Mean attention to national TV news among men and women
mean(ithaca$ctvnaat[ithaca$csex == "F"], na.rm = TRUE)
mean(ithaca$ctvnaat[ithaca$csex == "M"], na.rm = TRUE)
# or...
ithaca %>% 
        summarise(F = mean(ctvnaat[csex == "F"], na.rm = TRUE),
                  M = mean(ctvnaat[csex == "M"], na.rm = TRUE))


# Q4: Conduct appropriate statistical test
t.test(ithaca$ctvnaat ~ ithaca$csex, var.equal = TRUE)
# or...
ithaca %>% 
        t_test(., ctvnaat ~ csex, var.equal = TRUE)

## Q4a: Independent samples t-test.
## Q4b: t = .016, p = .988
## Q4c: There is no significant different in attention in attention paid to national TV news between men and women.


## Q5: Conduct appropriate statistical test
cor.test(ithaca$ctvnaat, ithaca$ctvhardat, method = "pearson")
# or...
ithaca %>% 
        cor_test(., ctvnaat, ctvhardat, method = "pearson")

## Q5a: Pearson's correlation.
## Q5b: r = .65, p < .05
## Q5c: There is a significant and positive relationship between the two variables.


## Q6: Conduct appropriate statistical test
res.aov <- aov(ctvsoftat ~ cmarit, data = ithaca)
summary(res.aov)
# or...
ithaca %>% 
        anova_test(., ctvsoftat ~ cmarit, effect.size = "pes")

## Q6a: Analysis of variance (ANOVA)
## Q6b: F = 5.197, p < .05
## Q6c: There is a significant difference in attention to soft news by marital status.

