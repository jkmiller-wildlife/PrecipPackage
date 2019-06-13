#' Predict Flooding Risk
#'
#' This function predicts the location and month that had the highest risk of flooding in a given year. This is determined by calculating the location and month that have the greatest positive difference from the historic precipitation average.
#' @param precip_data Data frame that contains the following variables: water_year, Location, ID, month, and precip.
#' @param year Year selected
#' @return Location, month, mean historic precipitation, precipitation and difference between mean historic precipitation and precipitation of place with highest risk of flooding
#' @example how to use it
#' @references citations or urls
#' @author Jamie Miller and Anna Calle
#'

predict_flooding <- function(precip_data, year){

  # Dataframe for month average of all years
  monthly_precip_average <- precip_data %>%
    group_by(Location, month) %>%
    summarize(mean_precip_month = mean(precip))

  # Dataframe for precip in a given year
  precip_yr <- precip_data %>%
    filter(water_year == year)

  # Calculate location and month with highest risk of flooding in a year
  precip_df <- merge(monthly_precip_average, precip_yr,by=c("Location", "month")) %>%
    mutate(difference = precip - mean_precip_month) %>%
    filter(difference == max(difference)) %>%
    select(-water_year)

  colnames(precip_df) <- c("Location", "Month", "Mean Historic Precipitation", "Precipitation", "Difference Between Historic Precipitation and Precipitation")


 return(precip_df)

}












