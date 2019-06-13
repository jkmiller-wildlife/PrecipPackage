#' Mean monthly precipitation
#'
#' This function creates an array from the monthly_precip$precip data frame, water_year, Location, and month. It then calculates the mean precipation by month for all years and produces a graph to visualize the data.
#' @param precip_array The function uses data from the precipitaion array "precip_array".
#'@format An array with 632 observations in 4 columns.
#' \itemize{
#' \item water_year: From 2002 to 2019. The water year starts on October 1 and ends on September 30.
#' \item Location: Paso Robles, San Luis Obispo, and Santa Barbara
#' \item month: Three-letter abreviation of precipitation month
#' \item precip: Precipitation measured in inches
#' @return Returns either a graph or table that summarizes the mean monthly precipitation for all water years (2002-2019).
#' @example To plot the graph, enter TRUE in the command line of the function. To see the table summarizing the results, enter FALSE.
#' @references Source: Monthly Observed Precipitation - NWS Cooperative Observers. The following are data from NWS cooperative observers for the current water year and historically back to Water Year 2002. The water year starts on Oct 1 and ends on Sept 30. Precipitation data is provided for each month of the current water year, total precipitation for the water year, the percent of normal for the water year to date, and the percent of the entire water year received to date. \url{https://www.cnrfc.noaa.gov/rainfall_data.php#monthly}
#' @author Jamie Miller and Anna Calle
#'


mean_precip_by_month <- function(precip_data, plot = TRUE) {

  # Create an array from the data frame
  precip_array <- array(data = precip_data$precip,
                      dim = c(18,3,12),
                      dimnames = list(2002:2019, # water year labels
                                      Location = c("Paso Robles", "San Luis Obispo", "Santa Barbara"),
                                      Month = c("Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep")))

  # Run mean calculation on the array
  precip_month_mean <- apply(precip_array, MARGIN = 3, FUN = mean)

  # Put calculation back in dataframe
  mean_precip_by_month_df <- data.frame(month = c("Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"),
                                        mean_precip = precip_month_mean)

  # Graph it
  if(plot == TRUE) {

    mean_precip_by_month_df$month = factor(mean_precip_by_month_df$month, levels = month.abb)

    mean_precip_by_month_plot <- ggplot(mean_precip_by_month_df, aes(x = month, y = mean_precip)) +
      geom_col() +
      labs(x = "Month", y = "Mean Precipitation (inches)") +
      scale_x_discrete(limits = month.abb) +
      theme_bw()
    print(mean_precip_by_month_plot)
  }

  return(mean_precip_by_month_df)

}





