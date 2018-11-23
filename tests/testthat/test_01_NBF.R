######################################
#######     gamlss.dist        #######
#######   Distribution tests 2 #######
### Negative binomial family: NBF() ##
######################################

## Context
testthat::context("NBF")

## Seed
set.seed(376)

## Family
fam <- NBF()

## Random Values
i <- 1 
n <- 1e6  
mu <- 1 + i  
sigma <- 1 + i 
nu <- 2 + i
rvec <- rNBF(n, mu, sigma, nu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.2) # converges for higher n so ok

