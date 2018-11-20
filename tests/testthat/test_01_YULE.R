########################################
#######     gamlss.dist        #########
#######   Distribution tests 2 #########
#######      Yule: YULE()      #########
########################################

## Context
testthat::context("YULE")

## Seed
set.seed(236)

## Family
fam <- YULE()

## Random Values
i <- 0.15
n <- 1e5
mu <- 0.1 + i
rvec <- rYULE(n, mu)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu)
vx_theo <- fam$variance(mu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 