down = read.csv("summary_down_sticker_2016-03-15_edit.csv")
View(down)

down.eachday = split(down, down$Date)

splip.user = lapply(down.eachday, function(x){ split(x, x$Userid)})


splip.user$`2016-03-15`
nrow.split = lapply(split.user, function(x){ nrow(x)})
nrow.split = as.numeric(nrow.split)

table(nrow.split)
down[down$Userid==171062542,]
