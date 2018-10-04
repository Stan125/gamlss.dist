########################################
#######     gamlss.dist        #########
#######   Distribution tests   #########
#######    Logarithmic: LG()   #########
########################################

## Context
testthat::context("LG")

## Seed
set.seed(236)

## Family
fam <- LG()

## Random Values
n <- 1e4
mu <- 0.5
rvec <- rLG(n, mu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu),3)
vx_theo <- round(fam$variance(mu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) # wrong if set.seed(236)