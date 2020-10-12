library(dplyr)
library(nycflights13)

flights %>%
  filter(dest == "LAX") %>%
  filter(carrier %in% c("AA", "UA", "DL", "US")) %>%
  filter (month == 5) %>%
  filter (origin == "JFK") %>%
  group_by(carrier) %>%
  summarise(
    n = n(), 
    avg_dur = mean(air_time, na.rm = TRUE),
    .groups = "drop_last"
  )


flights %>%
  select(origin, dest, air_time) %>%
  group_by(origin) %>%
  filter(air_time == min(air_time, na.rm = TRUE)) %>%
  distinct()


flights %>%
  select(origin, dest, air_time) %>%
  group_by(origin) %>%
  slice_min(air_time, n=1) %>%
  distinct()

"Which plane (check the tail number) flew out of each New York airport the most?"
  



"Which date should you fly on if you want 
to have the lowest possible average departure delay? What about arrival delay?"


