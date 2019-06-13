## ----setup---------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(tidyverse)
library(devtools)
library(roxygen2)
library(PrecipPackage)


## ----example-------------------------------------------------------------

# Get precipitation data
data("monthly_precip")

# Mean Precipitation by Season Function
# To see how this function works you can change the year and use the same precipitation data
mean_precip_by_season(monthly_precip, 2014)


