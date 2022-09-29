
## VAR estimation: example
library(fpp)
library(vars)
data(usconsumption, package = "fpp")
head(usconsumption)
VARselect(usconsumption, lag.max=7, type = "const")
VARselect(usconsumption, lag.max = 7, type = "const")$selection
var1 <- VAR(usconsumption, p = 1, type = "const")
summary(var1)
serial.test(var1, lags.pt = 10, type = "PT.asymptotic")
serial.test(var1, lags.pt = 10, type = "BG")
var2 <- VAR(usconsumption, p = 2, type = "const")
serial.test(var2, lags.pt = 10, type = "PT.asymptotic")
serial.test(var2, lags.pt = 10, type = "BG")
var3 <- VAR(usconsumption, p = 3, type = "const")
serial.test(var3, lags.pt = 10, type = "PT.asymptotic")
serial.test(var3, lags.pt = 10, type = "BG")
var4 <- VAR(usconsumption, p = 4, type = "const")
serial.test(var4, lags.pt = 10, type = "PT.asymptotic")
serial.test(var4, lags.pt = 10, type = "BG")
normality.test(var3, multivariate.only = FALSE)
var_fcst <- forecast(var3, h = 8)
var_fcst$forecast$consumption$mean
var_fcst$forecast$income$mean

autoplot(var_fcst) 
causality(var3, 'consumption')
causality(var3, 'income')
Omega_hat <- summary(var3)$covres
chol(Omega_hat)%>%t()
Psi(var3)[,,1]
    
