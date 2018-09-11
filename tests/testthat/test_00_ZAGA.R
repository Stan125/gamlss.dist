########################################
#######     gamlss.dist        #########
#######   Distribution tests   #########
#####  Zero adjusted gamma: ZAGA() #####
########################################

## Context
testthat::context("ZAGA")

## Seed
set.seed(222)

## Family
fam <- ZAGA()

## Random Values
n <- 1e6
mu <- 1
sigma <- 1
nu <- 0.1
rvec <- rZAGA(n, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  
