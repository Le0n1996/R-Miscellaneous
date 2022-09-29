# library(tidyverse)
# rus_data <- read_csv("rus_data.csv")
# class(rus_data)
## rus_data <- select(rus_data, -time)
# rus_data_ts <- ts(rus_data, start = c(1995, 1), freq = 12)
# class(rus_data_ts)

# #Simulating AR(1) model
# ar1 <- arima.sim(model = list(ar = 0.8, order = c(1,0,0)), n = 200) 
# #Simulating ARMA(1,1) model
# arma11 <- arima.sim(model = list(ar = 0.4, ma = 0.5,order = c(1,0,1)), n = 200) 
# #Simulating MA(2) model
# ma2 <- arima.sim(model = list(ma = c(0.5, -0.3), order = c(0,0,2)), n = 200) 

# autoplot(cbind(ar1, arma11,ma2), facets = TRUE) + ylab('')
# library(forecast)
# ggAcf(ar1)
# ggPacf(ar1)

# ggAcf(ma2)
# ggPacf(ma2)

# ggAcf(arma11)
# ggPacf(arma11)

# wn <- arima.sim(model = list(order = c(0,0,0)), n = 200)
# ggAcf(wn)
# ggPacf(wn)

# US_inv <- read_csv("US_investment.dat")
# US_inv_ts <- ts(US_inv, start = c(1947, 2), freq = 4)
# #optional if we want to work with xts class
# #US_inv_xts_from_ts <- as.xts(US_inv_ts)

# autoplot(US_inv_ts) + ylab("") + ggtitle("US investment growth")
# ggAcf(US_inv_ts) + ggtitle("US investment growth")
# ggPacf(US_inv_ts) + ggtitle("US investment growth")

# Box.test(US_inv_ts, lag = 24, fitdf = 0, type = "Lj")
# Arima(US_inv_ts, order = c(2,0,3), include.constant = TRUE)
# Arima(US_inv_ts, order = c(4,0,4), include.constant = TRUE)
# Arima(US_inv_ts, order = c(5,0,5), include.constant = TRUE)
# auto.arima(US_inv_ts, d = 0, seasonal = FALSE)
