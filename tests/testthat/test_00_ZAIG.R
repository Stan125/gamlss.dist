############################################
#########     gamlss.dist        ###########
#########   Distribution tests   ###########
## Zero adjusted Inverse Gaussian: ZAIG() ##
############################################

## Context
testthat::context("ZAIG")

## Seed
set.seed(221)

## Family
fam <- ZAIG()

## Random Values
n <- 500    # a larger sample size gives uniroot errors
mu <- 1
sigma <- 1
nu <- 0.1
rvec <- rZAIG(n, mu, sigma, nu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  # wrong, but small sample size needs to be considered
