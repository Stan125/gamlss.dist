#########################################
#######     gamlss.dist        ##########
#######   Distribution tests 2 ##########
##### Skew Student t type 5: ST5() ######
#########################################

## Context
testthat::context("ST5 2")

## Seed
set.seed(248)

## Family
fam <- ST5()

## Random Values
i <- 0.2
n <- 1e6
mu <- 0 + i
sigma <- 1 + i
nu <- 0 + i
tau <- 0.5 + i
rvec <- rST5(n, mu, sigma, nu, tau) 

# vars <- c()
# for (i in 1:1000) {
#   cat(paste0(i, "\n"))
#   vars[i] <- var(rST5(n, mu, sigma, nu, tau))
# }
# vx_emp <- mean(vars)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu, tau) 
vx_theo <- fam$variance(mu, sigma, nu, tau)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)



