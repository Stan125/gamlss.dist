#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
#######  Normal family: NOF()  ########
#######################################

## Context
testthat::context("NOF 2")

## Seed
set.seed(222)

## Family
fam <- NOF()

## Random Values
i <- 1
mu <- 0 + i 
sigma <- 1 + i
nu <- 0 + i
rvec <- rNOF(1e6, mu, sigma, nu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)
expect_true(abs(vx_emp - vx_theo) < 0.01)

