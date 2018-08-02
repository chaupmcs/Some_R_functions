data= read.csv("C:\\Users\\CPU10902-local\\Desktop\\all_data_hour.csv")
library(lubridate)


data$date=parse_date_time(data$date, c('%m/%d/%Y', '%Y/%m/%d', '%Y-%m-%d'), exact = TRUE)


data= data[ order(data$date, data$hour), ]

data$date <- paste(data$date, data$hour, sep=" ")
data$hour <- NULL


write.csv(data, "data_hourly_17h30_10th_Oct.csv", row.names = F)

View(data)
