
library(missForest)
input_data = read.csv("data.csv")


input_data = input_data[,-c(1,13,16,19,22,25,28)]


#add 'class' col
input_data$class = 0
input_data[input_data$Msg_week2 > 0,]$class = 1

data = input_data[,c(1:29,63)]



#the missing data
data.mis = data

for (i in 1:nrow(data.mis))
{
  if (data.mis$age[i] < 0)
    data.mis$age[i] = NA
}


#run missForest funct
data.imp <- missForest(xmis=data.mis, verbose=TRUE)

#test missForest
# view column "age" after and before imputation
View(data.frame(cbind(data.imp$ximp$age, input_data$age)))

# print 'out of bag error' (estimated error)
print(data.imp$OOBerror)

##########################################

####### #test predict by RandomForest
library(randomForest)
library(caret)


#data is treated like a training set
train_data = data.imp$ximp


train = data.imp$ximp[1:8000,]

test = data.imp$ximp[-c(1:8000),]

#make a predict object 
rf= randomForest(as.factor(class) ~ ., data = train, importance=TRUE)


barchart(rf$importance)


#show result info

p.fill = predict(rf, test)


confusionMatrix(reference=test$class, data = p.fill)


############# without missForest


train2 = data[1:8000,]

test2 = data[-c(1:8000),]

rf2= randomForest(as.factor(class) ~ ., data = train2, importance=TRUE)



barchart(rf2$importance)


#show result info

p = predict(rf2, test2)


confusionMatrix(reference=test2$class, data = p)


