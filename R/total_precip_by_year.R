#' Total precipitation for a each water year, separted by location
#'
#' This function calculates the total precipation for each year at a given location and produces a graph to visualize the data.
#' @param precip_data The function uses data from a precipitaion data frame that contains the following information
#' @return Returns a graph that
#' @example how to use it
#' @references Source: Monthly Observed Precipitation - NWS Cooperative Observers. The following are data from NWS cooperative observers for the current water year and historically back to Water Year 2002. The water year starts on Oct 1 and ends on Sept 30. Precipitation data is provided for each month of the current water year, total precipitation for the water year, the percent of normal for the water year to date, and the percent of the entire water year received to date. https://www.cnrfc.noaa.gov/rainfall_data.php#monthly
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
