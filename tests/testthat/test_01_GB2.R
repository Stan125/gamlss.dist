########################################
########     gamlss.dist        ########
########   Distribution tests 2 ########
###  Generalized Beta type 2: GB2()  ###
########################################

## Context
testthat::context("GB2")

## Seed
set.seed(247)

## Family
fam <- GB2()

## Random Values
i <- 1
n <- 1e6
mu <- 1 + i
sigma <- 1 + i
nu <- 1 + i
tau <- 5 + i
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

