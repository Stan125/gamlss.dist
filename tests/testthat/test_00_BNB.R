#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
###  Beta negative binomial: BNB()  ###
#######################################

## Context
testthat::context("BNB")

## Seed
set.seed(178)

## Family
fam <- BNB()

## Random Values
n <- 1e5  
mu <- 1  
sigma <- 0.2  
nu <- 1
rvec <- rBNB(n, mu, sigma, nu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.4) # converges for higher n so ok
