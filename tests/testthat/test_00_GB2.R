########################################
########     gamlss.dist        ########
########   Distribution tests   ########
###  Generalized Beta type 2: GB2()  ###
########################################

## Context
testthat::context("GB2")

## Seed
set.seed(247)

## Family
fam <- GB2()

## Random Values
n <- 1e6
mu <- 1
sigma <- 1
nu <- 1
tau <- 0.5   # the default for tau needs to be respecified, as the variance goes to Inf if tau <= 2/sigma
rvec <- rGB2(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)


### test for tau = 5


## Random Values
n <- 1e6
mu <- 1
sigma <- 1
nu <- 1
tau <- 5
rvec <- rGB2(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)

