########################################
#######     gamlss.dist        #########
#######   Distribution tests 2 #########
##### Normal-Exponential-t: NET() ######
########################################

## Context
testthat::context("NET")

## Seed
set.seed(239)

## Family
fam <- NET()

## Random Values
i <- 2
n <- 1e6
mu <- 0 + i
sigma <- 1 + i
nu <- 4 + i
tau <- 4 + i
rvec <- gamlss.dist:::rNET(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 