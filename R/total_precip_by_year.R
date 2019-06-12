#' Total Precipitation for a each water year
#'
#' This function calculates the mean precipation by season for a given year
#' @param precip_data data frame that contains the following information
#' @return what your function returns (outputs)
#' @example how to use it
#' @references citations or urls
#' @author Jamie Miller and Anna Calle
#'


total_precip_by_year <- function(precip_data, plot = FALSE) {

  wy_tot <- precip_data %>%
    group_by(Location, water_year) %>%
    summarize(sum_precip = sum(precip)) %>%
    ungroup()

  if(plot == TRUE) {

    wy_tot_plot <- ggplot(wy_tot, aes(x = water_year, y = sum_precip)) +
      geom_col(aes(fill = Location)) +
      labs(x = "Water Year", y = "Total Precipitation (inches)") +
      theme_bw()
    print(wy_tot_plot)
  }

  if(plot == FALSE) {

    wy_tot_table <- wy_tot %>%
      rename("Water Year" = water_year) %>%
      spread(wy_tot, key = Location, value = sum_precip) %>%
      knitr::kable()
    }

  return(wy_tot_table)

  }
