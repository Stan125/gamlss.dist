#########################################
#######     gamlss.dist        ##########
#######   Distribution tests   ##########
##### Skew Student t type 2: ST2() ######
#########################################

## Context
testthat::context("ST2")

## Seed
set.seed(241)

## Family
fam <- ST2()

## Random Values
n <- 1e6
mu <- 0
sigma <- 1
nu <- 0
tau <- 2
rvec <- rST2(n, mu, sigma, nu, tau) # if tau = 2, the denominator in the variance term cannot be calculated some other problems arise as well

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)


### Set tau = 10

## Random Values
n <- 1e3
mu <- 0
sigma <- 1
nu <- 0
tau <- 10
rvec <- rST2(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)

