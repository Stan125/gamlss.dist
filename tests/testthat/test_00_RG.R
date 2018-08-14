#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
#######  Reverse Gumbel: RG()  ########
#######################################

## Context
testthat::context("RG")

## Seed
set.seed(324)

## Family
fam <- RG()

## Random Values
mu <- 0
sigma <- 1
rvec <- rRG(1e6, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3 )

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)
expect_true(abs(vx_emp - vx_theo) < 0.01)

