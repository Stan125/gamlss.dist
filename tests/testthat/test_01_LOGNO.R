########################################
#######     gamlss.dist        #########
#######   Distribution tests 2 #########
#######  Log normal: LOGNO()   #########
########################################

## Context
testthat::context("LOGNO")

## Seed
set.seed(224)

## Family
fam <- LOGNO()

## Random Values
i <- 0.2 
n <- 1e6
mu <- 0 + i
sigma <- 1 + i
rvec <- rLOGNO(n, mu, sigma)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)
