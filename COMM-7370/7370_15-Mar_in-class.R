# R4DS: Data visualization ------------------------------------------------
# https://r4ds.hadley.nz/data-visualize.html

# Install/Load packages: tidyverse, ggthemes, palmerpenguins, nycflights13
library(tidyverse)
library(ggthemes)
library(palmerpenguins)
library(nycflights13)

# Check out the data!
penguins

# Learn about the variables in the above data frame
?penguins


## ggplot: Step-by-step ----------------------------------------------------
ggplot(
  data = penguins
) # What happens when you run this command?

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) # What happens when you run this command?

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() # Now what? Describe the graph. What is it plotting?
# Look at the data again, if necessary.

ggplot(
  data = penguins,
  mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g,
    color = species
  )
) +
  geom_point() # So fancy

# Add smoothed lines
ggplot(
  data = penguins,
  mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g,
    color = species
  )
) +
  geom_point() +
  geom_smooth(method = "lm")

# But wait... we want the color for species and only a single smoothed line
ggplot(
  data = penguins,
  mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g
  )
) +
  geom_point(mapping = aes(
    color = species,
    shape = species
  )) +
  geom_smooth(method = "lm")

# Changing details...
ggplot(
  data = penguins,
  mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g
  )
) +
  geom_point(mapping = aes(
    color = species,
    shape = species
  )) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    color = "Species",
    shape = "Species"
  ) +
  scale_color_colorblind()


## 2.2.5 Exercises ---------------------------------------------------------
# 1: 344 rows, 8 columns

# 2: a number denoting bill depth (millimeters)

# 3:
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
  geom_point() # describe relationship (negative)

# 4:
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_col() # columns are a better choice of geom

# 5: No mapping aesthetic specified.

# 6: Default (FALSE) removes missing values with a warning.
#   (How did I find this? ?geom_point).

# 7:
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
  geom_point(na.rm = TRUE) +
  labs(caption = "Data come from the palmerpenguins package")

# 8:
ggplot(
  data = penguins,
  mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g
  )
) +
  geom_point(
    mapping = aes(color = bill_depth_mm)
  ) +
  geom_smooth()

# 9:
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

# 10:
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )


## 2.4.3 Exercises ---------------------------------------------------------
# 1: Horizontal bars instead of vertical
penguins |>
  ggplot(
    aes(y = species)
  ) +
  geom_bar()

# 2: Fill is more useful
ggplot(penguins, aes(x = species)) +
  geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
  geom_bar(fill = "red")

# 3: Specifies the number of bins in the histogram.

# 4:
diamonds |>
  ggplot(aes(x = carat)) +
  geom_histogram(binwidth = .01) # how do you pick?


## 2.5.5 Exercises ---------------------------------------------------------
# 1: Categorical: manufacturer, model, trans, drv, fl, class
#   Numerical: displ, year, cyl, cty, hwy
?mpg

# 2: Won't work for shape since cyl is numeric, not categorical
mpg |>
  ggplot(aes(x = hwy, y = displ, color = cyl, size = cyl)) +
  geom_point()

# 3: Nothing happens because there's no line geom
mpg |>
  ggplot(aes(x = hwy, y = displ, linewidth = cyl)) +
  geom_point()

# 4: You should get a straight line
mpg |>
  ggplot(aes(x = hwy, y = hwy)) +
  geom_point()

# 5:
penguins |>
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  facet_grid(~species)

# 6: Remove labs function.
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm,
    color = species, shape = species
  )
) +
  geom_point()

# 7:
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill") # proportion of each spp on each island
ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill") # distribution of spp on islands


## 2.6.1 Exercises ---------------------------------------------------------
# 1: The second plot is saved.
ggplot(mpg, aes(x = class)) +
  geom_bar()
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.png")

# 2: The extension to the file name.


# Basics of R -------------------------------------------------------------
# R vs. RStudio


# Setting Preferences in R ------------------------------------------------
# Tools --> Global Options --> Appearance
# Rainbow parentheses
# Shortcuts
## Comments: Ctrl + Shift + C
## Foldable code: Ctrl + Shift + R
## Run code: Ctrl + Enter
## Arrow: Alt + -


# Setting Up R for Assignments --------------------------------------------
# Creating R scripts
# Installing and loading packages
# install.packages("tidyverse")
# install.packages("summarytools")
# install.packages("rstatix")
# install.packages("magrittr")
# install.packages("psych")
library(tidyverse)
library(magrittr)
library(summarytools)
library(rstatix)
library(psych)

# Setting working directory
setwd("C:/Users/sarak/Documents/_git-repos/sarakyeo.github.io/COMM-7370")


# Data management tutorial ------------------------------------------------
## Best Practices ----------------------------------------------------------
# What does your future self need to know in order to understand this analysis?
# Writing foldable code makes it easier to navigate a lot of code.
# And your analysis is likely to consist of a LOT of code.
# Always install and load packages at the beginning of your code.
# R is case-sensitive while SPSS is not--be aware of this.
# Data and syntax redundancy--what to save?


## Pipe Operator -----------------------------------------------------------
# https://r4ds.had.co.nz/pipes.html
# We will work through the four piping alternatives in the document.
# Shortcut key: Ctrl + Shift + M
# Nouns vs. verbs in coding--easier to think in verbs instead of nouns.


## Reading Data into R -----------------------------------------------------
rawdata <- read_csv("7370_practice-data.csv")
# Cleaning data
rawdata %>%
  freq(gc)

wdata <- rawdata %>%
  filter(gc == 1) # Explain gc--we only want R for whom gc = 1


## Types of Data and Levels of Measurement ---------------------------------
# What is C1? Where do I find info about C1? Why do I need to do this?
wdata %>%
  freq(C1)

wdata %>%
  freq(V1) # Where do I find info re: V1? What type of variable is it?
# Calculate age of respondents. Why is this important?

wdata <- wdata %>%
  rowwise() %>%
  mutate(age = 2021 - V1)

wdata %>%
  freq(age) # continuous variable; ratio


## Missing Data ------------------------------------------------------------
# Recode missing data as NA in R.


## Descriptive Statistics --------------------------------------------------
# Uses summarytools package
wdata %>%
  descr(age)

## Recoding Variables ------------------------------------------------------
# M2_3, M3_3 to create composite variable of scimedia
wdata %>%
  freq(M2_3) # -99, "A lot 10," and "None 0" need to be recoded

typeof(wdata$M2_3) # "character"

wdata <- wdata %>%
  mutate(cM2_3 = case_when(
    M2_3 == "None 0" ~ 0,
    M2_3 == "1" ~ 1,
    M2_3 == "2" ~ 2,
    M2_3 == "3" ~ 3,
    M2_3 == "4" ~ 4,
    M2_3 == "5" ~ 5,
    M2_3 == "6" ~ 6,
    M2_3 == "7" ~ 7,
    M2_3 == "8" ~ 8,
    M2_3 == "9" ~ 9,
    M2_3 == "A lot  10" ~ 10,
    M2_3 == "-99" ~ NA_real_
  )) # vs NA_character_
wdata %>%
  freq(cM2_3)

wdata %>%
  freq(M3_3) # "A lot 10" and "None 0" need to be recoded (character)

typeof(wdata$M3_3) # "character"

wdata <- wdata %>%
  mutate(cM3_3 = case_when(
    M3_3 == "None  0" ~ 0,
    M3_3 == "1" ~ 1,
    M3_3 == "2" ~ 2,
    M3_3 == "3" ~ 3,
    M3_3 == "4" ~ 4,
    M3_3 == "5" ~ 5,
    M3_3 == "6" ~ 6,
    M3_3 == "7" ~ 7,
    M3_3 == "8" ~ 8,
    M3_3 == "9" ~ 9,
    M3_3 == "A lot  10" ~ 10
  ))

wdata %>%
  freq(cM3_3)

# Do this with mutate() and across()
# Calculate reliability between the two items (cor_test())
# Create composite variable and write back into data frame to save it
