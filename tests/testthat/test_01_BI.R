################################
####       gamlss.dist      ####
####   Distribution tests 2 ####
####      Binomial: BI()    ####
################################

## Context
testthat::context("BI 2")

## Seed
set.seed(401)

## Family
fam <- BI()

## Random Values
i <- 0.2
n <- 1e4
mu <- 0.5 + i
rvec <- rBI(n, n, mu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(n, mu)
vx_theo <- fam$variance(n, mu) 

## Test here if they are about the same
expect_true(abs(ex_emp / ex_theo - 1) < 0.02)  
expect_true(abs(vx_emp / vx_theo - 1) < 0.02)  

