#################################################
############       gamlss.dist      #############
############   Distribution tests   #############
# Zero adjusted beta negative binomial: ZABNB() #
#################################################

## Context
testthat::context("ZABNB 2")

## Seed
set.seed(111)

## Family
fam <- ZABNB()

## Random Values
i <- 0.5
n <- 1e4
mu <- 1 + i
sigma <- 0.1 + i
nu <- 1 + i
tau <- 0.1 + i
rvec <- rZABNB(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau) 

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp / vx_theo - 1) < 0.08) # converges for higher n  



