
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

ggplot(
        data = penguins,
        mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
        geom_point() # Now what? Describe the graph. What is it plotting?
# Look at the data again, if necessary.

ggplot(
        data = penguins,
        mapping = aes(x = flipper_length_mm,
                      y = body_mass_g,
                      color = species)
) +
        geom_point() # So fancy

# Add smoothed lines
ggplot(
        data = penguins,
        mapping = aes(x = flipper_length_mm,
                      y = body_mass_g,
                      color = species)
) +
        geom_point() +
        geom_smooth(method = "lm")

# But wait... we want the color for species and only a single smoothed line
ggplot(
        data = penguins,
        mapping = aes(x = flipper_length_mm,
                      y = body_mass_g)
) +
        geom_point(mapping = aes(
                color = species,
                shape = species
        )) +
        geom_smooth(method = "lm")
