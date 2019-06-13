#' Monthly Precipitation Array
#'
#' This function creates an array from the monthly_precip$precip data frame, water_year, Location, and month.
#'@format An array with 632 observations in 4 columns.
#' \itemize{
#' \item water_year: From 2002 to 2019. The water year starts on October 1 and ends on September 30.
#' \item Location: Paso Robles, San Luis Obispo, and Santa Barbara [1:18]
#' \item month: Three-letter abreviation of precipitation month [1:3]
#' \item precip: Precipitation measured in inches [1:12]
#'
#' @return Returns precip_array.
#' @references Source: Monthly Observed Precipitation - NWS Cooperative Observers. The following are data from NWS cooperative observers for the current water year and historically back to Water Year 2002. The water year starts on Oct 1 and ends on Sept 30. Precipitation data is provided for each month of the current water year, total precipitation for the water year, the percent of normal for the water year to date, and the percent of the entire water year received to date. \url{https://www.cnrfc.noaa.gov/rainfall_data.php#monthly}
#' @author Jamie Miller and Anna Calle
#'

# Take monthly_precip dataframe, turn into a multidimensional array, find mean precipitation either by month, location, or water year, or all.


precip_array <- array(data = monthly_precip$precip,
                      dim = c(18,3,12),
                      dimnames = list(2002:2019, # water year labels
                                      Location = c("Paso Robles", "San Luis Obispo", "Santa Barbara"),
                                      Month = c("Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep")))


