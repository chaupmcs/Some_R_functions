# 26-7
list.group = list()
number.of.group = c()

index = list()

#initial values
for (i in 1:(length(Group.list)))
{
  list.group[[i]] = rep(0, nrow(Age13.17))
}

for (i in 1:length(Group.list))
{#i=1
  index[[i]] = which(Age13.17$Stickerid %in% Group.list[[i]])
  list.group[[i]][index[[i]]] = 1
  number.of.group[i] = length(subset(list.group[[i]],list.group[[i]] ==1 ))
}

a=Reduce(function(x,y){cbind.data.frame(x,y)}, x = list.group )
a$other =  apply(a, 1, sum)
a$other = ifelse(a$other == 0, 1, 0)


View(Age13.17)

b = apply(a, 2, sum)

plot(b)
c= cbind.data.frame(b, c(label.group, "other"))
c=c[order(c$b, decreasing = T),]
d=c


######## no.user
b4=c()

for (i in 1:(length(Group.list)+1))
{
  b3= Age13.17[a[[i]] == 1,]
  b4[i] = length(unique(b3$Userid))
  
}


c2= cbind.data.frame(b4, c(label.group, "other"))
c2=c2[order(c2$b4, decreasing = T),]





e1=merge(c2,d, by=2, all = T)
colnames(e1) <- c("Group", "no.Users", "no.Chat")
e1 = e1[order(e1$no.Chat, decreasing = T),]
e1$"User/total" = e1[2]/length(unique(Age13.17$Userid))




View(e1)


plot(1:nrow(e1), e$no.Users, type="o", axes=F)
axis(1, at=seq(1,nrow(e1), by=1), labels=e1$Group )


############################################################## 
###############################  Here ########################
############################################################## 
#so lieu
index.other = which(a$other %in% c(1))


other = Age13.17[index.other,]
head(other)
other.count = count(other,c("Userid", "Stickerid"))
f=data.frame(sort(table(other.count$Stickerid),T))
g =data.frame(sort(table(other$Stickerid),T))

h=merge(f,g,by=1,all=T)
colnames(h) <- c("Stickerid", "no.Users", "no.Chat")
h=h[order(h$no.Users,decreasing = T),]
lables.other = unique(other$Userid)
h$"User/total" = h[[2]]/length(lables.other)

View(h)
labels1= unlist(labels(table(result$Stickerid )))
plot(1:nrow(e), e[[2]])
axis(1, at=seq(1,length(table(result$Stickerid)), by=1), labels=labels1)



#IsMAle
other.count = count(other,c("Userid", "Stickerid", "IsMale", "Age"))
f=data.frame(sort(table(other.count$IsMale),T))
g =data.frame(sort(table(other$IsMale),T))

h=merge(f,g,by=1,all=T)
colnames(h) <- c("IsMale", "no.Users", "no.Chat")
h=h[order(h$no.Users,decreasing = T),]
lables.other = unique(other$Userid)
h$"User/total" = h[2]/sum(f[2])








############################# have chat

# 26-7
list.group = list()
number.of.group = c()

index = list()

#initial values
for (i in 1:(length(Group.list)))
{
  list.group[[i]] = rep(0, nrow(Age13.17.h))
}

for (i in 1:length(Group.list))
{#i=1
  index[[i]] = which(Age13.17.h$Stickerid %in% Group.list[[i]])
  list.group[[i]][index[[i]]] = 1
  number.of.group[i] = length(subset(list.group[[i]],list.group[[i]] ==1 ))
}

a=Reduce(function(x,y){cbind.data.frame(x,y)}, x = list.group )
a$other =  apply(a, 1, sum)
a$other = ifelse(a$other == 0, 1, 0)


View(Age13.17.h)

b = apply(a, 2, sum)

plot(b)
c= cbind.data.frame(b, c(label.group, "other"))
c=c[order(c$b, decreasing = T),]
d=c


######## no.user
b4=c()

for (i in 1:(length(Group.list)+1))
{
  b3= Age13.17.h[a[[i]] == 1,]
  b4[i] = length(unique(b3$Userid))
  
}


c2= cbind.data.frame(b4, c(label.group, "other"))
c2=c2[order(c2$b4, decreasing = T),]





e=merge(c2,d, by=2, all = T)
colnames(e) <- c("Group", "no.Users", "no.Chat")
e = e[order(e$no.Chat, decreasing = T),]
e$"User/total" = e[2]/length(unique(Age13.17.h$Userid))




View(e)




############################################################## 
###############################  Here ########################
############################################################## 
#so lieu
index.other = which(a$other %in% c(1))


other = Age13.17.h[index.other,]
head(other)
other.count = count(other,c("Userid", "Stickerid"))
f=data.frame(sort(table(other.count$Stickerid),T))
g =data.frame(sort(table(other$Stickerid),T))

h=merge(f,g,by=1,all=T)
colnames(h) <- c("Stickerid", "no.Users", "no.Chat")
h=h[order(h$no.Users,decreasing = T),]
lables.other = unique(other$Userid)
h$"User/total" = h[[2]]/length(lables.other)

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







e_no_and_have = cbind.data.frame(e1, e)

per_other_no = e_no_and_have[[2]]/e_no_and_have[[2]][1]
per_other_have = e_no_and_have[[6]]/e_no_and_have[[6]][1]
e.new = e_no_and_have[1]
e.new = cbind.data.frame(e.new,per_other_no )
e2=cbind.data.frame(e_no_and_have[5],per_other_have)
e.new = merge(e.new, e2, by = 1, all = T)
e.new=e.new[order(e.new$per_other_have, decreasing = T),]

plot(1:nrow(e.new), e.new[[2]], type="o", axes=F)
axis(1, at=seq(1,nrow(e.new), by=1), labels=e.new[[1]] )

lines(1:nrow(e.new), e.new[[3]], type="o", axes=F, col=2)
# axis(1, at=seq(1,nrow(e.new), by=1), labels=e.new[[1]] )
