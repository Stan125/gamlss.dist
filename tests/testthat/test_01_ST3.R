#########################################
#######     gamlss.dist        ##########
#######   Distribution tests 2 ##########
##### Skew Student t type 3: ST3() ######
#########################################

## Context
testthat::context("ST3")

## Seed
set.seed(268)

## Family
fam <- ST3()

## Random Values
i <- 1
n <- 1e6
mu <- 0 + i
sigma <- 1 + i
nu <- 1 + i
tau <- 10 + i
rvec <- rST3(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)

