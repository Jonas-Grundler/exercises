# Exercise 1

library(dplyr)
library(nycflights13)

## 1. Which plane (check the tail number) flew out of each New York airport 
##    the most?
   
flights %>%
  select(origin, tailnum) %>%
  filter(!is.na(tailnum)) %>%
  group_by(origin) %>%
  count(tailnum) %>%
  top_n(n = 1, wt = n)
 
## 2. Which date should you fly on if you want to have the lowest possible 
##    average departure delay? What about arrival delay?

flights %>%
  select(year, month, day, arr_delay, dep_delay) %>%
  group_by(year, month, day) %>%
  summarize(
    avg_dep_delay = mean(dep_delay, na.rm = TRUE),
    avg_arr_delay = mean(arr_delay, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  filter(
    avg_dep_delay == min(avg_dep_delay) | 
    avg_arr_delay == min(avg_arr_delay)
  )
