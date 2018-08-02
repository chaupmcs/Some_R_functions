par(mfrow=c(1,1))
data1 <- read.table("feature_d7_label_2016-01-15_header.txt",stringsAsFactors = FALSE,header=TRUE)
data1 <- data1[,-c(1,8,15,23,24,34)]
data <- data1[,-c(5,11,17)]

# remove qr_code
data <- data1[,-c(5,11,17)]

data$class <- 1
data[data$msg_week2==0,]$class=0
data$msg_week2<-NULL;data$day_chat_week2<-NULL

subset <- data[data$msgchat<=1,] # get the low chat group

########################### Correlation
dat <- subset[subset$class==1,];dat$class <- NULL;M1<-cor(dat)
library(corrplot)
# corrplot(M,number.cex =0.5,diag=FALSE,type="lower",method="color",addCoef.col = "white",
#          tl.cex=0.7,tl.col="black",title = "No Chat")

##################
data1 <- read.table("feature_d7_label_2016-03-15_header.txt",stringsAsFactors = FALSE,header=TRUE)
data1 <- data1[,-c(1,8,15,23,24,34)]
data <- data1[,-c(5,11,17)]

# remove qr_code
data <- data1[,-c(5,11,17)]

data$class <- 1
data[data$msg_week2==0,]$class=0
data$msg_week2<-NULL;data$day_chat_week2<-NULL

subset <- data[data$msgchat<=1,] # get the low chat group
########################### Correlation
dat <- subset[subset$class==1,];dat$class <- NULL;M3<-cor(dat)
library(corrplot)
corrplot(M1-M3,number.cex =0.5,diag=FALSE,type="lower",method="color",addCoef.col = "white",
         tl.cex=0.7,tl.col="black",title = "No Chat")
