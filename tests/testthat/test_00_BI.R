################################
####       gamlss.dist      ####
####   Distribution tests   ####
####      Binomial: BI()    ####
################################

## Context
testthat::context("BI")

## Seed
set.seed(401)

## Family
fam <- BI()

## Random Values
n <- 1e2
mu <- 0.5
rvec <- rBI(n, n, mu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(n, mu)
vx_theo <- fam$variance(n, mu) 

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 

