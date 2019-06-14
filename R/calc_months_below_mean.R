#' Number of months below mean annual precipitation
#'
#' This function calculates the number of months that precipitation is below the mean annual precipation for each year at a given location.
#' @param precip_data The function uses data from the precipitaion data frame "monthly_precip".
#' @return Returns a graph displaying the number of months where the mean precipitation is below the mean.
#' @references Source: Monthly Observed Precipitation - NWS Cooperative Observers. The following are data from NWS cooperative observers for the current water year and historically back to Water Year 2002. The water year starts on Oct 1 and ends on Sept 30. Precipitation data is provided for each month of the current water year, total precipitation for the water year, the percent of normal for the water year to date, and the percent of the entire water year received to date. \url{https://www.cnrfc.noaa.gov/rainfall_data.php#monthly}
#' @author Jamie Miller and Anna Calle
#'


calc_months_below_mean <- function(precip_data) {

  # data from of the mean precipitation by location and water year
  wy_loc_mean <- precip_data %>%
    group_by(Location, water_year) %>%
    summarize(mean_precip = mean(precip))

  # dataframe of the total monthly precipitation for each month at a given location in every water year
  wy_all_month <- precip_data %>%
    select(water_year, Location, month, precip)

  # Left join of the two data frames by location and water year
  wy_loc_mean_join <- left_join(wy_all_month, wy_loc_mean, by = c("Location" = "Location", "water_year" = "water_year"))

  # calculation of the difference between the mean annual and monthly precipitation
  mean_diff_calc <- wy_loc_mean_join %>%
    mutate(precip_diff = precip - mean_precip) %>%
    filter(precip_diff < 0) %>%
    group_by(water_year, Location) %>%
    summarize(months_above_mean = length(month))

  # Graph it!
  mean_diff_plot_below <- ggplot(mean_diff_calc, aes(x = water_year, y = months_above_mean)) +
    geom_bar(position="dodge", stat="identity") +
    facet_wrap(~Location) +
    theme_bw() +
    labs(x = "Water Year", y = "Number of Months Below Mean Precipitation")


  return(mean_diff_plot_below)

}
