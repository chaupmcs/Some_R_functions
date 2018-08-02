# read input  3-15-2016
chat = read.table("summary_chat_sticker_2016-03-15.txt", header = T, sep = "")
down = read.table("summary_download_2016-03-15.txt", header = T, sep = "")

# fix format for stickerID
chat.stickerID =as.character(chat$Stickerid)
fix_format_chat.stickerID =gsub("\\|.*", '', chat.stickerID)
chat$Stickerid = fix_format_chat.stickerID #replace with fix values

write.csv(chat, "summary_chat_sticker_2016-03-15_edit.csv", row.names = F)
write.csv(down, "summary_down_sticker_2016-03-15_edit.csv", row.names = F)


plot(sort(table(chat$Cateid), T)[1:10])

