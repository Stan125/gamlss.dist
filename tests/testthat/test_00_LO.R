#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######      Logistic: LO()    ########
#######################################

## Context
testthat::context("LO")

## Seed
set.seed(321)

## Family
fam <- LO()

## Random Values
mu <- 10
sigma <- 2
rvec <- rLO(1e7, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 2)
vx_emp <- round(var(rvec), 2)

## Theoretical moments
ex_theo <- round(fam$ex(mu, sigma), 2)
vx_theo <- round(fam$vx(mu, sigma), 2)

## Test here
expect_equal(ex_emp, ex_theo)
expect_equal(vx_emp, vx_theo)

