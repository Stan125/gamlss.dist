########################################
#######     gamlss.dist        #########
#######   Distribution tests   #########
#######    Geometric: GEOM()   #########
########################################

## Context
testthat::context("GEOM")

## Seed
set.seed(225)

## Family
fam <- GEOM()

## Random Values
n <- 1e7
mu <- 2
rvec <- rGEOM(n, mu)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu)
vx_theo <- fam$variance(mu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)
