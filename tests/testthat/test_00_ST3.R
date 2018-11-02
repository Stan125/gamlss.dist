#########################################
#######     gamlss.dist        ##########
#######   Distribution tests   ##########
##### Skew Student t type 2: ST3() ######
#########################################

## Context
testthat::context("ST3")

## Seed
set.seed(241)

## Family
fam <- ST3()

## Random Values
n <- 1e5
mu <- 0
sigma <- 1
nu <- 1
tau <- 10
rvec <- rST3(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)

