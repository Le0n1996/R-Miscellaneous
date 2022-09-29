#library(forecast)
#library(tidyverse)
#library(tseries)
#library(urca)

# ## tseries:: kpss.test
# y3 <- arima.sim(model = list(ar = c(1.3,  -0.4),
#                              order = c(2,1,0)), n = 1000)
# kpss.test(y3, null = "Trend", lshort = TRUE)


# ## urca:: ur.kpss
# empl_manuf <- read_csv("empl_manuf.csv")
# empl <- ts(empl_manuf, start = c(1992, 1), freq = 12)
# kpss_y3 <- ur.kpss(y3, type = "tau", lags = "short")
# summary(kpss_y3)

# ## KPSS test for a real series (1)
# kpss_empl0 <- ur.kpss(empl, type = "tau", lags = "short")
# summary(kpss_empl0)

# ## KPSS test for a real series (2)
# kpss_empl1 <- ur.kpss(diff(empl), type = "mu", 
#                       lags = "short")
# summary(kpss_empl1)

# kpss_empl2 <- ur.kpss(diff(diff(empl)), type = "mu", 
#                       lags = "short")
# summary(kpss_empl2)
# 

# ## Box-Cox transformation: code
# w = log(empl)
# plot1 <- autoplot(w)+ylab("")
# plot2 <- autoplot(BoxCox(empl, lambda = 0))+ylab("")
# grid.arrange(plot1, plot2, ncol = 2)

# ## Portmanteau test: code
# y <- arima.sim(model = list(ar = c(0.5,  0.4), ma = 0.4, 
#                              order = c(2,0,1), mean = 3), n = 200)
# autoplot(y)
# fit <- Arima(y,order = c(2,0,1), include.constant = TRUE)
# ggAcf(residuals(fit))
# Box.test(residuals(fit), lag = 24, fitdf = 3, type = 'Ljung')

# ##Forecasts: code(1) 
# forecast(fit, h = 12, level = 95)
# autoplot(forecast(fit, h=24)) + ylab("")

# ## Test for nonnormality: code 
# jarque.bera.test(residuals(fit))


# ## Example with Seasonal ARIMA
# autoplot(diff(empl))
# ggAcf(diff(empl))
# autoplot(diff(diff(empl)))
# ggAcf(diff(diff(empl)))
# ggPacf(diff(diff(empl)))  
# fit1 <- Arima(empl, order = c(3,2,4), seasonal = c(0,0,1))          
# summary(fit1)
# autoplot(residuals(fit1))
# ggAcf(residuals(fit1))
# ggPacf(residuals(fit1))
# ur_test1 <- ur.df(diff(diff(lempl)), type = "none",
#                   lags = 12, selectlags = "BIC")
# summary(ur_test1)
# kpss_test1 <- ur.kpss(diff(diff(lempl)))
# summary(kpss_test1)
# Box.test(residuals(fit1), lag = 24, fitdf = 4, type = 'Ljung')
# jarque.bera.test(residuals(fit1))
# autoplot(forecast(fit1, h = 24)) + ylab("")
# 
# autoplot(empl)         
# fit2 <- auto.arima(empl)         
# summary(fit2)
# autoplot(residuals(fit2))
# ggAcf(residuals(fit2))
# ggPacf(residuals(fit2))
# ur_test1 <- ur.df(diff(diff(empl)), type = "none",
#                   lags = 12, selectlags = "BIC")
# summary(ur_test1)
# kpss_test1 <- ur.kpss(diff(diff(empl)))
# summary(kpss_test1)
# Box.test(residuals(fit2), lag = 24, fitdf = 4, type = 'Ljung')
# jarque.bera.test(residuals(fit2))
# autoplot(forecast(fit2, h = 24)) + ylab("")
         

