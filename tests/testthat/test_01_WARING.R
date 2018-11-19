##################################
#####     gamlss.dist        #####
#####   Distribution tests 2 #####
#####    Waring: WARING()    #####
##################################

## Context
testthat::context("WARING")

## Seed
set.seed(278)

## Family
fam <- WARING()

## Random Values
i <- 0.15
n <- 1e5
mu <- 2 + i
sigma <- 0.1 + i
rvec <- rWARING(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 