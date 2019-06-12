### Read in Data

slo_climate_data <- read_csv("slo_climate_data.csv")

monthly_precip <- gather(slo_climate_data,
                         key = "month",
                         value = "precip", "OCT","NOV","DEC","JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP") %>%
  filter(!is.na(precip))

