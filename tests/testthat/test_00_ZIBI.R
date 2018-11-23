####################################
######     gamlss.dist        ######
######   Distribution tests   ######
## Zero inflated binomial: ZIBI() ##
####################################

## Context
testthat::context("ZIBI")

## Seed
set.seed(241)

## Family
fam <- ZIBI()

## Random Values
n <- 1e4
mu <- 0.5
sigma <- 0.1
rvec <- rZIBI(n, bd = n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(n, mu, sigma)
vx_theo <- fam$variance(n, mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp / ex_theo - 1) < 0.02)  
expect_true(abs(vx_emp / vx_theo - 1) < 0.02) 
