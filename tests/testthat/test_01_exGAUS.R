########################################
#######     gamlss.dist         ########
#######   Distribution tests 2  ########
#### Exponential Gaussian: exGAUS() ####
########################################

## Context
testthat::context("exGAUS")

## Seed
set.seed(217)

## Family
fam <- exGAUS()

## Random Values
i <- 1
mu <- 5 + i
sigma <- 1 + i
nu <- 1 + i
rvec <- rexGAUS(1e5, mu, sigma, nu)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)
expect_true(abs(vx_emp - vx_theo) < 0.02)

