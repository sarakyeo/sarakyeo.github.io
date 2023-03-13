library(tidyverse)

# 3.5 Exercises -----------------------------------------------------------
#1: Because there's a 1 instead of i in the call.
my_variable <- 10
my_varıable

#2: Fixed below
libary(tidyverse)
ggplot(data = mpg,
       mapping = aes(x = displ, y = hwy)) + 
        geom_point() +
        geom_smooth(method = "lm")

#3: Help > Keyboard Shortcuts Help

#4: my_bar_plot
my_bar_plot <- ggplot(mpg, aes(x = class)) +
        geom_bar()
my_scatter_plot <- ggplot(mpg, aes(x = cty, y = hwy)) +
        geom_point()
ggsave(filename = "mpg-plot.png", plot = my_bar_plot)
