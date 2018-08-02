data = read.csv("data_6_7_edit_name.csv", sep=",")

name = c("7/3 - 13/3","14/3 - 20/3","21/3 - 27/3","28/3 - 3/4","4/4 - 10/4", "11/4 - 17/4"
         , "18/4 - 24/4","25/4 - 1/5", "2/5 - 8/5", "9/5 - 15/5","16/5 - 22/5"
         ,"23/5 - 29/5","30/5 - 5/6", "6/6 - 12/6","13/6 - 19/6", "20/6 - 26/6")

#adjust names for the cols of data
name_hom = paste(name,"hom",sep = " ") 
name_com = paste(name,"com",sep = " ")
name_lik = paste(name,"lik",sep = " ") 
name_cha = paste(name,"cha",sep = " ")
name_pho = paste(name,"pho",sep = " ") 
name_sta = paste(name,"sta",sep = " ")
cols_data_names = c("ID",name_hom, name_com, name_lik, name_pho, name_sta, name_cha)
colnames(data) = cols_data_names


#####################################
input = data

#data to analyst
# ana_data = input[c(1,10,11, 26,27, 42,43,58,59,74,75,90,91)] 
ana_split = input 
View(ana_split)
write.csv(ana_split, "ana_split_add_chat_cols.csv", row.names = F)
#increasing data 
growUp = ana_data[ana_data$`9/5 - 15/5 cha` - ana_data$`2/5 - 8/5 cha` > 0, ]

# as.Date("2016_12_1", format ="%Y_%m_%d") > as.Date("2016_02_29",, format ="%Y_%m_%d" )

profile = read.csv("fb_chat_location_profile_v2.txt", sep="")

#merge GrowUp and profile
growUp_profile = merge(growUp, profile, by =1, all.x=T)

#clear NA
growUp_profile =na.omit(growUp_profile)
colnames(growUp_profile)[17] <- "reg_day" 

growUp_profile_reg = growUp_profile[as.Date(growUp_profile$reg_day, format ="%Y_%m_%d") 
                                <= as.Date("2016_02_29", format ="%Y_%m_%d" ),]

growUp_profile_drop = growUp_profile[as.Date(growUp_profile$reg_day, format ="%Y_%m_%d") 
                                    > as.Date("2016_02_29", format ="%Y_%m_%d" ),]

growUp_profile = growUp_profile_reg

alot = growUp_profile[growUp_profile$`9/5 - 15/5 cha`/growUp_profile$`2/5 - 8/5 cha` >2 ,]

write.csv(alot, "alot_8_7.csv",row.names = F)
alittle = growUp_profile[growUp_profile$`9/5 - 15/5 cha`/growUp_profile$`2/5 - 8/5 cha` <= 2,]
write.csv(alittle, "alittle_8_7.csv",row.names = F)
##############
summary(alot)
summary(alittle)

nrow(alot)
nrow(alittle)
# 
# local_alot = sort(table(alot$unknown), decreasing = T)
# plot(local_alot[1:5])
# local_alot
# 
# local_alittle = sort(table(alittle$unknown), decreasing = T)
# plot(local_alittle[1:5])
# local_alittle
# 
# local_alot = sort(table(alot$X0), decreasing = T)
# plot(local_alot)
# local_alot
# 
# local_alittle = sort(table(alittle$X0), decreasing = T)
# plot(local_alittle)
# local_alittle

################## read Time series 

i3 = read.csv("fb_2806_ver2_2016-03-31_2016-03-01", sep = "")
i4 = read.csv("fb_2806_ver2_2016-04-30_2016-04-01", sep = "")
i5 = read.csv("fb_2806_ver2_2016-05-31_2016-05-01", sep = "")
i6 = read.csv("fb_2806_ver2_2016-06-26_2016-06-01", sep = "")

i3_sort = i3[order(i3$date),]
i4_sort = i4[order(i4$date),]
i5_sort = i5[order(i5$date),]
i6_sort = i6[order(i6$date),]

i = rbind.data.frame(i3_sort, i4_sort, i5_sort, i6_sort)

i=i[-c(1:6),]

##########

link = "/R_project_Chau/timeseries_new_cDung/data_chat/"

id_list = alot

  filenames=list.files(path=link, full.names=TRUE)
  
  datalist = lapply(filenames, function(x){read.table(file=x)})
  m_alot = list()
  sum_alot = c()
  number_users = c()
  mean_chat = c()
    
  for (i in 1:length(datalist))
  {
    m_alot[[i]] = merge(id_list, datalist[[i]], by=1, all.x=T)
    sum_alot[i] = sum(m_alot[[i]][[18]], na.rm = T)
    number_users[i] = nrow(na.omit(m_alot[[i]]))
    mean_chat[i] =  sum_alot[i] /  number_users[i]
  }


number_users
mean_chat


id_list = alittle

  filenames=list.files(path=link, full.names=TRUE)
  
  datalist = lapply(filenames, function(x){read.table(file=x)})
  m_alit = list()
  sum_alit = c()
  number_users_alittle = c()
  mean_chat_alit = c()
  for (i in 1:length(datalist))
  {
    m_alit[[i]] = merge(id_list, datalist[[i]], by=1, all.x=T)
    sum_alit[i] = sum(m_alit[[i]][[18]], na.rm = T)
    number_users_alittle[i] = nrow(na.omit(m_alit[[i]]))
    mean_chat_alit[i] =   sum_alit[i] /  number_users_alittle[i]
  }


number_users_alittle
mean_chat_alit


# multmerge_high_order = function(link, id_list){  #just the same as "multmerge", but in the other way to implement
#  
#   filenames=list.files(path=link, full.names=TRUE)
#   datalist = lapply(filenames, function(x){read.table(file=x)})
#   sumlist = lapply(datalist, function(x) {sum(merge(id_list, x, by=1, all.x=T)[[18]], na.rm=T)})
# }

ts_alot = ts( sum_alot, frequency = 7)
alot_decom = decompose(ts_alot[])
plot(alot_decom)

ts_alittle =ts(sum_alit, frequency = 7)
alitlle_de = decompose(ts_alittle)
plot(alitlle_de)

filenames=list.files(path=link)


alot_t = cbind(file, sum_alot)
alittle_t = cbind(file, sum_alit)

file = gsub("^.*_","",filenames)
alot_and_alittle = cbind.data.frame(file, sum_alot, number_users, mean_chat, sum_alit, 
                                    number_users_alittle, mean_chat_alit)
colnames(alot_and_alittle) = c("day", "count_alot","number_users_alot", "mean_chat_alot",
                               "count_alittle" , "number_users_alittle", "mean_chat_alittle")
write.csv(alot_and_alittle, "/alot_alittle_9H26_8_7.csv", row.names = F)


########################
growUp = ana_split[ana_data$`9/5 - 15/5 cha` - ana_data$`2/5 - 8/5 cha` > 0, ]
growUp_profile = merge(growUp, profile, by =1, all.x=T)

#clear NA
growUp_profile =na.omit(growUp_profile)
colnames(growUp_profile)[18] <- "reg_day"
growUp_profile = growUp_profile[as.Date(growUp_profile$reg_day, format ="%Y_%m_%d") 
                                    <= as.Date("2016_02_29", format ="%Y_%m_%d" ),]

growUp_profile_quit = growUp_profile[growUp_profile$`16/5 - 22/5 cha` ==0,]
plot(sort(table(growUp_profile_quit$X37), T)[1:20])
