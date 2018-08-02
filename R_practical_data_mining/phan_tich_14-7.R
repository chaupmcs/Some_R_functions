### read input
chat = read.csv("summary_chat_sticker_2016-03-15_edit.csv")



#function plot
plot.stickers = function(x)
{
  x = data.frame(x)
  plot(1:length(x[,2]), x[,2], type="l")
}



library(plyr)
#Save the userIDs
UserIDs_total = count(chat, vars = "Userid")[,1]
View(chat[chat$Userid==171068287,])

### 1 ngày có bao nhiêu newuser dùng sticker? 

# divide the data into each day data
chat.eachDate = split(chat, chat$Date)


UserID.eachDate = lapply(X = chat.eachDate, FUN = function(x){ count(x,"Userid")})

# number of users each day:
TotalUsers.eachDate = lapply(UserID.eachDate, function(x){ length(x[,1])})

# total chat each day
TotalChat.eachDate = lapply(chat.eachDate, function(x){ length(x[,2])})

MeanChat.eachDate = as.numeric(TotalChat.eachDate)/ as.numeric(TotalUsers.eachDate)
plot(1:7, MeanChat.eachDate, type="l")


#figure out what kinda cateid used the most
View(sort(table(chat.eachDate$`2016-03-18`$Cateid), T))
View(sort(table(chat$Cateid), T))

# (94-mean(c(89,72,94,69)))/(94-69)
#########
Users_CateID_unique = count(chat, vars = "Userid")[,1]

split.user = split(chat, chat$Userid)
View(split.user$`126697605`)

mean_cateID.eachday.alot = c()
tileAlot = c()
for (i in 1:7)
{
i=7
test2 = count(chat.eachDate[[i]], vars = c("Userid", "Cateid"))
test3 = split(test2,test2$Userid)
test=test3
 test = lapply(test3, function(x){ if (sum(x[,3])>5) return(x)})
 test=test[lapply(test, length) != 0]
 tileAlot[i] = length(test)/length(test3)

nrow.eachday = lapply(test, nrow)
nrow.eachday = as.numeric(nrow.eachday)
mean_cateID.eachday.alot[i] =  mean(nrow.eachday) 
length.test = lapply(test, nrow)
length.test= as.numeric(length.test)
table(length.test)
plot(table(length.test))
}


test
mean_cateID.eachday
plot(1:7, mean_cateID.eachday, type="l")
plot(1:7, mean_cateID.eachday.alot, type="l")
tileAlot
nrow.eachday


split.user[[6]]
