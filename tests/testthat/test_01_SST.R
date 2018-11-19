#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
#######  Skew Student t: SST() ########
#######################################

## Context
testthat::context("SST")

## Seed
set.seed(222)

## Family
fam <- SST()

## Random Values
i <- 1
mu <- 0 + i
sigma <- 1 + i
nu <- 0.8 + i
tau <- 7 + i
rvec <- rSST(1e6, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu, tau),3)
vx_theo <- round(fam$variance(mu, sigma, nu, tau),3)

## Test here 
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01)  