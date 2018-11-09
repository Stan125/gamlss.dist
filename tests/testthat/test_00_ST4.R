#########################################
#######     gamlss.dist        ##########
#######   Distribution tests   ##########
##### Skew Student t type 4: ST4() ######
#########################################

## Context
testthat::context("ST4")

## Seed
set.seed(241)

## Family
fam <- ST4()

## Random Values
n <- 1e6
mu <- 0
sigma <- 1
nu <- 1   # if nu = 1 the denominator in the theo mean fct becomes 0, nu needs to be respecified
tau <- 10
rvec <- rST4(n, mu, sigma, nu, tau) # 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau) 
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)



## Change nu to nu = 10

## Random Values
n <- 1e6
mu <- 0
sigma <- 1
nu <- 10
tau <- 10
rvec <- rST4(n, mu, sigma, nu, tau) # 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau) 
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)



