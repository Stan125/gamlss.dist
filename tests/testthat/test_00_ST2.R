#########################################
#######     gamlss.dist        ##########
#######   Distribution tests   ##########
##### Skew Student t type 2: ST2() ######
#########################################

## Context
testthat::context("ST2")

## Seed
set.seed(234)

## Family
fam <- ST2()

## Random Values
n <- 2e4
mu <- 0
sigma <- 1
nu <- 0
tau <- 10
rvec <- rST2(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)

