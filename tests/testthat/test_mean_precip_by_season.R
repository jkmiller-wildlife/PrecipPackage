test_that(
  "Months equal 12 and seasons equal 4 when using mean_pecip_by_season",
  {
    data(monthly_precip)

    expect_that(mean_precip_by_season(precip_data= monthly_precip, year=water_year), length(unique(mean$Season)) == 4)
    expect_that(mean_precip_by_season(precip_data= monthly_precip, year=water_year), length(unique(monthly_precip$month)) == 12)
  }
)


