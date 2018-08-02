m3 =  read.csv("fb_2806_ver2_2016-03-31_2016-03-01",sep="")
m4= read.csv("fb_2806_ver2_2016-04-30_2016-04-01",sep="")
m5 = read.csv("fb_2806_ver2_2016-05-31_2016-05-01",sep="")
m6 = read.csv("fb_2806_ver2_2016-06-26_2016-06-01",sep="")


#ordered
da3 = m3[order(m3$date),]
da4 = m4[order(m4$date),]
da5 = m5[order(m5$date),]
da6 = m6[order(m6$date),]

#merge 4 months into 1 file
data = rbind.data.frame(da3, da4, da5, da6)

data$homefeed <- 0
data$status <-0
data$photo<- 0
data$comment<- 0
data$like<-0
data$chat<- 0

for (i in 1:6)
{
  data[[14+i]]=data[[2*i+2]]/data[[2*i+1]]
}

View(data)


library(xlsx)
write.xlsx(data, "D:/mydata_ave.xlsx")

i=3

data_ts = ts(data[,i], frequency = 7, start = c(3,1))
plot(data_ts, main = names(data[i])) 
i = i+1

j = 3

photo = data[j]
photo_ts = ts(photo, frequency = 7, start = c(3,1))

photo_decom = decompose(photo_ts)
plot(photo_decom)
photo_decom$figure
# plot(2:8,photo_decom$figure, type="o")
j=j+1



#merger multi files into one file  
  setwd("D:/R_project_Chau/timeseries_new_cDung/data")
  
  file_list <- list.files()
  dataset = NULL
  for (file in file_list){
    
    # if the merged dataset doesn't exist, create it
   
      temp_dataset <-read.table(file, header=F, sep="\t")
      dataset<-merge.data.frame(dataset, temp_dataset, by = dataset[[1]])
      rm(temp_dataset)
  }
  
  chat_10_5 = read.table("chat_fb_2016-05-10", header = F)
  chat_11_5 = read.table("chat_fb_2016-05-11", header = F)
  chat_12_5 = read.table("chat_fb_2016-05-12", header = F)
  chat_13_5 = read.table("chat_fb_2016-05-13", header = F)
  chat_14_5 = read.table("chat_fb_2016-05-14", header = F)
  chat_15_5 = read.table("chat_fb_2016-05-15", header = F)
  chat_14___15 = merge(chat_14_5, chat_15_5, by= 1 , all = T) 
  
  
  
  multmerge = function(mypath){
    filenames=list.files(path=mypath, full.names=TRUE)
    datalist = lapply(filenames, function(x){read.csv(file=x,header=F)})
    Reduce(function(x,y) {merge(x,y)}, datalist)
  }
multmerge("D:/R_project_Chau/timeseries_new_cDung/data")
  
  
 