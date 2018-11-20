#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
#######      Weibull: WEI()    ########
#######################################

## Context
testthat::context("WEI")

## Seed
set.seed(222)

## Family
fam <- WEI()

## Random Values
i <- 1
mu <- 1 + i
sigma <- 1 + i
n <- 1e6  
rvec <- rWEI(n, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here

expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  
