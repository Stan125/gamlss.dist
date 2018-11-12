##########################################
#########      gamlss.dist       #########
#########   Distribution tests   #########
#####  Zero adjusted Poisson: ZAP()  #####
##########################################

## Context
testthat::context("ZAP")

## Seed
set.seed(245)

## Family
fam <- ZAP()

## Random Values
n <- 1e5
mu <- 5
sigma <- 0.1
rvec <- rZAP(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 

