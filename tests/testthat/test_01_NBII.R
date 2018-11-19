######################################
#######     gamlss.dist        #######
#######   Distribution tests 2 #######
## Negative binomial type 2: NBII() ##
######################################

## Context
testthat::context("NBII")

## Seed
set.seed(208)

## Family
fam <- NBII()

## Random Values
i <- 1
n <- 1e6
mu <- 1 + i
sigma <- 1 + i
rvec <- rNBII(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 