#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
####### t family type 2: TF2() ########
#######################################

## Context
testthat::context("TF2")

## Seed
set.seed(222)

## Family
fam <- TF2()

## Random Values
i <- 1
mu <- 0 + i
sigma <- 1 + i
nu <- 10 + i
rvec <- rTF2(1e6, mu, sigma, nu) 

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.01) 