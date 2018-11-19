#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
#######      Gamma: GA()       ########
#######################################

## Context
testthat::context("GA")

## Seed
set.seed(222)

## Family
fam <- GA()

## Random Values
i <- 0.5
mu <- 1 + i
sigma <- 1 + i
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