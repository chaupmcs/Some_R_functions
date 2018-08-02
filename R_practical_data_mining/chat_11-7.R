input = read.csv("chat_strong_increasing_11-7-2016.csv") #30640

summary(input)

### we divide the data into 3 parts 
  # almost.no.chat
  # still.chat.alot
  # normal.chat

almost.no.chat  = input[input$X20.6...26.6.cha + input$X13.6...19.6.cha <=2,] #5385
still.chat.alot = input[input$X20.6...26.6.cha + input$X13.6...19.6.cha >= 20 ,] #19230
nomal.chat = input[input$X20.6...26.6.cha + input$X13.6...19.6.cha >2
                      & input$X20.6...26.6.cha + input$X13.6...19.6.cha <20,] #6025


####### get some information

# function 
multi.Merge <- function(link, ID.File)
{
  filenames=list.files(path=link, full.names=TRUE) #get filename list - just filenames 
  datalist = lapply(filenames, function(x){read.table(file=x)}) #get content of each file
  mergelist = list()
  total = c()
  number_users = c()
  mean = c()
  age = c()
  n.col = ncol(ID.File) + ncol(datalist[[1]]) -1
  for (i in 1:length(datalist))
  {
    mergelist[[i]] = merge(ID.File, datalist[[i]], by=1, all.x=T)
    total[i] = sum(mergelist[[i]][[n.col]], na.rm = T)
    number_users[i] = nrow(na.omit(mergelist[[i]]))
    mean[i] =  total[i] /  number_users[i]
  }
  result  = list("total" = total, "number_users" = number_users, "mean" = mean) #save result here
  
  return(result)
}

## apply the funct:
#first, we need to set a link to the folder:

link = "/R_project_Chau/timeseries_new_cDung/data_chat/"

#apply for "almost.no.comment" group: 
almost.no = multi.Merge(link, almost.no.chat)

#apply for "still.comment.alot" group: 
still.alot = multi.Merge(link, still.chat.alot)

#apply for "nomal.comment":
nomal = multi.Merge(link, nomal.chat)




### day_names
filenames= list.files(path=link, full.names=F)

days = gsub("^.*_","",filenames)

### wirte the result into file
#table almost.no
table_almost.no = cbind.data.frame(days, almost.no$total, almost.no$number_users, almost.no$mean)
table_almost.no$class = "almost.no"
colnames(table_almost.no) = c("day", "total", "numberUsers","mean", "class")

#table normal
table_normal = cbind.data.frame(days, nomal$total, nomal$number_users, nomal$mean)
table_normal$class = "normal"
colnames(table_normal) = c("day", "total", "numberUsers","mean", "class")

#still.alot
table_still.alot = cbind.data.frame(days, still.alot$total, still.alot$number_users, still.alot$mean)
table_still.alot$class = "still.alot"
colnames(table_still.alot) =  c("day", "total", "numberUsers","mean", "class")

result.table =  rbind.data.frame(table_almost.no, table_normal, table_still.alot)
                  

write.csv(result.table, "result_3_timeseries_11-7.csv" , row.names = F)
