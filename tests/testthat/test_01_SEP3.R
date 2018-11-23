###########################################
########     gamlss.dist        ###########
########   Distribution tests 2 ###########
## Skew Exponential Power type 3: SEP3() ##
###########################################

## Context
testthat::context("SEP3 2")

## Seed
set.seed(257)

## Family
fam <- SEP3()

## Random Values
i <- 1
n <- 1e6
mu <- 0 + i
sigma <- 1 + i
nu <- 2 + i
tau <- 2 + i
rvec <- rSEP3(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)
