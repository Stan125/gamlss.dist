#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
###  Beta negative binomial: BNB()  ###
#######################################

## Context
testthat::context("BNB 2")

## Seed
set.seed(123)

## Family
fam <- BNB()

## Random Values
i <- 1 
n <- 1e4
mu <- 1 + i
sigma <- 0.2 + i  - 1.1
nu <- 1 + i
rvec <- rBNB(n, mu, sigma, nu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here if they are about the same
expect_true(abs(ex_emp / ex_theo - 1) < 0.03) # converges for higher n so ok
expect_true(abs(vx_emp / vx_theo - 1) < 0.03)
