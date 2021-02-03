#------ LA.8: Practice Data Analysis ------
## Sara K. Yeo

## First, be sure to set your working directory to your
## COMM 3710 directory that contains Ithaca.csv.


#------ Set working directory and load packages and data ------
setwd("C:/Users/SaraK/Downloads/sarakyeo.github.io/COMM-3710/LA")

library(tidyverse)
library(magrittr)
library(descr)
library(rstatix)
library(Hmisc)
library(psych)

ithaca <- read.csv("Ithaca.csv")


#------ Next, examine the variables of interest ------
## Before doing this, we need to familiarize ourselves with
## the codebook in the assignment.

# tvnaat
freq(ithaca$tvnaat)

## When we run the command above, we see a frequency distribution
## as well as a histogram. Checking with the codebook, I see that
## 0 = "Little Attention" and 10 = "Very close attention."

## But my frequency distribution (in the Console) shows that I
## have 8 responses coded as 99.

## This makes little sense! The value 99 has no meaning on my
## scale. Therefore, I need to manage these data and recode those
## into missing responses, i.e., NA.

ithaca$ctvnaat <- ithaca$tvnaat
ithaca$ctvnaat[ithaca$tvnaat == 99] <- NA

## After running the commands above, I need to check that I've
## managed these data correctly. To do so, I will run a frequency
## distribution on the ctvnaat variable.

freq(ithaca$ctvnaat)

## The number of NA's has increased by 8, which tells me that I
## have managed these data correctly.

## Next, we repeat this process for the remaining variables of
## interest, tvhardat and tvsoftat.

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

## The last two variables that we managed were similar to tvnaat.
## However, the nominal variables, sex and marital status, are not.

## Let's take a look at managing the sex variable.
freq(ithaca$sex)

## In this case, I see 5 responses that are coded as 9. These don't
## make much sense on my scale and should probably be recoded as
## missing. I also want to change this numeric variable to a factor
## so that I can easily see which category (0 or 1) corresponds to
## male and female.

ithaca$csex <- ithaca$sex
ithaca$csex[ithaca$sex == 9] <- NA
ithaca$csex[ithaca$sex == 1] <- "M"  ## I know that 1 = M from
ithaca$csex[ithaca$sex == 0] <- "F"  ## the codebook.
freq(ithaca$csex)

## It looks like I've  managed this variable appropriately.
## Let's do the same for marital status.

freq(ithaca$marit)
ithaca$cmarit <- ithaca$marit
ithaca$cmarit[ithaca$marit == 1] <- "single"
ithaca$cmarit[ithaca$marit == 2] <- "married"
ithaca$cmarit[ithaca$marit == 3] <- "divorced/separated"
ithaca$cmarit[ithaca$marit == 4] <- "widowed"
ithaca$cmarit[ithaca$marit == 5] <- NA
ithaca$cmarit[ithaca$marit == 9] <- NA
freq(ithaca$cmarit)

## Again, I've successfully managed this variable. The number of NA's
## in the variable have increased by (5 + 3) = 8 responses.

## Now that the data are managed, we can turn our attention to
## descriptive and inferential statistics.

#------ Question 3 ------
## Here, we are asked to find the mean amount of attention men vs.
## women pay to national TV news.

## Note that from this point on in the assignment, I will only use the
## managed variables, not the original, raw ones.

FMean <- mean(ithaca$ctvnaat[ithaca$csex == "F"], na.rm = TRUE)
MMean <- mean(ithaca$ctvnaat[ithaca$csex == "M"], na.rm = TRUE)

## Note that, in the Console, there are no values. This is because
## I've saved the mean values to two objects, called FMean and MMean
## Check out the Environment window on the right side of the screen.
## FMean and MMean (and their values) should be there.

## If I need the answers to Q3a, I can either look in the environment
## or call those objects in R:
FMean
MMean

#------Question 4------
## Now, we're into hypothesis testing.

## The appropriate test to use here is the independent samples t-test
## The syntax below conducts the test and saves the results to an
## object called res.t.

res.t <- t.test(ithaca$ctvnaat ~ ithaca$csex, var.equal = TRUE)
res.t

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
