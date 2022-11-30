library(tidyverse)
library(rstatix)
library(summarytools)

root <- here::here()
setwd(root)

attend <- read_csv("./COMM-3710/attendance_reports_attendance.csv")

present <- attend %>% 
        group_by(StudentName) %>% 
        filter(Attendance == "present") %>% 
        count(Attendance)
late <- attend %>% 
        group_by(StudentName) %>% 
        filter(Attendance == "late") %>% 
        count(Attendance)

write_csv(present,
          "./COMM-3710/attendance-full.csv")
write_csv(late,
          "./COMM-3710/attendance-partial.csv")

comm3710 <- read_csv("./COMM-3710/fall-2022_grades.csv")
head(comm3710)

attendfull <- read_csv("./COMM-3710/attendance-full.csv")
attendpartial <- read_csv("./COMM-3710/attendance-partial.csv")

# Convert attendance count to points
attendfull <- attendfull %>% 
        rowwise() %>% 
        mutate(present = n*2)
attendpartial <- attendpartial %>% 
        rowwise() %>% 
        mutate(late = n)

# Join attendance data to COMM 3710 grades data
comm3710 <- left_join(comm3710, attendfull,
                      by = c("LastName", "FirstName"))
comm3710 <- left_join(comm3710, attendpartial,
                      by = c("LastName", "FirstName"))


# Calculate final grade ---------------------------------------------------
# Attendance
comm3710 <- comm3710 %>% 
        mutate(late = replace(late, is.na(late) == TRUE, 0))
        
comm3710 <- comm3710 %>% 
        rowwise() %>% 
        mutate(attendtotal = present + late)
comm3710 %>% 
        freq(attendtotal)

# Convert values > 10 to 10
comm3710 <- comm3710 %>% 
        mutate(finalattend = case_when(attendtotal > 10 ~ 10,
                                     attendtotal <= 10 ~ attendtotal))
comm3710 %>% 
        freq(finalattend)

# Quiz total
comm3710 <- comm3710 %>% 
        rowwise() %>% 
        mutate(quiztotal = sum(c(`Quiz 1 (10690775)`,
                                 `Quiz 2 (10690779)`,
                                 `Quiz 3 (10690774)`,
                                 `Quiz 4 (10690777)`,
                                 `Quiz 5 (10690783)`,
                                 `Quiz 6 (10690776)`,
                                 `Quiz 7 (10690792)`,
                                 `Quiz 8 (10690790)`,
                                 `Quiz 9 (10690778)`,
                                 `Quiz 10 (10690780)`,
                                 `Quiz 11 (10690791)`,
                                 `Quiz 12: Review Quiz (10690786)`,
                                 `Quiz 13: Review Quiz (10690781)`),
                               na.rm = TRUE))
comm3710 %>% 
        freq(quiztotal)

# Convert values > 100 to 100
comm3710 <- comm3710 %>% 
        mutate(finalquiz = case_when(quiztotal > 100 ~ 100,
                                     quiztotal <= 100 ~ quiztotal))
comm3710 %>% 
        freq(finalquiz)

# Assignments total
comm3710 <- comm3710 %>% 
        rowwise() %>% 
        mutate(assigntotal = sum(c(`LA-1: Installing R and RStudio (10690793)`,
                                   `LA-2: Ethics in Human Subjects Research (10690794)`,
                                   `LA-3: Setting Up and Working with Data (10690795)`,
                                   `LA-4: Data Wrangling (10690796)`,
                                   `LA-5: Examining and Managing Data (10690797)`,
                                   `LA-6: Examining and Managing Data (10690798)`,
                                   `LA-7: Visualizing Data (10690799)`,
                                   `LA-8: Examining Relationships (10690800)`,
                                   `LA-9: Practice Data Analysis (10690801)`),
                                 na.rm = TRUE))
comm3710 %>% 
        freq(assigntotal)

# Convert values > 90 to 90
comm3710 <- comm3710 %>% 
        mutate(finalassign = case_when(assigntotal > 90 ~ 90,
                                     assigntotal <= 90 ~ assigntotal))
comm3710 %>% 
        freq(finalassign)


# Compute final grade from `finalattend`, `finalquiz`, `finalassign` ------
comm3710 <- comm3710 %>% 
        rowwise() %>% 
        mutate(finalscore = finalassign + finalquiz + finalattend)
comm3710 %>% 
        freq(finalscore)


# Extra R code ------------------------------------------------------------
# graphdta <- comm3710 %>% 
#         gather(., key = "variable",
#                value = "value")
# 
# # Examine lab assignment grades -------------------------------------------
# comm3710 %>% 
#         select(LA1:LA4) %>% 
#         group_by() %>% 
#         descr()
# 
# graphdta %>% 
#         filter(variable == "LA1" |
#                        variable == "LA2" |
#                        variable == "LA3" |
#                        variable == "LA4") %>% 
#         ggplot(aes(x = variable, y = value)) +
#         geom_boxplot() +
#         scale_x_discrete(name = "") +
#         scale_y_continuous(name = "Score",
#                            expand = c(0,0),
#                            limits = c(-0.5, 12.5),
#                            breaks = seq(0, 12, 1)) +
#         theme_bw()
# 
# 
# # Examine quiz grades -----------------------------------------------------
# comm3710 %>% 
#         select(Q1:Q7) %>% 
#         group_by() %>% 
#         descr()
# 
# graphdta %>% 
#         filter(variable == "Q1" |
#                        variable == "Q2" |
#                        variable == "Q3" |
#                        variable == "Q4" |
#                        variable == "Q5" |
#                        variable == "Q6" |
#                        variable == "Q7") %>% 
#         ggplot(aes(x = variable, y = value)) +
#         geom_boxplot() +
#         scale_x_discrete(name = "") +
#         scale_y_continuous(name = "Score",
#                            expand = c(0,0),
#                            limits = c(-0.5, 11.5),
#                            breaks = seq(0, 11, 1)) +
#         theme_bw()
