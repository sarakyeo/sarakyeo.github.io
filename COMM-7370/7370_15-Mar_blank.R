# R4DS: Data visualization ------------------------------------------------
# https://r4ds.hadley.nz/data-visualize.html

# Install/Load packages: tidyverse, ggthemes, palmerpenguins, nycflights13


# Check out the penguins data!


# Learn about the variables in the penguins data frame



## ggplot: Step-by-step ----------------------------------------------------
## Follow the Data visualization section
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
# 1: 

# 2: 

# 3:

# 4:

# 5: 

# 6:

# 7:

# 8:

# 9:

# 10:


## 2.4.3 Exercises ---------------------------------------------------------
# 1: 

# 2: 

# 3: 

# 4:


## 2.5.5 Exercises ---------------------------------------------------------
# 1: 

# 2: 

# 3: 

# 4: 

# 5:

# 6: 

# 7:


## 2.6.1 Exercises ---------------------------------------------------------
# 1: 

# 2: 


# Data management tutorial ------------------------------------------------
## Setting Preferences in R ------------------------------------------------
# Tools --> Global Options --> Appearance
# Rainbow parentheses
# Shortcuts
## Comments: Ctrl + Shift + C
## Foldable code: Ctrl + Shift + R
## Run code: Ctrl + Enter
## Arrow: Alt + -


## Setting Up R for Assignments --------------------------------------------
# Creating R scripts
# Installing and loading packages
# install.packages("tidyverse")
# install.packages("summarytools")
# install.packages("rstatix")
# install.packages("magrittr")
# install.packages("psych")
[write code here]

# Setting working directory
[paste code here]


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
[write code here]

# Cleaning data
# Use gc to filter data--we only want R for whom gc = 1
[write code here]

## Types of Data and Levels of Measurement ---------------------------------
# What is C1? Where do I find info about C1? Why do I need to do this?
[write code here]

# Where do I find info re: V1? What type of variable is it?
[write code here]

# Calculate age of respondents. Why is this important?
[write code here]


## Descriptive Statistics --------------------------------------------------
# Uses summarytools package
# Find descriptive statistics for age.
[write code here]

## Recoding Variables ------------------------------------------------------
# Use M2_3, M3_3 to create composite variable of scimedia

# First, clean M2_3 and M3_3 individually using mutate()
# Next, do this with mutate() and across()
# Calculate reliability between the two items (cor_test())
# Create composite variable and write back into data frame to save it

[write code here]
