#read input 
input = read.csv("ana_split_add_chat_cols.csv")

#use data to analyse
ana_data = input

############## for comment:

#increasing data in peak weak
growUp = ana_data[ana_data$X9.5...15.5.com - ana_data$X2.5...8.5.com > 0,]

# as.Date("2016_12_1", format ="%Y_%m_%d") > as.Date("2016_02_29",, format ="%Y_%m_%d" )

profile = read.csv("fb_chat_location_profile_v2.txt", sep="")

#merge GrowUp and profile
growUp_pro = merge(growUp, profile, by =1, all.x=T)

#clear NA
growUp_pro =na.omit(growUp_pro)

#adjust col's names
colnames(growUp_pro)[(ncol(growUp_pro)-3):ncol(growUp_pro)] <- c("local","Gender","Age","reg_day")

#just work on old users
data_reg = growUp_pro[as.Date(growUp_pro$reg_day, format ="%Y_%m_%d") 
                      <= as.Date("2016_02_29", format ="%Y_%m_%d" ),]  #44596
#drop others
data_drop = growUp_pro[as.Date(growUp_pro$reg_day, format ="%Y_%m_%d") 
                       > as.Date("2016_02_29", format ="%Y_%m_%d" ),]  #3662

#analysing
comment_strong_increasing = data_reg[data_reg$X9.5...15.5.com - data_reg$X2.5...8.5.com > 5,]
write.csv(comment_strong_increasing, "comment_strong_increasing_11-7-2016.csv",row.names = F)




chat_strong_increasing = data_reg[data_reg$X9.5...15.5.cha - data_reg$X2.5...8.5.cha > 10,]
write.csv(chat_strong_increasing, "chat_strong_increasing_11-7-2016.csv",row.names = F)


