#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
####  Zero inflated Poisson: ZIP()  ###
#######################################

## Context
testthat::context("ZIP 2")

## Seed
set.seed(251)

## Family
fam <- ZIP()

## Random Values
i <- 0.5
n <- 1e6  
mu <- 5 + i
sigma <- 0.1 + i
rvec <- rZIP(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)


