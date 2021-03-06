### divide the data into three parts
# decreasing chat
# stable
# almost quit 

#############
ana = read.csv("ana_split_add_chat_cols.csv")
alot_2 = ana[(ana$X9.5...15.5.cha) / (ana$X2.5...8.5.cha) > 2 & (ana$X9.5...15.5.cha) > 10,]
profile = read.csv("fb_chat_location_profile_v2.txt", sep="")
alot_2 =  merge(alot_2, profile, by =1, all.x=T)

summary(alot_2)
alot_2 =na.omit(alot_2)

stable =SG
almost_noChat = HN
slightly = noChat_next_2_week


########## phan tich stable

link = "/R_project_Chau/timeseries_new_cDung/data_chat/"

# we consider the data from 16/5 till the end to decide whether users are belong which group
filenames=list.files(path=link, full.names=TRUE)

#just look at 16/5 till now
filenames = filenames #52days

datalist = lapply(filenames, function(x){read.table(file=x)})
s_merge_f = list()
s_sum_eachday = c()
s_number_users = c()
s_mean_chat = c()

for (i in 1:length(datalist))
{
  s_merge_f[[i]] = merge(stable, datalist[[i]], by=1, all.x=T)
  s_sum_eachday[i] = sum(s_merge_f[[i]][[39]], na.rm = T)
  s_number_users[i] = nrow(na.omit(s_merge_f[[i]]))
  s_mean_chat[i] = s_sum_eachday[i] /  s_number_users[i]
}

########## no chat

link = "/R_project_Chau/timeseries_new_cDung/data_chat/"

# we consider the data from 16/5 till the end to decide whether users are belong which group
filenames=list.files(path=link, full.names=TRUE)

#just look at 16/5 till now
filenames = filenames #52days

datalist = lapply(filenames, function(x){read.table(file=x)})
n_merge_f = list()
n_sum_eachday = c()
n_number_users = c()
n_mean_chat = c()

for (i in 1:length(datalist))
{
  n_merge_f[[i]] = merge(almost_noChat, datalist[[i]], by=1, all.x=T)
  n_sum_eachday[i] = sum(n_merge_f[[i]][[39]], na.rm = T)
  n_number_users[i] = nrow(na.omit(n_merge_f[[i]]))
  n_mean_chat[i] =  n_sum_eachday[i] /  n_number_users[i]
}


################# slightly

link = "/R_project_Chau/timeseries_new_cDung/data_chat/"

# we consider the data from 16/5 till the end to decide whether users are belong which group
filenames=list.files(path=link, full.names=TRUE)

#just look at 16/5 till now
filenames = filenames #52days

datalist = lapply(filenames, function(x){read.table(file=x)})
sli_merge_f = list()
sli_sum_eachday = c()
sli_number_users = c()
sli_mean_chat = c()

for (i in 1:length(datalist))
{
  sli_merge_f[[i]] = merge(slightly, datalist[[i]], by=1, all.x=T)
  sli_sum_eachday[i] = sum(sli_merge_f[[i]][[39]], na.rm = T)
  sli_number_users[i] = nrow(na.omit(sli_merge_f[[i]]))
  sli_mean_chat[i] =  sli_sum_eachday[i] /  sli_number_users[i]
}

##########
########

daynames = list.files(path=link, full.names=F)

day = gsub("^.*_","",daynames)

data_3parts_HN_SG = cbind.data.frame(day,s_sum_eachday, s_number_users, s_mean_chat
                               ,n_sum_eachday, n_number_users, n_mean_chat
                               , sli_sum_eachday, sli_number_users, sli_mean_chat
)
colnames(data_3parts_HN_SG ) <- c("day","totalMSG_SG", "Total_Users_SG", "MSG_per_User_SG"
                               ,"totalMSG_HN", "Total_Users_HN", "MSG_per_User_HN"
                                  , "totalMSG", "Total_Users", "MSG_per_User")

write.csv(data_3parts_HN_SG, "data_3parts_HN_SG.csv", row.names = F)


sort(table(stable$unknown), T)
plot(sort(table(stable$unknown), T)[1:10])

sort(table(slightly$unknown), T)
plot(sort(table(slightly$unknown), T)[1:10])

sort(table(almost_noChat$unknown), T)
plot(sort(table(almost_noChat$unknown), T)[1:10])



sort(table(stable$X0), T)
plot(sort(table(stable$X0), T))

sort(table(slightly$X0), T)
plot(sort(table(slightly$X0), T))

sort(table(almost_noChat$X0), T)
plot(sort(table(almost_noChat$X0), T))




sort(table(stable$X37), T)
plot(sort(table(stable$X37), T)[1:15])

sort(table(slightly$X37), T)
plot(sort(table(slightly$X37), T)[1:15])

sort(table(almost_noChat$X37), T)
plot(sort(table(almost_noChat$X37), T)[1:15])


HCM = almost_noChat[almost_noChat$unknown == "ho_chi_minh",]
sort(table(HCM$X37), T)
plot(sort(table(HCM$X37), T))

HN = almost_noChat[almost_noChat$unknown == "ha_noi",]
sort(table(HN$X37), T)
plot(sort(table(HN$X37), T))


noChat_next_2_week = alot_2[alot_2$X13.6...19.6.cha + alot_2$X20.6...26.6.cha < 2,]
sort(table(noChat_next_2_week$X37), T)
plot(sort(table(noChat_next_2_week$X37), T))


HN = noChat_next_2_week[noChat_next_2_week$unknown == "ha_noi",]
sort(table(HN$X37), T)
plot(sort(table(HN$X37), T)[1:20])



SG = noChat_next_2_week[noChat_next_2_week$unknown == "ho_chi_minh",]
sort(table(SG$X37), T)
plot(sort(table(SG$X37), T)[1:20])
