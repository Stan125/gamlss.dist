#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#### Exponential Gaussian: exGAUS() ####
#######################################

## Context
testthat::context("exGAUS")

## Seed
set.seed(222)

## Family
fam <- exGAUS()

## Random Values
mu <- 5
sigma <- 1
nu <- 1
rvec <- rexGAUS(1e4, mu, sigma, nu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)
expect_true(abs(vx_emp - vx_theo) < 0.01)

