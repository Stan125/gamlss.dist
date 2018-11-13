#########################################
########     gamlss.dist        #########
########   Distribution tests   #########
##  Beta first parameterization: BEo() ##
#########################################

## Context
testthat::context("BEo")

## Seed
set.seed(247)

## Family
fam <- BEo()

## Random Values
n <- 1e6
mu <- 0.5
sigma <- 0.2
rvec <- rBEo(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)

