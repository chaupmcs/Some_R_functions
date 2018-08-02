
input_data = read.csv("data.csv")


input_data = input_data[,-c(1,13,16,19,22,25,28)]


#add 'class' col
input_data$class = 0
input_data[input_data$Msg_week2 > 0,]$class = 1

data = input_data[,c(1:29,63)]



#the missing data
# data.mis = data
# 
# for (i in 1:nrow(data.mis))
# {
#   if (data.mis$age[i] < 0)
#     data.mis$age[i] = NA
# }


library(missForest)
#the missing data
data.mis = data
count = 1
for (i in 1:nrow(data.mis))
{
  if (data.mis$age[i] < 0)
  {
    data.mis$age[i] = NA
    count = count + 1
  }
}


#run missForest funct
data.imp <- missForest(xmis=data.mis, verbose=TRUE)

#test missForest
# view column "age" after and before imputation
View(data.frame(cbind(data.imp$ximp$age, input_data$age)))

# print 'out of bag error' (estimated error)
print(data.imp$OOBerror)

##########################################


library(MASS)
library(mclust)



train$class <- NULL

train = data.imp$ximp[1:8000,]
test = data.imp$ximp[-c(1:8000),]




data_mc =data.imp$ximp
data_mc_notNULL = data.imp$ximp
data_mc$class <- NULL



####### MC
mc <- Mclust(data_mc, G=2, dimens = c(27,29)) # 2 clusters

summary(mc)

library(fpc)
plotcluster(data_mc, mc$classification, pch = "*")


###### kmeans


low = data_mc[data_mc$freq_chat < 2.5,]

high = data_mc[data_mc$freq_chat >= 2.5,]

train.class = low

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
clusplot(low, kc$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)






##############

chat = data.imp$ximp[data.imp$ximp$class > 0,]
nochat = data.imp$ximp[data.imp$ximp$class == 0,]


library(ggplot2)
  qplot(data.imp$ximp$no_reply, Msg, colour = class, 
      data = data.imp$ximp)
  
  
  
library(rpart)
library(rattle)
library(randomForest)  
library(caret)
tree_f = rpart(as.factor(class)~., data = data.imp$ximp)
fancyRpartPlot(tree_f)

#devide into 2 group
low_chat = data.imp$ximp[data.imp$ximp$freq_chat < 2.5,]
h_chat =data.imp$ximp[data.imp$ximp$freq_chat >= 2.5,] 

tree_low = rpart(as.factor(class)~., data = low_chat)
fancyRpartPlot(tree_low)

tree_h = rpart(as.factor(class)~., data = h_chat, cp=-1, maxdepth=2)
fancyRpartPlot(tree_h)
printcp(tree_h)


i=1


qplot(low_chat[[i]], Msg, colour = class, data = low_chat, xlab = names(low_chat[i]))

i=i+1

rf =  randomForest(as.factor(class)~., data = data.imp$ximp, importance = TRUE)

barchart(rf$importance)




corrplot::corrplot(cor(data.imp$ximp), "number")


corrplot::corrplot(cor(low_chat), "number")

corrplot::corrplot(cor(h_chat)-cor(low_chat), "number")
