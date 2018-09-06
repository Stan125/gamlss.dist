#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######   Generalized t: GT()  ########
#######################################

## Context
testthat::context("GT")

## Seed
set.seed(222)

## Family
fam <- GT()

## Random Values
mu <- 0
sigma <- 1
nu <- 3
tau <- 1.5
rvec <- rGT(1e3, mu, sigma, nu, tau) # smaller sample to speed it up

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu, tau),3)
vx_theo <- round(fam$variance(mu, sigma, nu, tau),3)

## Test here with deviation smaller .05, larger deviation possible due to smaller sample
expect_true(abs(ex_emp - ex_theo) < 0.05)  
expect_true(abs(vx_emp - vx_theo) < 0.05)  

