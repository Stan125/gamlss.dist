##################################
#####     gamlss.dist        #####
#####   Distribution tests   #####
### Generalised Poisson: GPO() ###
##################################

## Context
testthat::context("GPO")

## Seed
set.seed(218)

## Family
fam <- GPO()

## Random Values
n <- 1e5
mu <- 1 
sigma <- 1
rvec <- rGPO(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) # test is not very robust