#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
######  Inverse Gaussian: IG()  #######
#######################################

## Context
testthat::context("IG 2")

## Seed
set.seed(132)

## Family
fam <- IG()

## Random Values
i <- 0.5
mu <- 1 + i
sigma <- 1 + i
n <- 1e5  
rvec <- rIG(n, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.03) # it converges once you take a higher sample size, so we can be a little more lenient here
