
test_that(
  "Seasons equal 4 when using mean_precip_by_season",
  {
    data(monthly_precip)
    expect_equal(length(mean_precip_by_season(precip_data= monthly_precip, year=2012)$Season), 4)

  }
)


