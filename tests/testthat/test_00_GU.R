#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######      Gumbel: GU()      ########
#######################################

## Context
testthat::context("GU")

## Seed
set.seed(321)

## Family
fam <- GU()

## Random Values
mu <- 0
sigma <- 1
rvec <- rGU(1e6, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 2)
vx_emp <- round(var(rvec), 2)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma), 2)
vx_theo <- round(fam$variance(mu, sigma), 2)

## Test here
expect_equal(ex_emp, ex_theo)
expect_equal(vx_emp, vx_theo)

