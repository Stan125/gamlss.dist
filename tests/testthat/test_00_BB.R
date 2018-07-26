#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######   Beta-Binomial: BB()  ########
#######################################

## Context
testthat::context("BB")

## Seed
set.seed(325)

## Family
fam <- BB()

## Random Values
mu <- 0.5
sigma <- 1
rvec <- rBB(1e4, mu, sigma)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.1)
expect_true(abs(vx_emp - vx_theo) < 0.1)


