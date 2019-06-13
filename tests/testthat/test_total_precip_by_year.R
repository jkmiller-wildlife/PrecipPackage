test_that(
  "Years equal 18 and Locations equal 3 when using total_precip_by_year",
  {
    data(monthly_precip)

    expect_that(total_precip_by_year(precip_data= monthly_precip, year=water_year), length(unique(monthly_precip$year)) == 18)
    expect_that(total_precip_by_year(precip_data= monthly_precip, year=water_year), length(unique(monthly_precip$Location)) == 3)
  }
)


