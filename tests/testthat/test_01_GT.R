#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
#######   Generalized t: GT()  ########
#######################################

## Context
testthat::context("GT")

## Seed
set.seed(222)

## Family
fam <- GT()

## Random Values
i <- 1
mu <- 0 + i
sigma <- 1 + i
nu <- 3 + i
tau <- 1.5 + i
rvec <- rGT(1e3, mu, sigma, nu, tau) # smaller sample to speed it up

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu, tau),3)
vx_theo <- round(fam$variance(mu, sigma, nu, tau),3)

## Test here 
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  

