input = read.csv("strong_increasing_11-7-2016.csv") #8286


### we divide the data into 3 parts again, but this time, by comment field
  # almost.no.comment:  13/6 -26/6:  < 2 comment
  # still.comment.alot : 13/6 -26/6 comment still the same amount as peak weak (2 weeks ago_30/5-5/6/2016)
  # nomal.comment: the others

almost.no.comment  = input[input$X20.6...26.6.com + input$X13.6...19.6.com <=2,] #3122
still.comment.alot = input[input$X20.6...26.6.com + input$X13.6...19.6.com >= 10 ,] #3139
nomal.comment = input[input$X20.6...26.6.com + input$X13.6...19.6.com >2
                      & input$X20.6...26.6.com + input$X13.6...19.6.com <10,] #2025



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

link = "/R_project_Chau/timeseries_new_cDung/data_comment/"

#apply for "almost.no.comment" group: 
result.almost.no.comment = multi.Merge(link, almost.no.comment)

#apply for "still.comment.alot" group: 
result.still.comment.alot = multi.Merge(link, still.comment.alot)

#apply for "nomal.comment":
result.nomal.comment = multi.Merge(link, nomal.comment)




### day_names
filename= list.files(path=link, full.names=F)

days = gsub("^.*_","",filenames)

# wirte the result into file
result.table =
  cbind.data.frame(days
                  ,result.almost.no.comment$total, result.almost.no.comment$number_users, result.almost.no.comment$mean
                  ,result.nomal.comment$total, result.nomal.comment$number_users, result.nomal.comment$mean
                  ,result.still.comment.alot$total, result.still.comment.alot$number_users, result.still.comment.alot$mean
                  )

write.csv(result.table, "result_comment_11-7.csv" , row.names = F)
