#######################################
#######     gamlss.dist        ########
#######   Distribution tests 2 ########
#####   Inverse gamma: IGAMMA()  ######
#######################################

## Context
testthat::context("IGAMMA")

## Seed
set.seed(222)

## Family
fam <- IGAMMA()

## Random Values
i <- -0.2
mu <- 1 + i
sigma <- 0.5 + i
rvec <- rIGAMMA(1e6, mu, sigma) 

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here 
expect_true(abs(ex_emp - ex_theo) < 0.01)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  
