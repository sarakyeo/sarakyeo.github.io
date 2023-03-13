
# R4DS: Data visualization ------------------------------------------------
# https://r4ds.hadley.nz/data-visualize.html

library(tidyverse)
library(palmerpenguins)
library(ggthemes)

# Check out the data!
penguins

# Learn about the variables in the above data frame
?penguins


# ggplot: Step-by-step ----------------------------------------------------
ggplot(
        data = penguins
) # What happens when you run this command?

ggplot(
        data = penguins,
        mapping = aes(x = flipper_length_mm, y = body_mass_g)
) # What happens when you run this command?
