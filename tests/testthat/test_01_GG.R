#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
####  Generalized gamma: GG()  ######
#######################################

## Context
testthat::context("GG")

## Seed
set.seed(222)

## Family
fam <- GG()

## Random Values
i <- 1
mu <- 1 + i
sigma <- 0.5 + i
nu <- 1 + i
n <- 1e6  
rvec <- rGG(n, mu, sigma, nu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)   
