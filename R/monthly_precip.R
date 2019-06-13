#' Monthly Observed Precipitation
#'
#' The following are data from the NWS cooperative observers for the current water year and historically back to Water Year 2002. The water year starts on Oct 1 and ends on Sept 30. Precipitation data is provided for each month of the current water year, total precipitation for the water year, the percent of normal for the water year to date, and the percent of the entire water year received to date.
#'
#' @format A data frame with 632 observations and 4 variables.
#' \itemize{
#' \item water_year: From 2002 to 2019. The water year starts on October 1 and ends on September 30.
#' \item Location: Paso Robles, San Luis Obispo, and Santa Barbara
#' \item month: Three-letter abreviation of precipitation month
#' \item precip: Precipitation measured in inches
#' }
#' @source NWS Cooperative Observers \url{https://www.cnrfc.noaa.gov/rainfall_data.php#monthly}
#' @author Anna Calle and Jamie Miller
#'
"monthly_precip"
