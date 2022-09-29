library(fpp)
library(vars)
library(tidyverse)
library(readxl)

data(usconsumption, package = "fpp")
head(usconsumption)

## Impulse response functions: code
var3 <- VAR(usconsumption, p = 3, type = "const")
irf3 <- irf(var3, impulse = "consumption", response = c("consumption",
        "income"), n.ahead = 20, cumulative = TRUE)
plot(irf3)

## Forward error variance decomposition
fevd(var3, n.ahead = 4)

## Change of ordering 
usconsumption2 <- usconsumption[, c("income","consumption")]
head(usconsumption2)
var3a <- VAR(usconsumption2, p = 3, type = "const")
irf3a <- irf(var3a, impulse = "consumption", response = c("consumption", 
        "income"), n.ahead = 20, cumulative = TRUE)
plot(irf3a)

## FEVD with alternative ordering
fevd(var3a, n.ahead = 4)

## SVAR example: defining Amat
qrm_data <- read_excel("qrm_data.xlsx")
qrm_ts <- ts(qrm_data, start = c(1970, 1), frequency = 4)
var_qrm <- VAR(qrm_ts, p = 4, type = "both")
amat <- diag(3)
amat 
amat[1,2] = NA
amat[2,1] = NA
amat[2,3] = NA
amat

## SVAR example: defining Bmat
bmat <- diag(3)
diag(bmat) = NA
bmat
svar_islm <- SVAR(var_qrm, Amat = amat, Bmat = bmat)

## SVAR example: A and B estimates
svar_islm[["A"]]
svar_islm[["B"]]
svar_islm$A
svar_islm$B

##Impulse response functions: IS shock
irf_o <- irf(svar_islm, n.ahead = 48, impulse = "output")
plot(irf_o)

##Impulse response functions: money supply shock
irf_m <- irf(svar_islm, n.ahead = 48, impulse = "money")
plot(irf_m)

## FEVD for IS-LM model
fevd(svar_islm, n.ahead = 12)

#Blanchard and Quah (1989) model
bq_data <- read_excel("bq_data.xlsx")
bq_ts <- ts(bq_data, start = c(1948, 2), freq = 4)
var_bq <-VAR(bq_ts, p = 8, type = "const")
svar_bq = BQ(var_bq)
svar_bq[["B"]]
svar_bq[["LRIM"]]


