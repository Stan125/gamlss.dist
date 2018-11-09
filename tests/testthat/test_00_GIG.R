###########################################
########     gamlss.dist        ###########
########   Distribution tests   ###########
### Generalized inverse Gaussian: GIG() ###
###########################################

## Context
testthat::context("GIG")

## Seed
set.seed(244)


## Family
fam <- GIG()

## Random Values
n <- 1e3  # small sample size to speed up loading
mu <- 1
sigma <- 1
nu <- 1
rvec <- rGIG(n, mu, sigma, nu ) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)


