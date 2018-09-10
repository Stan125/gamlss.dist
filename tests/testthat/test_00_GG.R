#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
####  Generalized gamma: GG()  ######
#######################################

## Context
testthat::context("GG")

## Seed
set.seed(222)

## Family
fam <- GG()

## Random Values
mu <- 1
sigma <- 0.5
nu <- 1
n <- 1e6  # default is 1e6, smaller sample if loading takes too long
rvec <- rGG(n, mu, sigma, nu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)   
