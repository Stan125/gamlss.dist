#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######   Exponential: EXP()   ########
#######################################

## Context
testthat::context("EXP")

## Seed
set.seed(222)

## Family
fam <- EXP()

## Random Values
mu <- 1
rvec <- rEXP(1e6, mu) 

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu),3)
vx_theo <- round(fam$variance(mu),3)

## Test here 
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01)  