
plot_histogram <- function(means = NULL, sds = NULL, probs = NULL, residual, breaks = 30)
{
  if (!is.null(means))
  {
    truth = c()
    x=seq(-5e+05, 1e+06, 100)
    truth = NULL
    for (i in 1:length(mean))
      truth = probs[i]*dnorm(x,means[i],sds[i])
  
  
    hist(residual, prob=TRUE)
    lines(density(residual), col="blue", lwd=2) # add a density estimate with defaults
    curve(dnorm(x, mean=mean(residual), sd=sd(residual)), add=TRUE, col="black")
    
    lines(x, truth,  lwd = 2, col="red")
    legend("topright",c("Residual Density","Estimated Density", "normal curve"),
           col=c("blue", "red","black"),lwd=2)
  }
  else
  {
    hist(residual, prob=TRUE, ylim = c(0,18e-07),breaks = breaks)
    lines(density(residual), col="blue", lwd=2) # add a density estimate with defaults
    curve(dnorm(x, mean=mean(residual), sd=sd(residual)), add=TRUE, col="black")
    
    
    legend("topright",c("Residual Density","normal curve"),
           col=c("blue", "black"),lwd=2)
  }
}


calculate_outliers <- function(residual)
{
  a=summary(residual)
  
  quartile_1 = a["1st Qu."]
  quartile_3 = a["3rd Qu."]
  
  IQR = quartile_3 - quartile_1
  
  low = quartile_1 - 1.5 * IQR
  high = quartile_3 + 1.5 * IQR
  
  outlierIndice = which(residual>high | residual<low, TRUE)
  
  return(outlierIndice)
}

residual_R_func <- function(data)
{
  if (!is.vector(data))
    data= as.vector(data)
  d = ts(data, frequency = 7)
  stl_ob = stl(d, s.window = "periodic")
  
  residual_slt_R=stl_ob$time.series[,"remainder"]
  return(residual_slt_R)
}


trend_R_func <- function(data, freq = 7, start_to_cur_point = T)
{
  if (!is.vector(data))
  data= as.vector(data)

  if (start_to_cur_point == F)
  {
    d = ts(data, frequency = freq)
    stl_ob = stl(d, s.window = "periodic")
    
    trend=stl_ob$time.series[,"trend"]
  }
  else
  {
    trend = c()
    for (i in 29:length(data))
    {
      data.cut = data[1:i]
      d = ts(data.cut, frequency = freq)
      stl_ob = stl(d, s.window = "periodic")
      trend.temp=stl_ob$time.series[,"trend"]
      trend = c(trend, trend.temp[length(trend.temp)])
      
    }
  
  }
  
  return(trend)
}

dataPlot <- function(trend=NULL, residual, data, legend_ = T, legend_pos = "center")
{
  outlierIndice = calculate_outliers(residual)
  plot(1:length(data), data, type="o", ylim = c(-4e+06,14e+06))
  lines(outlierIndice, data[outlierIndice], col="red", type="p")
  lines(1:length(data), residual, type="o",  col="blue")
  lines(outlierIndice, residual[outlierIndice], col="red", type="p")
  if (!is.null(trend))
  {
    lines(trend, col="purple", type = "l")
    if (legend_ == T)
      legend(legend_pos,c("Residual","Data", "Trend", "outlier"),
           col=c("blue", "black", "purple", "red"),lwd=2)
  }
  else if (legend_ == T)
    legend(legend_pos,c("Residual","Data",  "outlier"),
           col=c("blue", "black",  "red"),lwd=2)
  
}

dataPlot_compare <- function(residual.R, residual.Py, data, shift = max(res.py),  outliers_data__by_R = TRUE)
{
  residual.Py = residual.Py + shift
  outliers.R = calculate_outliers(residual.R)
  outliers.Py = calculate_outliers(residual.Py)
  plot(1:length(data), data, type="o", ylim = c(-1e+06,11e+06))

  if (outliers_data__by_R == TRUE)
    lines(outliers.R, data[outliers.R], col="red", type="p")
  else
  {
    lines(outliers.Py, data[outliers.Py], col="red", type="p")
  }
  
  
  
  
  lines(1:length(data), residual.R, type="o", col="blue")
  lines(1:length(data), residual.Py, type="o",  col="green")
  
  lines(outliers.R, residual.R[outliers.R], col="red", type="p")
  lines(outliers.Py, residual.Py[outliers.Py], col="black", type="p")
  
  legend("center",c("Residual.R","Data", "Residual.Py"),
           col=c("blue", "black",  "green"),lwd=2)
  
}


a=trend_outliers_detect(trend.MA.start_to_cur, 4)
trend_outliers_detect <- function(trend, num_points=4)
{
  
  t = diff(trend)
  res = rep(0, length(t))
  for (i in num_points:length(t))
    if(max(t[(i-num_points+1):i]) < 0)
      res[i] = 1
  index_trend_out = which(res == 1)
  index_trend_out = index_trend_out + 1
  return(index_trend_out)
}
trend_outliers_detect(trend.MA.start_to_cur, 4)

plot_Trend_Detect<-function(trend, plot_Data = T, data, num_points = 5)
{
 
    if (plot_Data==T)
    {
      index_trend_out = trend_outliers_detect(trend = trend,  num_points = num_points )
      plot(data, type="o", col="black", cex = .1)
      lines(1:length(data), trend, type="l", col="blue")
      lines(index_trend_out, trend[index_trend_out], type="p", col="red", cex = .6)
    }
    else
    {
      index_trend_out = trend_outliers_detect(trend = trend,num_points = num_points )
      plot( trend, type="l", col="blue", cex = .1)
      lines(index_trend_out, trend[index_trend_out], type="p", col="red", cex = .6)
    }
  
}

