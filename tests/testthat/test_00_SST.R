#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######  Skew Student t: SST() ########
#######################################

## Context
testthat::context("SST")

## Seed
set.seed(222)

## Family
fam <- SST()

## Random Values
mu <- 0
sigma <- 1
nu <- 0.8
tau <- 7
rvec <- rSST(1e6, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu, tau),3)
vx_theo <- round(fam$variance(mu, sigma, nu, tau),3)

## Test here 
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01)  # not true -> larger deviations between empirical and theoretical 

## Test here for deviation smaller than 0.03
expect_true(abs(vx_emp - vx_theo) < 0.03) # not true -> larger deviations between empirical and theoretical 

## Test here for deviation smaller than 0.05
expect_true(abs(vx_emp - vx_theo) < 0.05) # not true -> larger deviations between empirical and theoretical 

##!!Deviation of emp. and theo. variance is too large!!##