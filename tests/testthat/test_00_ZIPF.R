##################################
#####     gamlss.dist        #####
#####   Distribution tests   #####
#####      Zipf: ZIPF()      #####
##################################

## Context
testthat::context("ZIPF")

## Seed
set.seed(221)

## Family
fam <- ZIPF()

## Random Values
n <- 1e4
mu <- 1   # for mu <= 2 the variance goes to Inf, mu needs to be respecified
rvec <- rZIPF(n, mu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu)
vx_theo <- fam$variance(mu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)


### Test for mu = 5

## Random Values
n <- 1e4
mu <- 5
rvec <- rZIPF(n, mu) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu)
vx_theo <- fam$variance(mu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)

