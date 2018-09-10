#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######      Gamma: GA()       ########
#######################################

## Context
testthat::context("GA")

## Seed
set.seed(222)

## Family
fam <- GA()

## Random Values
mu <- 1
sigma <- 1
rvec <- rGA(1e6, mu, sigma) 

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here 
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01)  