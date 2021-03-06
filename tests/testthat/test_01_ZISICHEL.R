########################################
#######       gamlss.dist      #########
#######   Distribution tests   #########
##  Zero inflated Sichel: ZISICHEL()  ##
########################################

## Context
testthat::context("ZISICHEL 2")

## Seed
set.seed(492)

## Family
fam <- ZISICHEL()

## Random Values
i <- 0.2
n <- 1e5
mu <- 1 + i
sigma <- 1 + i  
nu <- 0.5 + i
tau <- 0.1 + i
rvec <- rZISICHEL(n, mu, sigma, nu, tau) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau)
vx_theo <- fam$variance(mu, sigma, nu, tau) 

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 

