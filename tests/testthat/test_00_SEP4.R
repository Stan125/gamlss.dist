###########################################
########     gamlss.dist        ###########
########   Distribution tests   ###########
## Skew Exponential Power type 4: SEP4() ##
###########################################

## Context
testthat::context("SEP4")

## Seed
set.seed(241)

## Family
fam <- SEP4()

## Random Values
n <- 1e6
mu <- 0
sigma <- 1
nu <- 2
tau <- 2
rvec <- rSEP4(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)
