
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

# Changing details...
ggplot(
        data = penguins,
        mapping = aes(x = flipper_length_mm,
                      y = body_mass_g)
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


# 2.2.5 Exercises ---------------------------------------------------------
#1: 344 rows, 8 columns

#2: a number denoting bill depth (millimeters)

#3:
ggplot(
        data = penguins,
        mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
        geom_point() # describe relationship (negative)

#4:
ggplot(
        data = penguins,
        mapping = aes(x = species, y = bill_depth_mm)
) +
        geom_col() # columns are a better choice of geom

#5: No mapping aesthetic specified.

#6: Default (FALSE) removes missing values with a warning.
#   (How did I find this? ?geom_point).

#7: 
ggplot(
        data = penguins,
        mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
        geom_point(na.rm = TRUE) +
        labs(caption = "Data come from the palmerpenguins package")

#8: 
ggplot(
        data = penguins,
        mapping = aes(x = flipper_length_mm,
                      y = body_mass_g)
) +
        geom_point(
                mapping = aes(color = bill_depth_mm)
        ) +
        geom_smooth()

#9:
ggplot(
        data = penguins,
        mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
        geom_point() +
        geom_smooth(se = FALSE)
        
#10:
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


# 2.4.3 Exercises ---------------------------------------------------------
#1: Horizontal bars instead of vertical
penguins |> 
        ggplot(
                aes(y = species)
        ) +
        geom_bar()

#2: Fill is more useful
ggplot(penguins, aes(x = species)) +
        geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
        geom_bar(fill = "red")

#3: Specifies the number of bins in the histogram.

#4:
diamonds |> 
        ggplot(aes(x = carat)) +
        geom_histogram(binwidth = .01) # how do you pick?


# 2.5.5 Exercises ---------------------------------------------------------
#1: Categorical: manufacturer, model, trans, drv, fl, class
#   Numerical: displ, year, cyl, cty. hwy
?mpg

#2:

