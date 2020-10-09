# Demos

library(dplyr)
library(nycflights13)

## 1. How many flights to Los Angeles (LAX) did each of the legacy carriers 
##    (AA, UA, DL or US) have in May from JFK, and what was their average duration?
    
flights %>%
  filter(dest == "LAX") %>%
  filter(carrier %in% c("AA", "UA", "DL", "US")) %>%
  filter(month == 5) %>%
  filter(origin == "JFK") %>%
  group_by(carrier) %>%
  summarise(
    n = n(),
    avg_dur = mean(air_time, na.rm = TRUE),
    .groups = "drop_last"
  )

## 2. What was the shortest flight out of each airport in terms of distance? 
##    In terms of duration?

flights %>% 
  select(origin, dest, distance) %>%
  group_by(origin) %>%
  filter(distance == min(distance, na.rm=TRUE)) %>%
  distinct()

flights %>% 
  select(origin, dest, air_time) %>%
  group_by(origin) %>%
  slice_min(air_time, n=1) %>%
  distinct()
