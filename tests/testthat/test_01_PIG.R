######################################
#######     gamlss.dist        #######
#######   Distribution tests 2 #######
## Poisson inverse Gaussian: PIG()  ##
######################################

## Context
testthat::context("PIG")

## Seed
set.seed(229)

## Family
fam <- PIG()

## Random Values
i <- 1
n <- 1e5
mu <- 1 + i
sigma <- 1 + i
rvec <- rPIG(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.2) # also converges for higher n, so its ok to leave it here