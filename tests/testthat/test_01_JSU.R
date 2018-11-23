#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
### Sec parametr. Johnson SU: JSU() ###
#######################################

## Context
testthat::context("JSU 2")

## Seed
set.seed(222)

## Family
fam <- JSU()

## Random Values
i <- 1
mu <- 0 + i
sigma <- 1 + i
nu <- 1 + i
tau <- 1 + i
rvec <- rJSU(1e6, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu, tau),3)
vx_theo <- round(fam$variance(mu, sigma, nu, tau),3)

## Test here 
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01)  
