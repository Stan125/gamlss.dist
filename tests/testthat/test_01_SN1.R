#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
##### Skew normal type 1: SN1()  ######
#######################################

## Context
testthat::context("SN1")

## Seed
set.seed(333)

## Family
fam <- SN1()

## Random Values
i <- 1
mu <- 0 + i
sigma <- 1 + i
nu <- 0 + i
rvec <- rSN1(1e3, mu, sigma, nu)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.02) 
expect_true(abs(vx_emp - vx_theo) < 0.02) 
