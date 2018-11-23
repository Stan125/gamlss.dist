#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######   Exponential: EXP()   ########
#######################################

## Context
testthat::context("EXP 2")

## Seed
set.seed(228)

## Family
fam <- EXP()

## Random Values
i <- 1
mu <- 1 + i
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
