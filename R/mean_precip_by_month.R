#' Total Precipitation for a each water year
#'
#' This function calculates the mean precipation by season for a given year
#' @param precip_data data frame that contains the following information
#' @return what your function returns (outputs)
#' @example how to use it
#' @references citations or urls
#' @author Jamie Miller and Anna Calle
#'


mean_precip_by_month <- function(precip_array) {

  precip_month_mean <- apply(precip_array, MARGIN = 3, FUN = mean)

  return(precip_month_mean)

}




