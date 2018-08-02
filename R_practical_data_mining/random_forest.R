#########################

input_data = read.csv("data.csv")


input_data = input_data[,-c(1,13,16,19,22,25,28)]


#add 'class' col
input_data$class = 0
input_data[input_data$Msg_week2 > 0,]$class = 1

data = input_data[,c(1:36,63)]


colnames(data)



############## 
#tree

tree = rpart::rpart(as.factor(class)~., data = data)


rattle::fancyRpartPlot((tree))
####### #test predict by RandomForest
library(randomForest)
library(caret)


#make a predict object 
rf= randomForest(as.factor(class) ~ ., data = data,importance =TRUE)



barchart(rf$importance)

barplot(rf$importance, horiz=TRUE,las=1,names.arg=labels(rf$importance))
barplot(rf$importance, horiz=TRUE,las=1)
text(rf$variable.importance, horiz=TRUE,
     labels=format(round(rf$variable.importance/1000),big.mark=","), cex=1,pos=3)

corrplot::corrplot(cor(data), "number")



