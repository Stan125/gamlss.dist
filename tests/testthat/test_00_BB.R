#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######   Beta-Binomial: BB()  ########
#######################################

## Context
testthat::context("BB")

## Skip this test - currently not important
testthat::skip("Currently not available")

## Seed
set.seed(325)

## Family
fam <- BB()

## Random Values
mu <- 0.5
sigma <- 1
n <- 1e6
bd <- 10
rvec <- rBB(n, mu, sigma, bd = bd)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(bd, mu, sigma)
vx_theo <- fam$variance(bd, mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)
expect_true(abs(vx_emp - vx_theo) < 0.02)


