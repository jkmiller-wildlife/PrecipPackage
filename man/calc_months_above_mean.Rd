% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_months_above_mean.R
\name{calc_months_above_mean}
\alias{calc_months_above_mean}
\title{Number of months above mean annual precipitation}
\usage{
calc_months_above_mean(precip_data)
}
\arguments{
\item{precip_data}{The function uses data from the precipitaion data frame "monthly_precip".}
}
\value{
Returns a graph displaying the number of months where the mean precipitation is above the mean.
}
\description{
This function calculates the number of months that precipitation is above the mean annual precipation for each year at a given location.
}
\references{
Source: Monthly Observed Precipitation - NWS Cooperative Observers. The following are data from NWS cooperative observers for the current water year and historically back to Water Year 2002. The water year starts on Oct 1 and ends on Sept 30. Precipitation data is provided for each month of the current water year, total precipitation for the water year, the percent of normal for the water year to date, and the percent of the entire water year received to date. \url{https://www.cnrfc.noaa.gov/rainfall_data.php#monthly}
}
\author{
Jamie Miller and Anna Calle
}
