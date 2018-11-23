########################################
#######     gamlss.dist        #########
#######   Distribution tests 2 #########
#####  Zero adjusted gamma: ZAGA() #####
########################################

## Context
testthat::context("ZAGA 2")

## Seed
set.seed(222)

## Family
fam <- ZAGA()

## Random Values
i <- 0.5
n <- 1e6
mu <- 1 + i
sigma <- 1 + i
nu <- 0.1 + i
rvec <- rZAGA(n, mu, sigma, nu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  
