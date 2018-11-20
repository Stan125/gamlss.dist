########################################
#######     gamlss.dist        #########
#######   Distribution tests 2 #########
## Third parametr. of Weibull: WEI3() ##
########################################

## Context
testthat::context("WEI3")

## Seed
set.seed(222)

## Family
fam <- WEI3()

## Random Values
i <- 1
n <- 1e6
mu <- 1 + i
sigma <- 1 + i
rvec <- rWEI3(n, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  
