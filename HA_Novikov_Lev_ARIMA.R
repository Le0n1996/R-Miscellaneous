# Будем работать с Quandl, устанавливаем пакет.
install.packages("Quandl")
library(Quandl)
library(tseries)
library(forecast)
library(tibbletime)
library(urca)
library(gridExtra)
# Данные - курс доллара/евро за каждый день, начиная с 01.01.2000 и заканчивая 31.12.2016.
exrate <- Quandl("CUR/EUR", api_key="Lw25Kumi4ouU2EExsDxD",
               end_date="2016-12-31", type="ts", collapse="monthly")
head(exrate)
plot.ts(exrate, xlab="Year", ylab="Rate, USD / EUR")

plot.ts(exrate, xlab="Year", ylab="Rate, USD / EUR")
lines(lowess(exrate), col="red", lty="dashed")

# За 16 лет тяжело составить полную картину, будем исследовать компоненты ряда:
plot(decompose(exrate, type="multiplicative"))

# Проведем расширенный тест Дики-Фуллера для проверки на стационарность:
adf.test(exrate, alternative=c('stationary'))

# Проведем еще раз для ряда из разностей первого порядка:
adf.test(diff(exrate), alternative=c('stationary'))
ndiffs(exrate)
plot(decompose(diff(exrate), type="multiplicative"))

Lambda <- BoxCox.lambda(exrate, method="loglik")
print(Lambda)

# Показательная неудачная попытка обойтись без ARIMA, работая с нейронными сетями
fit.nnr1 <- nnetar(exrate, lambda=Lambda, size = 7)
fcast.nnr1 <- forecast(fit.nnr1, h=36, lambda=Lambda)

fit.nnr2 <- nnetar(exrate, lambda=Lambda, size = 3)
fcast.nnr2 <- forecast(fit.nnr2, h=36, lambda=Lambda)

fit.nnr3 <- nnetar(exrate, lambda=Lambda, size = 5)
fcast.nnr3 <- forecast(fit.nnr3, h=36, lambda=Lambda)

par(mfrow=c(3, 1))
plot(fcast.nnr1, include=204)
plot(fcast.nnr2, include=204)
plot(fcast.nnr3, include=204)

# Теперь смотрим по дням
exrate_d <- Quandl("CUR/EUR", api_key="Lw25Kumi4ouU2EExsDxD",
                   end_date="2016-12-31", type="zoo")
exrate_d_train <- Quandl("CUR/EUR", api_key="Lw25Kumi4ouU2EExsDxD",
                         end_date="2015-12-31", type="zoo")
exrate_d_test <- Quandl("CUR/EUR", api_key="Lw25Kumi4ouU2EExsDxD",
                        start_date="2016-01-01", end_date="2016-12-31", type="zoo")
for.test <- as.numeric(exrate_d_test)
h <- length(for.test)
print(h)

Lambda_d <- BoxCox.lambda(ts(exrate_d, frequency=365), method="loglik")

fit.arima <- auto.arima(exrate_d_train, lambda=Lambda_d, ic = "aic")
fcast.arima <- forecast(fit.arima, h, lambda=Lambda_d)

par(mfrow=c(2, 1))
plot.ts(exrate_d, ylab=" ")
plot(fcast.arima, include=6205)