library(forecast)
library(tidyverse)
library(tibbletime)
library(tseries)
library(urca)
library(gridExtra)

## Series to compare
# empl_manuf <- read_csv("empl_manuf.csv")
# empl <- ts(empl_manuf, start = c(1992, 1), freq = 12)
# train = window(empl, end = c(2001,12))
# fit1 <- Arima(train, order = c(3,2,4),
#               seasonal = c(0,0,1))
# fore1 <- forecast(fit1, h = 24)
# fit2 <- auto.arima(train)
# fore2 <- forecast(fit1, h = 24)
# options(digits = 3)
# accuracy(fore1, empl)
# accuracy(fore2, empl)

## Example: code
# set.seed(500)
# y4 <- arima.sim(model = list(order = c(4,1,4), ar = c(0.3, -0.4,0,-0.2), ma = c(0.8,0,0,0.5), mean = 2), 
#                  n = 300)
# for1 <- meanf(y4, h = 50)
# for2 <- naive(y4, h = 50)
# for3 <- rwf(y4, drift = TRUE, h = 50)
# plot(y4, xlim = c(1,350))
# lines(for1$mean,col = 4)
# lines(for2$mean, col = 2)
# lines(for3$mean, col = 3)
# legend("bottomleft",lty=1,col=c(4,2,3),
#           legend=c("Mean method","Naive method","Drift method"))

#        
## Simple forecasts: an alternative code
# fit1 <- Arima(y4, order = c(0,0,0), include.constant = TRUE)          
# fit2 <- Arima(y4, order = c(0,1,0))
# fit3 <- Arima(y4, order = c(0,1,0), include.drift = TRUE)
# fore1 <- forecast(fit1, h = 24)
# fore2 <- forecast(fit2, h = 24)
# fore3 <- forecast(fit3, h = 24)
# plot(y4, xlim = c(1,350))
# lines(fore1$mean, col = 4)
# lines(fore2$mean, col = 2)
# lines(fore3$mean, col = 3)
# legend("bottomleft",lty = 1,col=c(4,2,3),
#        legend = c("WN+const","RW","RW with drift"))



## Application: a nominal exchange rate

# ner <- read_csv("nominal_ER1.csv")
# ner <- ts(ner, start = c(1994, 10), freq = 12)
# train <- subset(ner, end = length(ner) - 24)
# autoplot(train)
# autoplot(diff(train))
# adf_ner <- ur.df(diff(ner), lags = 12, selectlags = 'BIC', type = 'drift')
# summary(adf_ner)
# kpss_ner <-ur.kpss(diff(ner),type = "mu", lags = 'long')
# summary(kpss_ner)
# ggAcf(diff(train))
# ggPacf(diff(train))
# a <- rep(0, times = 16)
# A <- matrix(a, nrow = 4)
# for (i in 1:4) {
#   for (j in 1:4) {
# model <-  Arima(train, order = c(i,1,j), include.drift = TRUE)
# A[i,j] <- model$aicc
#   }
#     }
# fit_ner <- Arima(train, order = c(1,1,2), include.drift = TRUE)  
# autoplot(residuals(fit_ner))
# ggAcf(residuals(fit_ner))
# ggPacf(residuals(fit_ner))
# Box.test(residuals(fit_ner), lag = 24, fitdf = 4, type = 'Ljung')
# jarque.bera.test(residuals(fit_ner))
# fore_arima <- forecast(fit_ner, h = 24)
# autoplot(fore_arima) + ylab("")
# fore_rw <- rwf(train, h = 24)
# fore_rwd <- rwf(train, drift = TRUE, h = 24)  
# accuracy(fore_arima, ner)
# accuracy(fore_rw, ner)
# accuracy(fore_rwd, ner)
# f_arima_ts <- fore_arima$mean
# f_rw_ts <- fore_rw$mean
# f_rwd_ts <- fore_rwd$mean
# all_ts <- ts.union(ner, f_arima_ts, f_rw_ts, f_rwd_ts )
# autoplot(all_ts)


## Cross-validation example
# It is necessary to create a forecasting function first
# fore_arima_112 <- function(y, h) {
#   model <- Arima(y, order = c(1, 1, 2), include.drift = TRUE)
#   forecast <- forecast(model, h)
#   return(forecast)
# }
# errors_cv <- tsCV(ner, fore_arima_112, h = 1)
# errors_cv


## VAR estimation: example
# library(fpp)
# library(vars)
# data(usconsumption, package = "fpp")
# head(usconsumption)
# VARselect(usconsumption, lag.max=7, type = "const")
# VARselect(usconsumption, lag.max = 7, type = "const")$selection
# var <- VAR(usconsumption, p = 1, type = "const")
# summary(var)
