# `ggplot()` works in layers. This brief tutorial will help you re-create the figures from Yeo et al. (2023).
# We will start by understanding how `ggplot()` works. The package in which this function is contained it `tidyverse`,
# be sure to have this package installed and loaded before trying the steps below.

# For your reference, the complete code is below. The following sections break down this code to help you
# understand it better. Use the data provided on Canvas for this tutorial.

clean |> # this is the name of the dataframe with which we are working
        select(defn, risks) |> # these are the variables (i.e., columns) that are required to create the figure
        na.omit() |> # omit NA (missing data)
        ggplot(
                # this is the primary function, `ggplot()` and we have defined the x-axis variable here
                aes(x = defn)
        ) +
        stat_summary( # we are defining the y-axis variable and adding the mean here
                aes(y = risks),
                fun = mean,
                geom = "point"
        ) + 
        stat_summary( # we are adding confidence intervals to the y-values here
                aes(y = risks),
                fun.data = mean_cl_normal,
                geom = "errorbar",
                width = 0.2
        ) +
        scale_x_discrete( # this changes the characteristics of the x-axis (e.g., labels, axis title)
                name = "Definition",
                labels = c("simple", "complex")
        ) +
        scale_y_continuous( # this changes the characteristics of the y-axis
                name = "Perceived risks",
                expand = c(0, 0),
                limits = c(1, 7),
                breaks = seq(1, 7, 1)
        ) +
        jtools::theme_apa() + # this function sets a theme and requires the package, `jtools`
        theme( # this adjusts the theme of the plot
                axis.title.y = element_text(size = 18),
                axis.text.y = element_text(size = 18, color = "black"),
                axis.title.x = element_text(size = 18),
                axis.text.x = element_text(size = 18, color = "black")
        ) 

# Let's break it down...

clean |> 
        select(defn, risks) |>
        na.omit() 

# If you run the code in lines 46-48 (above), you will see the output in the Console (i.e., not a figure, just a list
# of values for the variables, `defn` and `risks`.)

clean |>
        select(defn, risks) |>
        na.omit() |>
        ggplot(
                aes(x = defn)
        )

# If you run the code above (ln. 53-58), a blank plot should show up on the right side of Positron/RStudio with
# the x-axis in place.

clean |>
        select(defn, risks) |>
        na.omit() |>
        ggplot(
                aes(x = defn)
        ) +
        stat_summary(
                aes(y = risks),
                fun = mean,
                geom = "point"
        )

# Running the above code (ln. 63-73) should result in two points added to the figure.

clean |>
        select(defn, risks) |>
        na.omit() |>
        ggplot(
                aes(x = defn)
        ) +
        stat_summary(
                aes(y = risks),
                fun = mean,
                geom = "point"
        ) +
        stat_summary( # we are adding confidence intervals to the y-values here
                aes(y = risks),
                fun.data = mean_cl_normal,
                geom = "errorbar",
                width = 0.2
        )

# The code above adds another layer, error bars, to the figure.

clean |>
        select(defn, risks) |>
        na.omit() |>
        ggplot(
                aes(x = defn)
        ) +
        stat_summary(
                aes(y = risks),
                fun = mean,
                geom = "point"
        ) +
        stat_summary( # we are adding confidence intervals to the y-values here
                aes(y = risks),
                fun.data = mean_cl_normal,
                geom = "errorbar",
                width = 0.2
        ) +
        scale_x_discrete( # this changes the characteristics of the x-axis (e.g., labels, axis title)
                name = "Definition",
                labels = c("simple", "complex")
        )

# We can then start to modify the axes to suit our preferences and that of the journal/submission requirements, if
# any. The above code should add labels to the x-axis. The labels are still in very small font, but we will fix that
# later.

clean |>
        select(defn, risks) |>
        na.omit() |>
        ggplot(
                aes(x = defn)
        ) +
        stat_summary(
                aes(y = risks),
                fun = mean,
                geom = "point"
        ) +
        stat_summary( # we are adding confidence intervals to the y-values here
                aes(y = risks),
                fun.data = mean_cl_normal,
                geom = "errorbar",
                width = 0.2
        ) +
        scale_x_discrete( # this changes the characteristics of the x-axis (e.g., labels, axis title)
                name = "Definition",
                labels = c("simple", "complex")
        ) +
        scale_y_continuous( # this changes the characteristics of the y-axis
                name = "Perceived risks",
                expand = c(0, 0),
                limits = c(1, 7),
                breaks = seq(1, 7, 1)
        )

# And the code above adjusts the y-axis. Next, let's change the background color, font size, etc. (i.e., the theme
# of the figure).

clean |>
        select(defn, risks) |>
        na.omit() |>
        ggplot(
                aes(x = defn)
        ) +
        stat_summary(
                aes(y = risks),
                fun = mean,
                geom = "point"
        ) +
        stat_summary( # we are adding confidence intervals to the y-values here
                aes(y = risks),
                fun.data = mean_cl_normal,
                geom = "errorbar",
                width = 0.2
        ) +
        scale_x_discrete( # this changes the characteristics of the x-axis (e.g., labels, axis title)
                name = "Definition",
                labels = c("simple", "complex")
        ) +
        scale_y_continuous( # this changes the characteristics of the y-axis
                name = "Perceived risks",
                expand = c(0, 0),
                limits = c(1, 7),
                breaks = seq(1, 7, 1)
        ) +
        jtools::theme_apa()

# There is a convenient theme for APA built in to the package, `jtools`. Remember to install and load this package
# if you want to use this theme (line 181 in code above). Finally, we will make the font size larger for readability.

clean |>
        select(defn, risks) |>
        na.omit() |>
        ggplot(
                aes(x = defn)
        ) +
        stat_summary(
                aes(y = risks),
                fun = mean,
                geom = "point"
        ) +
        stat_summary(
                aes(y = risks),
                fun.data = mean_cl_normal,
                geom = "errorbar",
                width = 0.2
        ) +
        scale_x_discrete(
                name = "Definition",
                labels = c("simple", "complex")
        ) +
        scale_y_continuous(
                name = "Perceived risks",
                expand = c(0, 0),
                limits = c(1, 7),
                breaks = seq(1, 7, 1)
        ) +
        jtools::theme_apa() +
        theme(
                axis.title.y = element_text(size = 18),
                axis.text.y = element_text(size = 18, color = "black"),
                axis.title.x = element_text(size = 18),
                axis.text.x = element_text(size = 18, color = "black")
        )
