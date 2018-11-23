#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
#######      Normal: NO()      ########
#######################################

## Context
testthat::context("NO 2")

## Seed
set.seed(328)

## Family
fam <- NO()

## Random Values
i <- 1
mu <- 0 + i
sigma <- 1 + i
rvec <- rNO(1e6, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 2)
vx_emp <- round(var(rvec), 2)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma), 2)
vx_theo <- round(fam$variance(mu, sigma), 2)

## Test here
expect_equal(ex_emp, ex_theo)
expect_equal(vx_emp, vx_theo)

