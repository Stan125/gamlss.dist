#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
# Pareto type 2 original: PARETO2o()  #
#######################################

## Context
testthat::context("PARETO2o")

## Seed
set.seed(222)

## Family
fam <- PARETO2o()

## Random Values
mu <- 1
sigma <- 0.5
n <- 1e6  # default is 1e6, smaller sample if loading takes too long
rvec <- rPARETO2o(n, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here
dev = ifelse(n >= 1e6, 0.02, ifelse(n >= 1e5, 0.035, 0.05)) # larger deviation possible, if sample smaller
expect_true(abs(ex_emp - ex_theo) < dev)  #wrong
expect_true(abs(vx_emp - vx_theo) < dev)  #wrong

## Mistake: sigma cannot be smaller than 2!! ##



## Example where sigma = 5

## Context
testthat::context("PARETO2o")

## Seed
set.seed(222)

## Family
fam <- PARETO2o()

## Random Values
mu <- 1
sigma <- 5
n <- 1e6  # default is 1e6, smaller sample if loading takes too long
rvec <- rPARETO2o(n, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here
dev = ifelse(n >= 1e6, 0.02, ifelse(n >= 1e5, 0.035, 0.05)) # larger deviation possible, if sample smaller
expect_true(abs(ex_emp - ex_theo) < dev)  
expect_true(abs(vx_emp - vx_theo) < dev)  