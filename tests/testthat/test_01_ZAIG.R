############################################
#########     gamlss.dist        ###########
#########   Distribution tests 2 ###########
## Zero adjusted Inverse Gaussian: ZAIG() ##
############################################

## Context
testthat::context("ZAIG 2")

## Seed
set.seed(2345)

## Family
fam <- ZAIG()

## Random Values
i <- 0.5
n <- 1e4    # a larger sample size gives uniroot errors
mu <- 1 + i
sigma <- 1 + i
nu <- 0.1 + i
rvec <- rZAIG(n, mu, sigma, nu)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.23)

