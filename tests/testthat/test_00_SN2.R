#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
##### Skew normal type 2: SN2()  ######
#######################################

## Context
testthat::context("SN2")

## Seed
set.seed(222)

## Family
fam <- SN2()

## Random Values
mu <- 0
sigma <- 1
nu <- 2
rvec <- rSN2(1e6, mu, sigma, nu) 

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01) 