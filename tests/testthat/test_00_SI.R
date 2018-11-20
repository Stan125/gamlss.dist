################################
####       gamlss.dist      ####
####   Distribution tests   ####
####   Sichel type 2: SI()  ####
################################

## Context
testthat::context("SI")

## Seed
set.seed(278)

## Family
fam <- SI()

## Random Values
n <- 1e4
mu <- 0.5
sigma <- 0.02
nu <- -0.5
rvec <- rSI(n, mu, sigma, nu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  
