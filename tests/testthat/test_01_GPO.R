##################################
#####     gamlss.dist        #####
#####   Distribution tests 2 #####
### Generalised Poisson: GPO() ###
##################################

## Context
testthat::context("GPO 2")

## Seed
set.seed(183)

## Family
fam <- GPO()

## Random Values
i <- 0.5
n <- 1e5
mu <- 1 + i
sigma <- 1 + i
rvec <- rGPO(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)
expect_true(abs(vx_emp - vx_theo) < 0.9) # converges for higher n so it's ok in this case