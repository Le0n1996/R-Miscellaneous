library("TTR")

kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat", skip=3)

kings

kingstimeseries <- ts(kings)

kingstimeseries

plot.ts(kingstimeseries)

kingstimeseriesSMA3 <- SMA(kingstimeseries, n=3)
plot.ts(kingstimeseriesSMA3)

rain <- scan("http://robjhyndman.com/tsdldata/hurst/precip1.dat", skip=1)
rainseries <- ts(rain, start=c(1813))
plot.ts(rainseries)

ozone <- scan("C:\Users\Лев\Documents\R\ozone.csv")
ozoneseries <- ts(ozone, start=c(1813))
plot.ts(ozoneseries)