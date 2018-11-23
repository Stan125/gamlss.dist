#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
# Second parametr. of Weibull: WEI2() #
#######################################

## Context
testthat::context("WEI2 2")

## Seed
set.seed(222)

## Family
fam <- WEI2()

## Random Values
i <- 1
mu <- 1 + i
sigma <- 1 + i
n <- 1e6  
rvec <- rWEI2(n, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  
