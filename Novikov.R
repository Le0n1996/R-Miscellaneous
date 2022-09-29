library(forecast)
library(tidyverse)
library(tibbletime)
library(tseries)
library(urca)
library(gridExtra)

gdp <- read_csv("GDP_sa.csv")
gdp_ts <- ts(gdp, start = c(1960, Q2), frequency = 4)
autoplot(gdp_ts, xlab="Year", ylab="GDP")
head(gdp_ts)

cpi <- read_csv("CPI_sa.csv")
cpi_ts <- ts(cpi, start = c(1960, Q2), frequency = 4)
head(cpi_ts)

data <- read_csv("dataset1.csv")
data_ts <- ts(data, start = c(1960, 2), frequency = 4)

adf.test(data_ts[,1], alternative=c('stationary'))
adf.test(data_ts[,2], alternative=c('stationary'))

kpss.test(data_ts[,1], lshort = TRUE) # no need in long constructions
kpss.test(data_ts[,2], lshort = TRUE) # no need in long constructions