#put stickers into group
library(plyr)
#make lable

hihi = unique(c(1105,16526, 1012, 422, 17752, 1296, 1111, 1502, 16722, 1310, 1037, 17022, 1310
                ,1 , 23))

huhu = unique(c(1112,979, 16527,	1030,	17866, 17762,	17633,	974	,1319	,1097,968,	17762,	17633,	515
                , 1282,	1112,	16527,	17866, 1282,	979,	1112,	16527
                , 1282,	979,	1030,	16527,
                2, 7, 12, 15
)) 

fighting = unique(c(24, 503,	1493,	1321,	17760,	17850, 16709))

leuleu = unique(c(6, 17627,	1098,	1017,	16537,486,1098))

vuiqua = unique(c(487,	1483,	388,	16526,	17022
                  ,487,	1105,	388,	1296
                  ,1111, 1492,	388,	16526,	1296
                  ,422
                  ,4, 11))
buonqua = unique(c(1097,	1296,	17759,	17633,	1498
                   ,1031,
                   27, 28, 25 ))

chanqua = unique(c(16714,	17761,	389,	1051
                   ,1957, 1281,	1313,	1092
                   ,16530, 1957,	1281,	1313,	1092,
                   16530,	1281,	1313, 1092, 28, 25))
chactuichet = unique(c(17763,	1957,	16530,	1281,	1092, 19))

acac = unique(c(1036,	959,	16723,	17757,	17863, 21, 22))

gruu = unique(c(1327,	1101,	1500,	1290, 10, 18, 19 , 8))

hmm = unique(c(17758,	16711,	948,	980, 6))

yeu = unique(c(17747,	1283,	988,	994
               ,999,	988,	1116
               ,1283,	988,	1091,	994
               ,1279, 1026,	17747,	999,	988 
               ,516,	17747,	999,	988, 999,	996	,1005
               , 3, 4, 11 ))

nho = unique(c(1097,	969,	961,	1497, 968, 1286
))

like = unique(c(17034,	17749,	1501,	16706 ))

thichlam = unique(c(1489,	1090,	1026,	1283, 16528
                    ,1283,	1501,	16706,	17864,
                    1334,	1489,	516, 1283,	16528
                    ,17854,	1090,	17636, 1489, 3, 11))

yeah = unique(c(17760,	1483,	503,	1069,	17847, 24))

g9 = unique(c(17764,	386,	971	,996,	949, 1499, 386
              ,1291,	17764,	971,	996))

zzz = unique(c(1291,	1328,	386,	1014,	485))

buonngu = unique(c(1499,	16540,	1302, 1054,	1957,	1092))

camon = unique(c(17632,	16707,	1488,	387, 1118,	387,	1096))

bye = unique(c(17631,	1050,	1087,	1507, 505, 17631, 1040))

thoidinha = unique(c(1329, 1507))

haizz = unique(c(16714,	1306,	1106,	389, 1031
                 ,1275,	17639,	1106,	16535
))

sorry = unique(c(17633,	502,	1495,	16534
                 , 1097,	17633,	502,	1495,	16534
                 ,1326,	1088
                 , 17762,	502,	1495,	16534
                 , 17633,	1326,	1495,	16534
))


hello = unique(c(498,	17751,	17851,	17631,	1040
                 ,17751,	498,	893,	17851,	17631
                 , 1040,	17631,	16713,	498
))

goodluck = unique(c(17749,	16713,	973, 1501
                    ,17749,	1066,	16713,	973
))
lol = unique(c(1296,	1111,	1502,	422,	981
               , 17033,	1296,	1111,	679
               , 1492,	1296,	1111,	16454))

omg = unique(c(1036,	959,	986,	17628))

wow = unique(c(16717,	17019,	1096,	17858))

wtf = unique(c(16531,	17863,	1117,	16723,	1280
               , 16531,	17630,	513,	17863,	1036))
yolo = unique(c(1040,	17760,	1483,	520,	503))

please = unique(c(17018	,1028,	1088,	16724	,1293
                  ,16773)) #test

birthday = unique(c(16775,	16777,	16781,	1176
                    , 16776,	16774,	1176
                    , 16778,	16779,	16774
                    , 16780,	16778,16772, 16775,	16778
                    , 16777,	16776,	16774
                    ,16773,	16777,	16778,	16781
                    ,16775,	16773,	16778,	16774,	1176
                    , 16780,	16773,	16776,	16774,	1176
                    , 16775,	16773,	16777,	16779
                    , 16781,	16772,	16776,	16774
                    , 16777,	16778,	16781,	16779,	1176
                    , 16773,	16772,	16776,	1176,
                    16777,	16778,	16772,	16774,	1176
                    , 16781, 16773))

Group.list = list(hihi, huhu, fighting, leuleu, vuiqua, buonqua, chanqua, chactuichet, acac, gruu, hmm, yeu
                  ,nho, like, thichlam, yeah, g9, zzz, buonngu, camon, bye,  thoidinha, haizz, sorry, hello, goodluck
                  , lol, omg, wow, wtf, yolo, please, birthday)

unique(unlist(Group.list))

ttt = 5


label.group = c("hihi", "huhu", "fighting", "leuleu", "vuiqua", "buonqua", "chanqua", "chactuichet", "acac", "gruu", "hmm", "yeu"
                ,"nho", "like", "thichlam", "yeah", "g9", "zzz", "buonngu", "camon", "bye",  "thoidinha", "haizz", "sorry", "hello"
                , "goodluck"
                , "lol", "omg", "wow", "wtf", "yolo", "please", "birthday")

# lengthGroup = lapply(Group.list, length)
# sum(as.numeric(lengthGroup))
# bindGroup = Reduce(c,Group.list, init = c())
# uniqueGroup = unique(bindGroup)
# length(uniqueGroup)

########### put labels on the data
# take too much time - , see nothing for half an hour !  Not practical
# Group.result  = data.frame()
# for (i in 1:length(Group.list))
# {
#   for (j in 1:nrow(chat))
#     Group.result[j,i] = ifelse(chat$Stickerid[j] %in% Group.list[[i]], 1, 0)
# }

# perhaps, we need to  change the code a little bit
# give a try on this:
list.group = list()
number.of.group = c()

index = list()

#initial values
for (i in 1:(length(Group.list)))
{
  list.group[[i]] = rep(0, nrow(result))
}

for (i in 1:length(Group.list))
{#i=1
  index[[i]] = which(result$Stickerid %in% Group.list[[i]])
  list.group[[i]][index[[i]]] = 1
  number.of.group[i] = length(subset(list.group[[i]],list.group[[i]] ==1 ))
}
# too fast, even though i cant explain O_o
a=Reduce(function(x,y){cbind.data.frame(x,y)}, x = list.group )
a$other =  apply(a, 1, sum)
a$other = ifelse(a$other == 0, 1, 0)



View(a)

b = apply(a, 2, sum)

plot(b)
c= cbind.data.frame(b, c(label.group, "other"))
c=c[order(c$b, decreasing = T),]
d=c



######## no.user
list.group = list()
number.of.group = c()
result.count = count(result, vars = c("Userid", "Stickerid"))
index = list()

#initial values
for (i in 1:(length(Group.list)))
{
  list.group[[i]] = rep(0, nrow(result.count))
}

for (i in 1:length(Group.list))
{#i=1
  index[[i]] = which(result.count$Stickerid %in% Group.list[[i]])
  list.group[[i]][index[[i]]] = 1
  number.of.group[i] = length(subset(list.group[[i]],list.group[[i]] ==1 ))
}
# too fast, even though i cant explain O_o
a=Reduce(function(x,y){cbind.data.frame(x,y)}, x = list.group )
a$other =  apply(a, 1, sum)
a$other = ifelse(a$other == 0, 1, 0)

sum(a$other)
View(a)
# View(a)

b = apply(a, 2, sum)

plot(b)
c= cbind.data.frame(b, c(label.group, "other"))
c=c[order(c$b, decreasing = T),]



lables.result = (unique(result$Userid))


e=merge(c,d, by=2, all = T)
colnames(e) <- c("Group", "no.Users", "no.Chat")
e = e[order(e$no.Chat, decreasing = T),]
e$"User/total" = e[2]/length(lables.result)

View(e)


table.group = cbind.data.frame(number.of.group, label.group)
table.group=table.group[order(table.group$number.of.group, decreasing = T),]
View(table.group)

plot(1:nrow(table.group), table.group[[1]], type="o", axes=F)
axis(1, at=seq(1,nrow(table.group), by=1), labels=table.group[[2]] )





#so lieu
ttt=34
index.other = which(a[[1]] %in% c(1))


other = result[index.other,]
head(other)
other.count = count(other,c("Userid", "Stickerid"))
f=data.frame(sort(table(other.count$Stickerid),T))
g =data.frame(sort(table(other$Stickerid),T))

h=merge(f,g,by=1,all=T)
colnames(h) <- c("Stickerid", "no.Users", "no.Chat")
h=h[order(h$no.Users,decreasing = T),]
lables.other = unique(other$Userid)
h$"User/total" = h[2]/length(lables.other)
View(h)






#IsMAle
other.count = count(other,c("Userid", "Stickerid", "IsMale", "Age"))
f=data.frame(sort(table(other.count$IsMale),T))
g =data.frame(sort(table(other$IsMale),T))

h=merge(f,g,by=1,all=T)
colnames(h) <- c("IsMale", "no.Users", "no.Chat")
h=h[order(h$no.Users,decreasing = T),]
lables.other = unique(other$Userid)
h$"User/total" = h[2]/sum(f[2])
View(h)


#Age
other.count = count(other,c("Userid", "Stickerid", "IsMale", "Age"))
f=data.frame(sort(table(other.count$Age),T))
g =data.frame(sort(table(other$Age),T))

h=merge(f,g,by=1,all=T)
colnames(h) <- c("Age", "no.Users", "no.Chat")
h=h[order(h$no.Users,decreasing = T),]
lables.other = unique(other$Userid)
h$"User/total" = h[2]/sum(f[2])
View(h)
plot(h$no.Users[1:20], axes = F, type="o")
axis(1, at=seq(1,length(h$no.Users), by=1), labels=h$Age )


library(plyr)


head(other.count)

lable.users = unique(other.count$Userid)

other.top = sort(table(other$Stickerid), T)
plot(1:length(other.top),other.top)



lables.result = unique(result$Userid)
length(lables.result)
result.count = count(result,c("Userid", "Stickerid"))

head(result.count)
table2= sort(table(result.count$Stickerid),T)
plot(table2[1:10])

table3=as.data.frame(table2)

table.eachGroup= list()
number.each.stickers.in.eachGroup = list()
for (i in 1:length(Group.list))
{
  table.eachGroup[[i]] = chat[list.group[[i]] == 1,]
  number.each.stickers.in.eachGroup[[i]] = count(table.eachGroup[[i]], vars = "Stickerid")
  number.each.stickers.in.eachGroup[[i]] =  number.each.stickers.in.eachGroup[[i]][order(number.each.stickers.in.eachGroup[[i]]$freq,decreasing = T),]
}


View(number.each.stickers.in.eachGroup[[1]])
plot(1:nrow(number.each.stickers.in.eachGroup[[1]]), number.each.stickers.in.eachGroup[[1]]$freq, type="o", axes=F)
axis(1, at=seq(1,nrow(number.each.stickers.in.eachGroup[[1]]), by=1), labels=number.each.stickers.in.eachGroup[[1]]$Stickerid )


table.eachGroup.1.eachDate = split(table.eachGroup[[1]], table.eachGroup[[1]]$Date)
table.eachGroup.1.eachDate.split = lapply(X=table.eachGroup.1.eachDate, function(x){count(x, vars = "Stickerid")})
# write.csv(table.eachGroup.1.eachDate.split, "table.eachGroup.1.eachDate.split.csv",row.names = F)
newta = data.frame()
oldta = data.frame(table.eachGroup.1.eachDate.split)




new =oldta
View(data.frame(oldta))
new = oldta[,-seq(3, 27, by=2)]

Date= labels(chat.eachDate)

new2 = t(new)
colname2.new2 = as.character(new2[1,])
new2 = new2[-1,]
new2= cbind.data.frame(new2, Date)
colnames(new2)= c(colname2.new2, "Date")

library(reshape)
new3 = melt(new2, id=c("Date"))
View(new3)

write.csv(new3, "new3.csv", row.names = F)


##########
