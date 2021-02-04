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
## Q4b: t = .016

## Results from our t-test
##
## data:  ithaca$ctvnaat by ithaca$csex
## t = 0.015647, df = 445, p-value = 0.9875
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.6151090  0.6249821
## sample estimates:
##         mean in group F mean in group M
##                5.181102        5.176166

## We see that the test statistic, t, is .016
## And the p-value is .988
## t = .016, p = .988

## By comparing this p-value to alpha (.05), I can interpret this test.
## Since p is greater than alpha, I fail to reject the null hypothesis,
## which posits that there is no difference in attention paid to national
## TV news between men and women.

## Therefore, there is no statistically significant different in the
## amount of attention women vs. men pay to national news on TV.


#------ Question 5 ------
## Next, we are asked to test for a linear relationship between tvnaat and
## tvhardat.

## To do so, I would use Pearson's correlation. The test statistic for
## this flavor of hypothesis test is Pearson's r and it comes with a p-
## value.

res.cor <- cor.test(ithaca$ctvnaat, ithaca$ctvhardat, method = "pearson")
res.cor

## Results from Pearson's product-moment correlation
##
## data:  ithaca$ctvnaat and ithaca$ctvhardat
## t = 17.92, df = 441, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.5917469 0.6999616
## sample estimates:
##        cor
## 0.6491265

## Our results are:
## r = .649, p < .001

## Again, compare the p-value to alpha to come to a conclusion
## about the results of this hypothesis test.


#------ Question 6 ------
## In the last question, we are asked to determine whether soft news varies
## significantly depending on marital status.

## To test this hypothesis, I would use a one-way analysis of variance
## (ANOVA). The test statistic for an ANOVA is F and it, too, comes with
## a p-value.

res.aov <- aov(ctvsoftat ~ cmarit, data = ithaca)
summary(res.aov)

##              Df Sum Sq Mean Sq F value  Pr(>F)
## cmarit        3    158   52.53   5.197 0.00156 **
## Residuals   423   4275   10.11
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
## 38 observations deleted due to missingness

## Our results are:
## F = 5.197, p = .0016

## As usual, compare the p-value to alpha to draw a conclusion about
## the results of your one-way ANOVA.
