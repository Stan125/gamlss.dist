#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
#######     Poisson: PO()      ########
#######################################

## Context
testthat::context("PO")

## Seed
set.seed(328)

## Family
fam <- PO()

## Random Values
i <- 1
mu <- 0.5 + i
rvec <- rPO(1e4, mu)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu)
vx_theo <- fam$variance(mu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)
expect_true(abs(vx_emp - vx_theo) < 0.02)


