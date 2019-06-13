#' Calculate Water Tax
#'
#' This function calculates the monthly tax on consumers for safe drinking water. The tax depends on household water consumption as well as availability of clean water sources. During low precipitation months the city has to turn to more expensive sources of water like desalination or imported water, raising the price of the tax.
#' @param precip_data Data frame that contains the following variables: water_year, Location, ID, month, and precip
#' @param household_consumption Average household water consumption in gallons. Average in California is 86 gallons
#' @return Tax price in dollars
#' @example how to use it
#' @references citations or urls
#' @author Jamie Miller and Anna Calle
#'

calc_water_tax = function(precip_data, household_consumption, location, month_tax, year) {

  # Precipitation at location of household in specified year and month
  precip_at_location <- precip_data %>%
    filter( water_year == year) %>%
    filter( Location == location) %>%
    filter( month == month_tax) %>%
    select(precip)

  precip_number <- as.double(precip_at_location$precip[1,1])
    colnames(precip_number) <- NULL

    # Tax price
  tax_price <- (household_consumption/100) + precip_number

  return(tax_price)
}


