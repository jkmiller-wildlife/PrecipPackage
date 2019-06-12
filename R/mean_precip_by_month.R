#' Total Precipitation for a each water year
#'
#' This function calculates the mean precipation by season for a given year
#' @param precip_data data frame that contains the following information
#' @return what your function returns (outputs)
#' @example how to use it
#' @references citations or urls
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

  if(plot == FALSE) {

    mean_precip_by_month_table <- mean_precip_by_month_df %>%
      rename("Month" = month,
             "Mean Precipitation (inches)" = mean_precip) %>%
      knitr::kable(digits = 2)
  }


  return(mean_precip_by_month_table)

}




