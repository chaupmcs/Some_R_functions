require(rpart)
require(rattle)

data1 <- read.table("feature_label_2016-01-15_header.txt",stringsAsFactors = FALSE,header=TRUE)



data1 <- data1[, -c(1,2,9,10,17,18,26,27,37,38)]


data1$class <- 0

data1[data1$day_chat_week2 > 0,]$class = 1

chat = data.frame(subset(data1, class==1))

no_chat = data.frame(subset(data1, class==0))

data1$msg_week2 <- NULL
data1$day_chat_week2 <- NULL


tree = rpart(as.factor(class) ~ ., data = data1)
# fancyRpartPlot(tree)


library(MASS)
library(mclust)

train = data1[1:8000,]
test= data1[8001:10000,]

train.raw = data1[1:8000,]

train$class <- NULL


##lustering
train.class = train
m <- apply(train.class, 2, mean)
s <- apply(train.class, 2, sd)
z <- scale(train.class, m, s)
distance <- dist(z)

hc.c <- hclust(distance)
# plot(hc.c, hang =-1)

hc.a <- hclust(distance, method = "average")
# plot(hc.a, hang=-1)
member.c <- cutree(hc.c, 2)
member.a <- cutree(hc.a, 2)
table(member.c, member.a)

aggregate(z, list(member.c), mean)
aggregate(train.class, list(member.c), mean)

library(cluster)
# plot(silhouette(cutree(hc.c, 3), distance))

wss <- (nrow(z)-1)*sum(apply(z,2,var))
for (i in 2:20) wss[i] <- sum(kmeans(z, centers=i)$withinss)
# plot(1:20, wss, type = "b", xlab= "xlab", ylab="ylab")

kc <-kmeans(z,2)
# plot(request_all ~ accept_all, train, col=kc$cluster)


# vary parameters for most readable graph
library(cluster) 
clusplot(train.raw, kc$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)

# Centroid Plot against 1st 2 discriminant functions

