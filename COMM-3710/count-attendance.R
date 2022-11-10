library(tidyverse)
library(summarytools)
library(rstatix)

root <- here::here()
setwd(root)

attend <- read_csv("./COMM-3710/attendance_reports_attendance.csv")

attend %>% 
        group_by(Attendance) %>% 
        freq(StudentName)

new <- attend %>% 
        group_by(StudentName) %>% 
        filter(Attendance == "present") %>% 
        count(Attendance)

write_csv(new,
          "attendance-count.csv")
