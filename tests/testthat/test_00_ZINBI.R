############################################
##########       gamlss.dist      ##########
##########   Distribution tests   ##########
# Zero inflated negative binomial: ZINBI() #
############################################

## Context
testthat::context("ZINBI")

## Seed
set.seed(253)

## Family
fam <- ZINBI()

## Random Values
n <- 1e5
mu <- 1
sigma <- 1
nu <- 0.3
rvec <- rZINBI(n, mu, sigma, nu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu) 

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  
