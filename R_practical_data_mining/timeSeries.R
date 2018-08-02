library(xlsx)
input = read.xlsx("summary_a1_2016-03-31_2016-03-01.xlsx",sheetIndex = 1,header = T)

tui = read.csv("tui.csv", header = T, sep=";", dec=",")

library(TSA)


#tutorial http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html
kings = read.table("king.dat", skip = 3, header = F)
View(king)
kingsts = ts(kings)
kingsts

ny = read.table("nybirths.dat", header = F)
nyts <- ts(ny, frequency = 12,start = c(1946,1))
nyts

sour = read.table("souvenirtimeseries.dat", header = F)
sourts <- ts(sour, frequency = 12,start = c(1987,1))


plot.ts(kingsts)
plot.ts(nyts)
plot.ts(sourts)


logsourts = log(sourts)
plot.ts(logsourts)

library(TTR)
kingstsSMA <- SMA(kingsts, n=8)
plot.ts(kingstsSMA)

nycompo <- decompose(nyts)
nycompo$trend

plot(nycompo)

nyadj <- nyts- nycompo$seasonal
plot(nyadj)


rain <- scan("precip.dat",skip=1)
rainseries <- ts(rain,start=c(1813))
plot.ts(rainseries)
rainseriesforecasts <- HoltWinters(rainseries, beta=FALSE, gamma=FALSE)
rainseriesforecasts$fitted
plot(rainseriesforecasts)
rainseriesforecasts$SSE

library(forecast)
forecast = forecast.HoltWinters(rainseriesforecasts, h=8)
forecast

plot.forecast(forecast)
acf(forecast$residuals, lag.max=20)


skirts <- scan("http://robjhyndman.com/tsdldata/roberts/skirts.dat",skip=5)
skirtsseries <- ts(skirts,start=c(1866))
plot.ts(skirtsseries)

skirtsseriesforecasts <- HoltWinters(skirtsseries, gamma=FALSE)
plot(skirtsseriesforecasts)
skirtsseriesforecasts2 <- forecast.HoltWinters(skirtsseriesforecasts, h=19)
plot.forecast(skirtsseriesforecasts2)

acf(skirtsseriesforecasts2$residuals, lag.max=20)
Box.test(skirtsseriesforecasts2$residuals, lag=20, type="Ljung-Box")

plot.ts(skirtsseriesforecasts2$residuals)            # make a time plot
plotForecastErrors <- function(forecasterrors)
{
  # make a histogram of the forecast errors:
  mybinsize <- IQR(forecasterrors)/4
  mysd   <- sd(forecasterrors)
  mymin  <- min(forecasterrors) - mysd*5
  mymax  <- max(forecasterrors) + mysd*3
  # generate normally distributed data with mean 0 and standard deviation mysd
  mynorm <- rnorm(10000, mean=0, sd=mysd)
  mymin2 <- min(mynorm)
  mymax2 <- max(mynorm)
  if (mymin2 < mymin) { mymin <- mymin2 }
  if (mymax2 > mymax) { mymax <- mymax2 }
  # make a red histogram of the forecast errors, with the normally distributed data overlaid:
  mybins <- seq(mymin, mymax, mybinsize)
  hist(forecasterrors, col="red", freq=FALSE, breaks=mybins)
  # freq=FALSE ensures the area under the histogram = 1
  # generate normally distributed data with mean 0 and standard deviation mysd
  myhist <- hist(mynorm, plot=FALSE, breaks=mybins)
  # plot the normal curve as a blue line on top of the histogram of forecast errors:
  points(myhist$mids, myhist$density, type="l", col="blue", lwd=2)
}

plotForecastErrors(skirtsseriesforecasts2$residuals) # make a histogram

sourfore <- HoltWinters(sour)

sour = read.table("souvenirtimeseries.dat", header = F)
souvenirtimeseries <- ts(sour,frequency = 12,start = c(1987,1))
logsouvenirtimeseries <- log(souvenirtimeseries)
souvenirtimeseriesforecasts <- HoltWinters(logsouvenirtimeseries)
souvenirtimeseriesforecasts
souvenirtimeseriesforecasts$SSE


