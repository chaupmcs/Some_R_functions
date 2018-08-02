input_d1 = read.table("feature_d1_label_2016-01-15_header.txt", header = TRUE)
input_d3 = read.table("feature_d3_label_2016-01-15_header.txt", header = TRUE)
input_d5 = read.table("feature_d5_label_2016-01-15_header.txt", header = TRUE)

act_d135 = cbind.data.frame(d1$action_download_sticker, d3$action_download_sticker, d5$action_download_sticker)
colnames(act_d135) <- c("act_d1", "act_d3", "act_d5")
#adjust data - del ID cols
d1 <- input_d1[,-c(1,8,15,23,30)]
d3 <- input_d3[,-c(1,8,15,23,30)]
d5 <- input_d5[,-c(1,8,15,23,30)]

d1_sticker = cbind.data.frame(d1$day_download_sticker,d1$action_download_sticker)
colnames(d1_sticker) <- c("day_down", "action_down")
have_down = d1_sticker[d1_sticker$day_down ==1,]


#all data d1
action_down_factor <- as.factor(as.numeric(d1_sticker$action_down ))
summary(action_down_factor)


#just have down
action_down_factor <- as.factor(as.numeric(have_down$action_down ))
summary(action_down_factor)

#draw 
plot(table(action_down_factor))

colnames(d1)


##### d3
d3_sticker = cbind.data.frame(d3$day_download_sticker,d3$action_download_sticker)
colnames(d3_sticker) <- c("day_down", "action_down")
have_down_3 = d3_sticker[d3_sticker$day_down >=1,]

#all data d3
action_down_factor_3 <- as.factor(as.numeric(d3_sticker$action_down ))
summary(action_down_factor_3)


action_down_factor_3 <- as.factor(as.numeric(have_down_3$action_down ))
summary(action_down_factor_3)

#draw 
plot(table(action_down_factor_3))




act_d1_d3 = cbind.data.frame(d1$action_download_sticker,d3$action_download_sticker)

sub_act_d1d3  = data.frame(as.numeric(d3$action_download_sticker) - as.numeric(d1$action_download_sticker))
colnames(sub_act_d1d3) <- c("sub")

sub_act_d1d3_positive = data.frame(sub_act_d1d3[as.numeric(sub_act_d1d3$sub) > 0,])
nrow(sub_act_d1d3_positive)/nrow(sub_act_d1d3) #0.064501
# note: just 0.0645 people keep on downloading stickers


############## d5

d5_sticker = cbind.data.frame(d5$day_download_sticker,d5$action_download_sticker)
colnames(d5_sticker) <- c("day_down", "action_down")
have_down_5 = d5_sticker[d5_sticker$day_down >=1,]

#all data d5
action_down_factor_5 <- as.factor(as.numeric(d5_sticker$action_down ))
summary(action_down_factor_5)

action_down_factor_5 <- as.factor(as.numeric(have_down_5$action_down ))
summary(action_down_factor_5)

#draw 
plot(table(action_down_factor_5))




act_d1_d5 = cbind.data.frame(d1$action_download_sticker,d5$action_download_sticker)

sub_act_d1d5  = data.frame(as.numeric(d5$action_download_sticker) - as.numeric(d1$action_download_sticker))
colnames(sub_act_d1d5) <- c("sub")

sub_act_d1d5_positive = data.frame(sub_act_d1d5[as.numeric(sub_act_d1d5$sub) > 0,])
nrow(sub_act_d1d5_positive)/nrow(sub_act_d1d5) #0.09214697
### note: just 0.0921 people keep on downloading stickers, 
# after downloading stickers for the first time, most of users dont down sticker anymore


############################ end d5



######## consider on NO down at the first day




no_down_d1 = act_d135[act_d135$act_d1 == 0,]

num_down_d3 = no_down_d1[no_down_d1$act_d3 > 0,]

# percent number of users start down on d3
nrow(num_down_d3)/nrow(no_down_d1)#0.05246772

#
act_factor_d3 <- as.factor(as.numeric(num_down_d3$act_d3 ))
summary(act_factor_d3)
plot(table(act_factor_d3))



# d3 and d5
no_down_d3 = act_d135[act_d135$act_d3 == 0,]
num_down_d5 = no_down_d3[no_down_d3$act_d5 > 0,]

# percent number of users start down on d5
nrow(num_down_d5)/nrow(no_down_d3)#0.025717

#
act_factor_d5 <- as.factor(as.numeric(num_down_d5$act_d5))
summary(act_factor_d5)
plot(table(act_factor_d5))


mean(as.numeric(have_down$action_down))
mean(as.numeric(have_down_3$action_down))
mean(as.numeric(have_down_5$action_down))

colnames(d1)
d135 = cbind.data.frame(d1[,c(22,26,27,28,29)], d3[,c(22,26,27,28,29)], d5[,c(22,26,27,28,29,37,38)])
colnames(d135) = c("Msg_1", "msg_chat_sticker_1", "day_chat_sticker_1", "action_download_sticker_1", "day_download_sticker_1",
                   "Msg_3", "msg_chat_sticker_3", "day_chat_sticker_3", "action_download_sticker_3", "day_download_sticker_3" ,
                   "Msg_5", "msg_chat_sticker_5", "day_chat_sticker_5", "action_download_sticker_5", "day_download_sticker_5",
                   "msg_week2", "day_chat_w2" )


d1_0 = data.frame(d135[d135$action_download_sticker_1 == 0,])
d1_1 = data.frame(d135[d135$action_download_sticker_1 >0,])

d1_01 = d135
d1_01$class = 1
d1_01[d1_01$action_download_sticker_1==0,]$class = 0

View(d1_0)
View(data.frame(d1_0$msg_chat_sticker_1))
mean(d1_0$msg_chat_sticker_1)
mean(d1_0$Msg_1)
plot(d1_0$Msg_1)

mean(d1_1$msg_chat_sticker_1)
mean(d1_1$Msg_1)
plot(d1_1$Msg_1)

library(ggplot2)
qplot(d1_01$msg_chat_sticker_1, d1_01$Msg_1, color = class,  data = d1_01)



d1_0_Msg_1_factor <- as.factor(as.numeric(d1_0$Msg_1 ))
summary(d1_0_Msg_1_factor)
plot(table(d1_0_Msg_1_factor), "h")

d1_1_Msg_1_factor <- as.factor(as.numeric(d1_1$Msg_1 ))
summary(d1_1_Msg_1_factor)
plot(table(d1_1_Msg_1_factor), "h")




d1_0_msg_chat_sticker_factor <- as.factor(as.numeric(d1_0$msg_chat_sticker_1 ))
summary(d1_0_msg_chat_sticker_factor)
plot(table(d1_0_msg_chat_sticker_factor), "h")

d1_1_msg_chat_sticker_factor <- as.factor(as.numeric(d1_1$msg_chat_sticker_1 ))
summary(d1_1_msg_chat_sticker_factor)
plot(table(d1_1_msg_chat_sticker_factor), "h")

d1_1_have_down_on_d3 = d1_1[(d1_1$action_download_sticker_3 - d1_1$action_download_sticker_1) >0,]
nrow(d1_1_have_down_on_d3)/ nrow(d1_1)

d1_1_have_down_on_d3_and_d5 = d1_1_have_down_on_d3[d1_1_have_down_on_d3$action_download_sticker_5 -d1_1_have_down_on_d3$action_download_sticker_3 >0,]
nrow(d1_1_have_down_on_d3_and_d5)/ nrow(d1_1_have_down_on_d3)

View(d1_1_have_down_on_d3)


down_start_at_d5 = d135[d135$action_download_sticker_5-d135$action_download_sticker_3 > 0,]
nrow(down_start_at_d5)/nrow(d135)



#### 
#down_d1: the numbers of users down stickers on d1 day
down_d1 = d135[d135$action_download_sticker_1>=1,]
nrow(down_d1)/nrow(d135)

down_d3 = d135[d135$action_download_sticker_3 - d135$action_download_sticker_1>=1,]
nrow(down_d3)/nrow(d135)

down_d5 = d135[d135$action_download_sticker_5 - d135$action_download_sticker_3>=1,]
nrow(down_d5)/nrow(d135)


### keep downloading ?
down_d1_ongoing <- down_d1[down_d1$action_download_sticker_3 - down_d1$action_download_sticker_1 > 0,]
nrow(down_d1_ongoing)/nrow(down_d1)

down_d3_ongoing <- down_d3[down_d3$action_download_sticker_5 - down_d3$action_download_sticker_3 > 0,]
nrow(down_d3_ongoing)/nrow(down_d3)

down_d1_ongoing <- down_d1[down_d1$action_download_sticker_3 - down_d1$action_download_sticker_1 > 0,]
nrow(down_d1_ongoing)/nrow(down_d1)



down_d123 = d135[d135$action_download_sticker_5>=1,]
nrow(down_d123)/53317

down_d1 = d135[d135$action_download_sticker_1 >=1,]
down_d23 =d135[d135$action_download_sticker_3 - d135$action_download_sticker_1 >=1,] 
nrow(down_d1)
nrow(down_d23)

nrow(down_d5)/nrow(d135) + nrow(down_d3)/nrow(d135) + nrow(down_d1)/nrow(d135)

######


plot(table(as.factor(as.numeric(down_d1$action_download_sticker_1))))

down_d1$class = 0
down_d1[down_d1$action_download_sticker_1>2,]$class = 1

h_down_d1 = down_d1[down_d1$action_download_sticker_1 > 2,]
l_down_d1 = down_d1[down_d1$action_download_sticker_1 <= 2,]

super_h_d1 = down_d1[down_d1$action_download_sticker_1 > 5,]
nrow(h_down_d1) / nrow(down_d1)

qplot(l_down_d1$msg_chat_sticker_1, l_down_d1$Msg_1, color = class,  data = l_down_d1)
qplot(h_down_d1$msg_chat_sticker_1, h_down_d1$Msg_1, color = class,  data = h_down_d1)

qplot(down_d1$msg_chat_sticker_1, down_d1$Msg_1, color = class,  data = down_d1)

h_d1_ongoing =h_down_d1[h_down_d1$action_download_sticker_3 - h_down_d1$action_download_sticker_1 >0,] 
nrow(h_d1_ongoing) / nrow(h_down_d1)

l_d1_ongoing =l_down_d1[l_down_d1$action_download_sticker_3 - l_down_d1$action_download_sticker_1 >0,] 
nrow(l_d1_ongoing) / nrow(l_down_d1)

super_d1_ongoing =super_h_d1[super_h_d1$action_download_sticker_3 - super_h_d1$action_download_sticker_1 >0,] 
nrow(super_d1_ongoing) / nrow(super_h_d1)
super_d1_d3_ongoing =  super_d1_ongoing[super_d1_ongoing$action_download_sticker_5 - super_d1_ongoing$action_download_sticker_3 >0,] 
nrow(super_d1_d3_ongoing) / nrow(super_d1_ongoing)

down_1_day = d135[d135$day_download_sticker_5 ==1,]
down_more_2_day = d135[d135$day_download_sticker_5 >1,]

d135$daydown = 0
d135[d135$day_download_sticker_5>2 ]$daydown = 1

d135$actdown = 0
d135[d135$action_download_sticker_5 > 2, ]$actdown = 1

d135$day_act = 0
d135[d135$day_download_sticker_5 >2 & d135$action_download_sticker_5 > 2, ]$day_act = 1

plot(table(as.factor(as.numeric(d135$day_download_sticker_5))))

qplot(d135$msg_chat_sticker_5, d135$Msg_5, color = d135$daydown,  data = d135)
qplot(d135$msg_chat_sticker_5, d135$Msg_5, color = d135$actdown,  data = d135)
qplot(d135$msg_chat_sticker_5, d135$Msg_5, color = d135$day_act,  data = d135)

table(as.factor(as.numeric(d135$msg_chat_sticker_5)))

library(ranger)

