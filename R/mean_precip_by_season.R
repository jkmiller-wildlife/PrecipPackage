#' Mean Precipitation per Season
#'
#' This function calculates the mean precipation by season for a given year
#' @param precip_data data frame that contains the following information
#' @return what your function returns (outputs)
#' @example how to use it
#' @references citations or urls
#' @author Jamie Miller and Anna Calle
#'

mean_precip_by_season = function(precip_data, year) {
mean <- precip_data %>%
  filter(water_year == year) %>%
  mutate( Season = case_when(
    month == "JAN" ~ "Winter",
    month == "FEB" ~ "Winter",
    month == "MAR" ~ "Spring",
    month == "APR" ~ "Spring",
    month == "MAY" ~ "Spring",
    month == "JUN" ~ "Summer",
    month == "JUL" ~ "Summer",
    month == "AUG" ~ "Summer",
    month == "SEP" ~ "Fall",
    month == "OCT" ~ "Fall",
    month == "NOV" ~ "Fall",
    month == "DEC" ~ "Winter"
  )) %>%
    group_by(Season) %>%
    summarize("Mean Precipitation" = round(mean(precip), digits = 3))

  return(mean)
}


















