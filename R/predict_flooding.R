#' Predict Flooding Risk
#'
#' This function predict for a given year
#' @param precip_data data frame that contains the following information
#' @return what your function returns (outputs)
#' @example how to use it
#' @references citations or urls
#' @author Jamie Miller and Anna Calle
#'

predict_flooding <- function(precip_data, year){

  # Dataframe for month average of all years
  mean_precip_all_yrs <- precip_data %>%
    group_by(Location, month) %>%
    summarize( mean_precip_month = mean(precip))

  # Dataframe for precip in a given year
  mean_precip_yr <- precip_data %>%
    filter( water_year == year)

  # Calculate location and month with highest risk of flooding in a year
  precip_df <- merge(mean_precip_all_yrs, mean_precip_yr,by=c("Location", "month")) %>% mutate( difference = precip - mean_precip_month) %>%
    filter( difference == max(difference)) %>%
    select(-ID)

 return(precip_df)

}












