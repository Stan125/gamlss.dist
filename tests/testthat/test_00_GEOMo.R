############################################
#########     gamlss.dist        ###########
#########   Distribution tests   ###########
# Original parametr. of geometric: GEOMo() #
############################################

## Context
testthat::context("GEOMo")

## Seed
set.seed(225)

## Family
fam <- GEOMo()

## Random Values
n <- 1e6
mu <- 0.5
rvec <- rGEOMo(n, mu)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu),3)
vx_theo <- round(fam$variance(mu),3)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02) 