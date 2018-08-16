#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#### Normal sec reparametr.: NO2() ####
#######################################

## Context
testthat::context("NO2")

## Seed
set.seed(328)

## Family
fam <- NO2()

## Random Values
mu <- 0
sigma <- 1
rvec <- rNO2(1e6, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3 )

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)
expect_true(abs(vx_emp - vx_theo) < 0.01)

