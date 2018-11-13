######################################
#######     gamlss.dist        #######
#######   Distribution tests   #######
## Negative binomial type 1: NBI()  ##
######################################

## Context
testthat::context("NBI")

## Seed
set.seed(228)

## Family
fam <- NBI()

## Random Values
n <- 1e6
mu <- 1 
sigma <- 1
rvec <- rNBI(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 