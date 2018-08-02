
# mergeing function 
multmerge = function(link){
  filenames=list.files(path=link, full.names=TRUE)
  datalist = lapply(filenames, function(x){read.table(file=x)})
  Reduce(function(x,y) {merge(x,y, by=1, all=T)}, datalist)
}


#parameters for the funct
link_comment = "/R_project_Chau/timeseries_new_cDung/data_comment/"
link_home = "/R_project_Chau/timeseries_new_cDung/data_homefeed/"
link_like = "/R_project_Chau/timeseries_new_cDung/data_like/"
link_photo = "/R_project_Chau/timeseries_new_cDung/data_photo/"
link_status = "/R_project_Chau/timeseries_new_cDung/data_status/"
link_chat = "/R_project_Chau/timeseries_new_cDung/data_chat/"

#mergeing...
comment <- multmerge(link_comment)
home <- multmerge(link_home)
like <- multmerge(link_like)
photo <- multmerge(link_photo)
status <- multmerge(link_status)
chat <- multmerge(link_chat)

## now, we make a new col from 7 old cols (calculate amount in one week)
# first thing first: initial data 
w_com = data.frame(comment[,1])
w_hom =data.frame(home[,1])
w_lik = data.frame(like[,1])
w_pho = data.frame(photo[,1])
w_sta = data.frame(status[,1])
w_cha = data.frame(chat[,1])

i = 2
count = 2
while (i<=113)
{
  w_com[[count]] = rowSums(comment[, i:(6+i)], na.rm = T)
  w_hom[[count]] = rowSums(home[, i:(6+i)], na.rm = T)
  w_lik[[count]] = rowSums(like[, i:(6+i)], na.rm = T)
  w_pho[[count]] = rowSums(photo[, i:(6+i)], na.rm = T)
  w_sta[[count]] = rowSums(status[, i:(6+i)], na.rm = T)
  w_cha[[count]] = rowSums(chat[, i:(6+i)], na.rm = T)
  
  i = i + 7
  count = count + 1
}

#after megering, we need changing the col's names
name = c("7/3 - 13/3","14/3 - 20/3","21/3 - 27/3","28/3 - 3/4","4/4 - 10/4", "11/4 - 17/4"
         , "18/4 - 24/4","25/4 - 1/5", "2/5 - 8/5", "9/5 - 15/5","16/5 - 22/5"
         ,"23/5 - 29/5","30/5 - 5/6", "6/6 - 12/6","13/6 - 19/6", "20/6 - 26/6")

#name the columns
colnames(w_com) =
  colnames(w_hom) =
    colnames(w_lik) =
      colnames(w_pho) =
        colnames(w_sta) =
          colnames(w_cha) = c("ID", name)
                          

#list files to merge into one file named "data", now on 
files = list(w_hom, w_com, w_lik, w_pho, w_sta, w_cha)

data = w_hom #initial

for (i in 2:6)
{
  data = merge(data, files[[i]], by=1, all=T)  
}


#adjust names for the cols of data
name_hom = paste(name,"hom",sep = " ") 
name_com = paste(name,"com",sep = " ")
name_lik = paste(name,"lik",sep = " ") 
name_cha = paste(name,"cha",sep = " ")
name_pho = paste(name,"pho",sep = " ") 
name_sta = paste(name,"sta",sep = " ")
cols_data_names = c("ID",name_hom, name_com, name_lik, name_pho, name_sta, name_cha)
colnames(data) = cols_data_names

#test cor 
library(caret)
data[is.na(data)] <- 0
cormatrix = cor(data)
highlyCorrelated <- findCorrelation(cormatrix,verbose = TRUE, cutoff=0.75)

# another cor test

library(corrplot)
cor_func <- function(nameOfData)
{
  corrplot(cor(nameOfData), type="upper", order="hclust", tl.col="black", tl.srt=45, method = "number")
}

#write data
write.csv(data, "/R_project_Chau/timeseries_new_cDung/data_6_7_edit_name.csv", row.names = F)

#####################################
input = data

#data to analyst
ana_data = input[c(1,10,11, 26,27, 42,43,58,59,74,75,90,91)] 

#increasing data 
growUp = ana_data[ana_data$`9/5 - 15/5 hom` - ana_data$`2/5 - 8/5 hom` > 0, ]

profile = read.csv("fb_chat_location_profile.txt", sep="")

#merge GrowUp and profile
growUp_profile = merge(growUp, profile, by =1, all.x=T)


summary(growUp_profile)
#clear NA
growUp_profile =na.omit(growUp_profile)


h_com = growUp_profile[growUp_profile$`9/5 - 15/5 com` >2,] 
l_com = growUp_profile[growUp_profile$`9/5 - 15/5 com` <=2,] 


View(h_com)
summary(h_com)
summary(l_com)





## we divide the growUp data into 2 parts, "alittle", "alot"
superlot = growUp_profile[growUp_profile$`9/5 - 15/5 cha`/growUp_profile$`2/5 - 8/5 cha` >6,]
alot = growUp_profile[growUp_profile$`9/5 - 15/5 cha`/growUp_profile$`2/5 - 8/5 cha` >2,]
alittle = growUp_profile[growUp_profile$`9/5 - 15/5 cha`/growUp_profile$`2/5 - 8/5 cha` <= 2,]

cor_func(alot[,-c(16,15,14,1)])
cor_func(alittle[,-c(16,15,14,1)])

summary(alot)
summary(alittle)

local_alot = sort(table(alot$unknown), decreasing = T)
plot(local_alot)
local_alot

local_alittle = sort(table(alittle$unknown), decreasing = T)
plot(local_alittle)
local_alittle

local_superlot = sort(table(superlot$unknown), decreasing = T)
plot(local_superlot)

local_superlot
local_alittle
local_alot

local_alot = sort(table(alot$X0), decreasing = T)
plot(local_alot)
local_alot

local_alittle = sort(table(alittle$X0), decreasing = T)
plot(local_alittle)
local_alittle

local_superlot = sort(table(superlot$X0), decreasing = T)
plot(local_superlot)





local_alot = sort(table(alot$X37), decreasing = T)
plot(local_alot[1:20])
local_alot

local_alittle = sort(table(alittle$X37), decreasing = T)
plot(local_alittle[1:20])
local_alittle

local_superlot = sort(table(superlot$X37), decreasing = T)
plot(local_superlot[1:20])


cor_func(alot)
cor_func(alittle)

plot(table(alot$X0))



