#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
##### Skew normal type 1: SN1()  ######
#######################################

## Context
testthat::context("SN1")

## Seed
set.seed(222)

## Family
fam <- SN1()

## Random Values
mu <- 0
sigma <- 1
nu <- 0
rvec <- rSN1(1e3, mu, sigma, nu) # smaller sample to speed it up

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma, nu),3)
vx_theo <- round(fam$variance(mu, sigma, nu),3)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.01) # not true -> larger deviations between empirical and theoretical 
expect_true(abs(vx_emp - vx_theo) < 0.01) # not true -> larger deviations between empirical and theoretical 

## Test here for deviation smaller than 0.03
expect_true(abs(ex_emp - ex_theo) < 0.03)  
expect_true(abs(vx_emp - vx_theo) < 0.03) # not true -> larger deviations between empirical and theoretical 

## Test here for deviation smaller than 0.05
expect_true(abs(ex_emp - ex_theo) < 0.05)  
expect_true(abs(vx_emp - vx_theo) < 0.05) 

# ?critical value of deviation?
