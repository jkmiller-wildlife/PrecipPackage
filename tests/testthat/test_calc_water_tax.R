test_that(
  "Tax is positive and higher than zero",
  {
    data(monthly_precip)

    expect_true( calc_water_tax(monthly_precip, 100, "SANTA BARBARA", "OCT", 2012) > 0 )
  }
)


