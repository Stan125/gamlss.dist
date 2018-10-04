########################################
#######     gamlss.dist        #########
#######   Distribution tests   #########
#######      Yule: YULE()   #########
########################################

## Context
testthat::context("YULE")

## Seed
set.seed(236)

## Family
fam <- YULE()

## Random Values
n <- 1e5
mu <- 2    # R documentation for YULE distribution reports mu = 2, although the variance approaches Inf if mu >= 1
rvec <- rYULE(n, mu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu),3)
vx_theo <- round(fam$variance(mu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 


## test for mu = 0.1, mu has to be smaller than 1/3, otherwise the kurtosis = Inf

## Random Values
n <- 1e5
mu <- 0.1
rvec <- rYULE(n, mu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu),3)
vx_theo <- round(fam$variance(mu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) # works