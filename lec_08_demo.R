# Monte carlo estimates of pi
# https://academo.org/demos/estimating-pi-monte-carlo/
#
# \pi \approx 4 N_{unit circle} / N_{total}
#

library(dplyr)
library(purrr)

draw_points = function(n) {
  list(
    x = runif(n, -1, 1),
    y = runif(n, -1, 1)
  )
}

in_unit_circle = function(d) {
  sqrt(d$x^2 + d$y^2) <= 1
}

plot_points = function(d, title = "", cex = 0.25) {
  plot(d$x, d$y, main = title, pch = 16, cex = cex, col = in_unit_circle(d) + 1)
}



sim = draw_points(10000)

4 * sum( in_unit_circle(sim) ) / 10000

plot_points(sim)

set.seed(1234)

(df = tibble(
  n = 10^(2:6)
) %>%
  mutate(draws = map(n, draw_points)) %>%
  mutate(n_inside = map_int(draws, ~ sum(in_unit_circle(.))) ) %>%
  mutate(
    pi_approx = 4 * n_inside / n,
    pi_error = abs(pi_approx - pi)
  ))

par(mfrow=c(2,2))

walk(df$draws[1:4], plot_points)

walk2(df$draws[1:4], paste("n = ", df$n[1:4]), plot_points)
