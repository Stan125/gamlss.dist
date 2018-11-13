##################################
#####     gamlss.dist        #####
#####   Distribution tests   #####
#####    Waring: WARING()    #####
##################################

## Context
testthat::context("WARING")

## Seed
set.seed(245)

## Family
fam <- WARING()

## Random Values
n <- 1e5
mu <- 2 
sigma <- 2 # sigma needs to be respecified, if sigma >= 1 the variance goes to Inf
rvec <- rWARING(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 



### Test for sigma = 0.1

## Random Values
n <- 1e5
mu <- 2 
sigma <- 0.1
rvec <- rWARING(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 