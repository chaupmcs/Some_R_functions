#read input
chat = read.csv("summary_chat_sticker_2016-03-15_edit.csv")
down = read.csv("summary_down_sticker_2016-03-15_edit.csv")
library(plotly)
library(plyr)
##### chat
chat.eachDate = split(chat, chat$Date)

chat.users = split(chat, chat$Userid)


chat.eachDate.users = lapply(chat.eachDate, function(x){ split(x, x$Userid)} )

users.use.0.eachDate = lapply(chat.eachDate.users, function(y){ Filter(function(x){for (i in 1:nrow(x)) {if (x$cateid[i] == 0) return(T)}
                                                  return(F)}, y)} )
plot(1:14,as.numeric(number.of.users.use.0.eachDate), type="o")                

number.of.users.use.0.eachDate = lapply(users.use.0.eachDate, function(x){length(x)})



# for cate x - chat
cate.chat <- function(cate)
{
  chat.x.eachDate = lapply(chat.eachDate.users, function(y){ lapply(y, function(x) { nrow(x[x$cateid == cate,])}) })
  number.of.chat.x.eachDate = lapply(chat.x.eachDate, function(x){sum(as.numeric(x))})
  plot(1:14,as.numeric(number.of.chat.x.eachDate), type="o")
  return(number.of.chat.x.eachDate)
}



# for cate x - users
cate.users <- function(cate)

{
  users.use.x.eachDate = lapply(chat.eachDate.users, function(y){ Filter(function(x){for (i in 1:nrow(x)) {if (x$cateid[i] == cate) return(T)}
  return(F)}, y)} )
  number.of.users.use.x.eachDate = lapply(users.use.x.eachDate, function(x){length(x)})
  plot(1:14,as.numeric(number.of.users.use.x.eachDate), type="o")
  return(number.of.users.use.x.eachDate)
}

#for mean = chat/ users
cate.mean <- function(cate)
{
  chat= as.numeric(cate.chat(cate))
  users = as.numeric(cate.users(cate))
  plot(1:14,chat/users, type="o")
  return(chat/users)
}

## here
cate_chat_0 = cate.chat(cate = 0)
numer.users.eachDate = lapply(chat.eachDate, nrow)

percent = as.numeric(cate_chat_0) / as.numeric(numer.users.eachDate)

plot(1:14,percent, type="o")

cate.mean(10047)

listID = as.numeric(levels(number.of.cate[1:10,1])[number.of.cate[1:10,1]])

nrow(number.of.cate)

a = lapply(chat.users, function(x){})
unique(chat$cateid)


 class(chat.eachDate.users$`2016-03-15`)
# length.cateid.28.3 = lapply(chat.cateid.28.3, nrow)
# 
# plot(as.numeric(length.cateid.28.3))
# 
# 
# length.cateid.28.3[[1]] / sum(as.numeric(length.cateid.28.3))
 

library(plyr)
#Save the userIDs
UserIDs_total = count(chat, vars = "Userid")[,1]
length(UserIDs_total)
UserID.eachDate = lapply(X = chat.eachDate, FUN = function(x){ count(x,"Userid")})
number.of.users.eachDate = lapply(UserID.eachDate, nrow)
# number of users each day:
TotalUsers.eachDate = lapply(UserID.eachDate, function(x){ length(x[,1])})
plot(1:14,as.numeric(number.of.users.use.0.eachDate), type="o")



chat.cateid = split(chat, chat$cateid)

number.of.cate = lapply(chat.cateid, nrow)
plot(as.numeric(number.of.cate), type="o")

as.character(number.of.cate)



lables.cate = labels(number.of.cate)
values.cate = as.numeric(number.of.cate)
number.of.cate = cbind.data.frame(lables.cate, values.cate)

number.of.cate=number.of.cate[order(-number.of.cate$values.cate),]

plot(number.of.cate[,2], type="o", axes=F)
axis(1, at=seq(1,61, by=1), labels=number.of.cate[,1] )

#filter the users quit chat stickers
a = Filter(function(x){ nrow(x) < 5},chat.users)
b = lapply(a, function(x){count(x, vars = c("cateid"))})
c = lapply(b, function(x){as.numeric(x$cateid)})
d= unlist(c, use.names = F)
plot(1:53,sort(table(d),T), type="o")


e= lapply(chat.users, function(x){ count(x, vars = c("cateid", "Date"))})
f = lapply(e, function(x){ x$freq = 1; return(x)})
e$`73016693`$freq=1
g= lapply(f, function(x){ count(x, vars = c("cateid"))})

#####
test.b = lapply(chat.users, function(x){nrow(x)})
test.c= as.numeric(test.b)
test.d =labels(test.b)
test.e = cbind.data.frame(test.c, test.d)

View(chat.users$`171055602`)

#check reuse
re.a = lapply(chat.users, function(x){count(x, vars = c("cateid", "Date"))})
re.b = lapply(re.a, function(x){x$freq = 1; return(x)})
re.c = lapply(re.b, function(x){count(x, vars="cateid")})
re.d = lapply(re.c, function(x){x[x$freq==1, ]})
re.e = Filter(function(x){nrow(x) > 0}, re.d)
re.f = lapply(re.e, function(x){as.numeric(x$cateid)})
re.g = unlist(re.f, use.names = F)
sort(table(re.g), T)


plot(1:length(table(re.g)),sort(table(re.g), T), type="o")

index = which(chat$Stickerid %in% Group.list[[1]])
data= chat[index,]
t = count(chat[index,], vars = c("Userid", "Stickerid"))
t2 = split(t, t$Userid)
t22 = Filter(function(x){nrow(x)>1 & sum(x$freq) >=4 }, t2)
t3 = split(data,data$Userid)
View(data$`171068224`)
data[data$Userid==171068224,]


data.split = split(data, data$Userid)
data.split2 = Filter(function(x){nrow(x)>=4}, data.split)
data.split3 = Filter(function(x){length(unique(x$Stickerid))<=4 & length(unique(x$Stickerid))>=2 & length(unique(x$Date))>=3}, data.split2)
data.freq = lapply(data.split3, function(x){count(x, vars="Stickerid")[order(count(x, vars="Stickerid")$freq, decreasing = T),]})
data.freq2 =lapply(data.freq, function(x) {return(x[x$freq ==1 & x$freq/sum(x$freq) <= 0.2,])})
data.freq22 = Filter(function(x){nrow(x)>=1}, data.freq2)

a=labels(data.freq22)
b=labels(chat.users)
class(b)
which(x = b, useNames = F)
which("171065918",b)
data.freq.unlist = unlist(x = data.freq22, use.names = F)
table(data.freq.unlist)

f= lapply(chat.users, function(x){x})
c=lapply(chat.users, function(x){names(x)})

d=sapply(a, function(x){which(x %in% b)})
match(c(11, 1), 1, nomatch = 0 )
which()
labels(chat.users$`69414386`)
data.split4 = Filter(function(x){length(unique(x$Stickerid))==2}, data.split3)

x=data.freq$`171069919`
x[x$freq <=2 & x$freq/sum(x$freq) <= 0.2,]
x$freq
