input = read.csv("/home/chauuser/KienThuc/Crawl_AAO-Grade/MT13.csv", header = TRUE, skip = 1)
View(input)

#merge holot and ten column to hovaten
  # option 1
    #library(tidyr)
    #input2 = unite(input, hovaten, c(holot, ten), remove=F)
  
  # option 2
input_merged = transform(input, hovaten=paste(holot, ten, sep=" ")) # or we can use: a= paste(input$holot, input$ten, sep = " ")

Names = input_merged$hovaten
Names
IDs =input_merged$f_masv
View(Names)
View(IDs)
write.table(IDs, "KienThuc/Crawl_AAO-Grade/MT13KHTN/IDs.txt", row.names = F, col.names = F)
write.table(Names, "KienThuc/Crawl_AAO-Grade/MT13_ALL/Names.txt", row.names = F, col.names = F)
