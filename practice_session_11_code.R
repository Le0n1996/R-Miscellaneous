library(vars)
library(tidyverse)
library(readxl)
library(forecast)
library(gridExtra)
library(scatterplot3d)
library(lattice)
source("plot_irf.R")


## SVAR with short-run restrictions
qrm_data <- read_excel("qrm_data.xlsx")
qrm_ts <- ts(qrm_data, start = c(1970, 1), frequency = 4)
var_qrm <- VAR(qrm_ts, p = 4, type = "both")
amat <- diag(3)
amat[1,2] = NA
amat[2,1] = NA
amat[2,3] = NA
bmat <- diag(3)
diag(bmat) = NA
svar_islm <- SVAR(var_qrm, Amat = amat, Bmat = bmat)

## SVAR Example: A and B estimates 

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
var_bq <- VAR(bq_ts, p = 8, type = "const")
svar_bq = BQ(var_bq)
svar_bq$B
svar_bq$LRIM

## IRFs for BQ(1989) model:code

irf_bq_QQ <- irf(svar_bq, n.ahead = 40, cumulative =
                   TRUE,response = c("dQ"),impulse =c("dQ")) 
irf_bq_uQ <- irf(svar_bq, n.ahead = 40, cumulative =
                   TRUE,response = c("dQ"),impulse =c("u")) 

par(mfrow = c(2,1))
plotIRF(irf_bq_QQ, vlabels = "Real Output", 
        slabels = "supply shock")
plotIRF(irf_bq_uQ, vlabels = "Real Output", 
        slabels = "demand shock")

## IRFs for BQ(1989) model:code(2)

irf_bq_Qu <- irf(svar_bq, n.ahead = 40, 
                 response = "u",impulse ="dQ")
irf_bq_uu <- irf(svar_bq, n.ahead = 40, 
                 response = "u",impulse = "u") 
par(mfrow = c(2,1))
plotIRF(irf_bq_Qu, vlabels = "Unemployment", 
        slabels = "supply shock")
plotIRF(irf_bq_uu, vlabels = "Unemployment", 
        slabels = "demand shock")


## Forward-error variance decomposition
fevd_bq  <- fevd(svar_bq, n.ahead = 12)

## Example:Uhlig(2005)
library(VARsignR)
data(uhligdata)

## Constraints and estimation
constr <- c(+4,-3,-2,-5)
model1 <- uhlig.reject(Y = uhligdata, nlags = 12, 
                       nkeep = 1000, KMIN = 1, 
                       KMAX = 6, constrained = constr,
                       constant = FALSE, steps = 60)

## Impulse response functions 
irfs1 <- model1$IRFS
vl <- c("GDP","GDP Deflator","Comm.Pr.Index",
        "Fed Funds Rate", "NB Reserves", "Total Reserves")
irfplot(irfdraws = irfs1, type = "median", labels = vl, 
        save = FALSE, bands = c(0.16, 0.84), grid = TRUE,
        bw = FALSE)

## Forward error variance decomposition 

fevd1 <- model1$FEVDS
fevd.table <- fevdplot(fevd1, table = TRUE, label = vl, 
                       periods = c(1,10,20,30,40,50,60))
print(fevd.table)


## Cointegration: idea(2)

T <- 200
u2 <- rnorm(T, mean = 0, sd = 2)
u3 <- rnorm(T, mean = 0, sd = 3)
r1 <- arima.sim(n = T - 1, model = list(order = c(1,1,0), ar = 0.6))
r2 <- 3 + 0.8*r1 + u2
r3 <- -4 + 1.2*r1 + u3
all_r <- tibble(r1 = r1, r2 = r2, r3 = r3, time = 1:T)

## Cointegration: idea(3)
plot2d <- autoplot(cbind(r1,r2,r3))
plot3d <- cloud(data = all_r, r3 ~ r1 * r2)
grid.arrange(plot2d, plot3d, ncol = 2, top = "Cointegrated I(1) series")
