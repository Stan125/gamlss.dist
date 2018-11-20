#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
#######      Logistic: LO()    ########
#######################################

## Context
testthat::context("LO")

## Seed
set.seed(321)

## Family
fam <- LO()

## Random Values
i <- 1
mu <- 0 + i
sigma <- 2 + i
rvec <- rLO(1e7, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 2)
vx_emp <- round(var(rvec), 2)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma), 2)
vx_theo <- round(fam$variance(mu, sigma), 2)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)

