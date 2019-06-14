test_that(
  "Precipitation in locations with risk of flooding is higher than average historic precipitation",
  {
    data(monthly_precip)

    expect_true( predict_flooding(monthly_precip, 2013)$"Precipitation">predict_flooding(monthly_precip, 2013)$"Mean Historic Precipitation"
    )
  }
)


