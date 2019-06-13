test_that(
  "Precipitation is always numeric and positive",
  {
    data(monthly_precip)

    expect_that(mean_precip_by_season(precip_data= monthly_precip, year=water_year), class(monthly_precip$precip) == "numeric")
    expect_true(mean_precip_by_season(precip_data= monthly_precip, year=water_year), class(monthly_precip$precip) >= 0)
  }
)

