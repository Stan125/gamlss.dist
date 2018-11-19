###############################################
###########     gamlss.dist        ############
###########   Distribution tests 2 ############
# Exponential generalized beta type 2: EGB2() #
###############################################

## Context
testthat::context("EGB2")

## Seed
set.seed(333)

## Family
fam <- EGB2()

## Random Values
i <- 1
mu <- 0 + i
sigma <- 1 + i
nu <- 1 + i
tau <- 0.5 + i
rvec <- rEGB2(1e6, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01)

