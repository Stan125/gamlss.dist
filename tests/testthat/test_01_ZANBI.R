############################################
##########       gamlss.dist      ##########
##########   Distribution tests   ##########
# Zero adjusted negative binomial: ZANBI() #
############################################

## Context
testthat::context("ZANBI 2")

## Seed
set.seed(142)

## Family
fam <- ZANBI()

## Random Values
i <- 0.5
n <- 1e6
mu <- 1 + i
sigma <- 1 + i
nu <- 0.3 + i
rvec <- rZANBI(n, mu, sigma, nu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  
