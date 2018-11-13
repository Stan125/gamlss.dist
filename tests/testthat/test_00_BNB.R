#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
###  Beta negative binomial: BNB()  ###
#######################################

## Context
testthat::context("BNB")

## Seed
set.seed(231)

## Family
fam <- BNB()

## Random Values
n <- 1e4  
mu <- 1  
sigma <- 1  # sigma needsto be respecified. If sigma >= 1 the variance goes to Inf
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
expect_true(abs(vx_emp - vx_theo) < 0.02)


### Test for sigma = 0.1


## Random Values
n <- 1e4  
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
expect_true(abs(vx_emp - vx_theo) < 0.02) # no convergence
