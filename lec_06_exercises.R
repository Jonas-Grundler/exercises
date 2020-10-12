# Exercise 1

library(dplyr)
library(nycflights13)

flights %>%
  select(origin, dest, air_time) %>%
  group_by(origin) %>%
  filter(air_time == min(air_time, na.rm = TRUE)) %>%
  distinct()

## 1. Which plane (check the tail number) flew out of each New York airport 
##    the most?

flights %>%
  select(origin, tailnum) %>%
  group_by(origin, tailnum) %>%
  summarise(
    flights = n(),
    .groups = "drop_last"
  ) %>%
  filter(flights == max(flights))


## 2. Which date should you fly on if you want to have the lowest possible 
##    average departure delay? What about arrival delay?

flights %>%
  select(year, month, day, dep_delay) %>%
  mutate(date = paste(year, month, day, sep="/")) %>%
  select(date, dep_delay) %>%
  group_by(date) %>%
  summarise(
    n = n(), 
    avg_delay = mean(dep_delay, na.rm = TRUE),
    .groups = "drop_last"
  ) %>%
  filter(avg_delay == min(avg_delay))  
    

flights %>%
  select(year, month, day, arr_delay) %>%
  mutate(date = paste(year, month, day, sep="/")) %>%
  select(date, arr_delay) %>%
  group_by(date) %>%
  summarise(
    n = n(), 
    avg_delay = mean(arr_delay, na.rm = TRUE),
    .groups = "drop_last"
  ) %>%
  filter(avg_delay == min(avg_delay))  
  
  
  
  
  
  
  





