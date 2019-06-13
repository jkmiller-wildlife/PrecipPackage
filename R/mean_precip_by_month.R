#' Mean monthly precipitation
#'
#' This function calculates the mean precipation by month for all years and produces a graph to visualize the data.
#' @param precip_array array that contains the following information
#' @return what your function returns (outputs)
#' @example how to use it
#' @references Source: Monthly Observed Precipitation - NWS Cooperative Observers. The following are data from NWS cooperative observers for the current water year and historically back to Water Year 2002. The water year starts on Oct 1 and ends on Sept 30. Precipitation data is provided for each month of the current water year, total precipitation for the water year, the percent of normal for the water year to date, and the percent of the entire water year received to date. \url{https://www.cnrfc.noaa.gov/rainfall_data.php#monthly}
#' @author Jamie Miller and Anna Calle
#'


mean_precip_by_month <- function(precip_array, plot = TRUE) {

  precip_month_mean <- apply(precip_array, MARGIN = 3, FUN = mean)

  mean_precip_by_month_df <- data.frame(month = c("Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"),
                                        mean_precip = precip_month_mean)

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





