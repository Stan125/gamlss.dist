#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
###### Power Exponential: PE()  #######
#######################################

## Context
testthat::context("PE")

## Seed
set.seed(222)

## Family
fam <- PE()

## Random Values
mu <- 0
sigma <- 1
nu <- 2
rvec <- rPE(1e6, mu, sigma, nu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)
expect_true(abs(vx_emp - vx_theo) < 0.01)

