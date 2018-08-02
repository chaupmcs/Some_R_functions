#read input
chat = read.csv("summary_chat_sticker_2016-03-15_edit.csv")
down = read.csv("summary_down_sticker_2016-03-15_edit.csv")

chat2=read.csv("summary_chat_sticker_2016-03-15_edit.csv")

profiles = read.table("newuser_profile_location_2016-03-15", header =F, sep="")
colnames(profiles) <- c("Userid", "Local", "IsMale", "Age")

chat.profiles= merge(x = chat, y=profiles, by="Userid", all.x = T)
chat = chat.profiles
summary(chat.profiles)

library(plyr)

chat.users = split(x = chat, chat$Userid)

week2 = lapply(chat.users, function(x){y = x[as.Date(x$Date,format ="%Y-%m-%d") 
                                            >= as.Date("2016-03-22", format ="%Y-%m-%d" ),]; if (nrow(y)>0) return(T) else return(F)})

week2 = Filter(function(x){x ==TRUE}, week2)

names_week2_chat = labels(week2)

names_all_users = labels(chat.users)

index = sapply(names_week2_chat, function(x){which(x == names_all_users)})
index = as.numeric(index)


chat_week2 = chat.users[index]
no_chat_week2 = chat.users[-index]
 # no_chat_week2 = chat_week2

length(no_chat_week2)

no.chat.freq = lapply(X = no_chat_week2,function(x){count(x, vars = "cateid")})
nrow.no.chat.freq = as.numeric(sapply(X = no.chat.freq, nrow))
uni.nrow.no.chat =sort(unique(nrow.no.chat.freq))

index = list()
result.no.chat.nCate = list() 
number.each.cate = c()




for (i in 1:length(uni.nrow.no.chat))
{
  index[[i]] = which(nrow.no.chat.freq == uni.nrow.no.chat[i])
  result.no.chat.nCate[[i]] =  no_chat_week2[index[[i]]]
  number.each.cate[i] = length(result.no.chat.nCate[[i]])
}
length(result.no.chat.nCate[[1]])

table = cbind.data.frame(uni.nrow.no.chat,number.each.cate )
colnames(table)<-c("no. cates", "no. users")

divide = c(1,3,6,11,100)


d.index = list()
d.result.no.chat.nCate = list() 
d.number.each.cate = c()

for (i in 1:(length(divide)-1))
{
  d.index[[i]] = which(nrow.no.chat.freq >= divide[i] & nrow.no.chat.freq < divide[i+1])
  d.result.no.chat.nCate[[i]] =  no_chat_week2[d.index[[i]]]
  d.number.each.cate[i] = length(d.result.no.chat.nCate[[i]])
}
sum(d.number.each.cate)
d.result.no.chat.nCate[[1]]

table2 = cbind.data.frame(c("1-2", "3-5", "6-10", ">10"),d.number.each.cate)
colnames(table2)<-c("no. cates", "no. users")

# t.test = d.result.no.chat.nCate[[1]]
# 
# num.date.chat = lapply(t.test, function(x){nrow(count(x, vars = "Date"))})
# table(as.numeric(num.date.chat))

no.chat.labels = data.frame(labels(no_chat_week2))
colnames(no.chat.labels) = "Userid"
profiles2 =na.omit(merge(profiles, no.chat.labels, by="Userid", all.y = T))

labels.no.chat.cate = list()
index.cate = list()
nochat.cate = list()
table.cate = list()
table.cate2 = list()
length.table = c()



for(i in 1:4)
{
  labels.no.chat.cate[[i]] = labels(d.result.no.chat.nCate[[i]])
  index.cate[[i]] = as.numeric(sapply(labels.no.chat.cate[[i]], function(x){ which(x == profiles2$Userid)}))
  nochat.cate[[i]] = profiles2[index.cate[[i]],]
  table.cate[[i]] = data.frame(unique(nochat.cate[[i]]$Userid))
  length.table[i] = nrow(table.cate[[i]])
  colnames(table.cate[[i]]) = "Userid"
  table.cate2[[i]] = merge(table.cate[[i]], profiles, by="Userid", all.x = T)
}
nochat.cate[[1]]
table.cate[[1]]

# table.cate2[[1]]
sort(table(table.cate2[[1]]$Local),T)
plot(sort(table(table.cate2[[1]]$Local),T))
plot(sort(table(table.cate2[[1]]$Local),T)[1:10])

sort(table(table.cate2[[2]]$Local),T)
plot(sort(table(table.cate2[[2]]$Local),T))
plot(sort(table(table.cate2[[2]]$Local),T)[1:10])

sort(table(table.cate2[[3]]$Local),T)
plot(sort(table(table.cate2[[3]]$Local),T))
plot(sort(table(table.cate2[[3]]$Local),T)[1:10])



sort(table(table.cate2[[1]]$Age),T)
plot(sort(table(table.cate2[[1]]$Age),T))
plot(sort(table(table.cate2[[1]]$Age),T)[1:20])

sort(table(table.cate2[[2]]$Age),T)
plot(sort(table(table.cate2[[2]]$Age),T))
plot(sort(table(table.cate2[[2]]$Age),T)[1:20])

sort(table(table.cate2[[3]]$Age),T)
plot(sort(table(table.cate2[[3]]$Age),T))
plot(sort(table(table.cate2[[3]]$Age),T)[1:20])

labels.no.chat.cate[[1]]
labels.no.chat.cate
length(labels(no_chat_week2))

length(labels(no_chat_week2))

summary(profiles2)

sum(d.number.each.cate)
result = do.call("rbind", d.result.no.chat.nCate[[1]]) 
View(result)
length(unique(result$Userid))

plot(1:length(table(result$Stickerid)),table(result$Stickerid), type="o", axes=F)
sum(table(result$Stickerid)[1:30])/nrow(result)
labels1= unlist(labels(table(result$Stickerid )))
axis(1, at=seq(1,length(table(result$Stickerid)), by=1), labels=labels1)
class(as.vector(labels(table(result$Stickerid ))))





# chat_week.docall = do.call("rbind", chat_week2)
# nrow(chat_week2)
## its the same as rbindlist(), but much more slower. 
# So, we're gonna use rbindlist() instead.

library(data.table)
Have.chat = rbindlist(chat_week2)
result = rbindlist(no_chat_week2)

# View(chat_week.docall)


