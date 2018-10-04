#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
# Pareto type 2 original: PARETO2o()  #
#######################################

## Context
testthat::context("PARETO2o")

## Seed
set.seed(222)

## Family
fam <- PARETO2o()

## Random Values
mu <- 1
sigma <- 5
n <- 1e6  # default is 1e6, smaller sample if loading takes too long
rvec <- rPARETO2o(n, mu, sigma)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01)  
