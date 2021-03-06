#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######     Johnson SU: JSUo()  ########
#######################################

## Context
testthat::context("JSUo")

## Seed
set.seed(222)

## Family
fam <- JSUo()

## Random Values
mu <- 0
sigma <- 1
nu <- 0
tau <- 1
rvec <- rJSUo(1e7, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu, tau),3)
vx_theo <- round(fam$variance(mu, sigma, nu, tau),3)

## Test here 
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01)  # not true -> larger deviations between empirical and theoretical 

