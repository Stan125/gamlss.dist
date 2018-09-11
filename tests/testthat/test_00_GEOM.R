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
n <- 1e6
mu <- 2
rvec <- rGEOM(n, mu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu),3)
vx_theo <- round(fam$variance(mu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) # wrong if set.seed(225)