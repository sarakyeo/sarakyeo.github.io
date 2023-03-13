library(nycflights13)
library(tidyverse)

# 4.2.5 Exercises ---------------------------------------------------------
flights |> 
        filter(arr_delay >= 60 &
                       (dest == "IAH" | dest == "HOU") &
                       (carrier == "UA" | carrier == "DL" | carrier == "AA") &
                       (month == 7 | month == 8 | month == 9) &
                       (arr_delay > 120 & dep_delay == 0) |
                       (sched_dep_time - dep_time >= 60)
        )
