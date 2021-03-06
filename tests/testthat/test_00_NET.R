########################################
#######     gamlss.dist        #########
#######   Distribution tests   #########
##### Normal-Exponential-t: NET() ######
########################################

## Context
testthat::context("NET")

## Seed
set.seed(239)

## Family
fam <- NET()

## Random Values
n <- 1e6
mu <- 1
sigma <- 1
nu <- 4
tau <- 4
rvec <- gamlss.dist:::rNET(n, mu, sigma, nu, tau) # Conflict: nu and tau have to be larger than 3, otherwise the variance goes to Inf

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 