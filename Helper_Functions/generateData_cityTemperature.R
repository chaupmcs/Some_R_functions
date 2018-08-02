start_timer =  proc.time() #timer 

city_names = c("Toronto", "Whitby", "New York", "Rome", "Tokio", "Hue",
               "Ho Chi Minh", "Binh Dinh", "Quang Tri", "Singapore", "Bangkok")

NUMBERS_DATA = 24e6
temperatures = c(-5:40)

random_city_indice <- sample(length(city_names), NUMBERS_DATA, T)
random_temp_indice <- sample(length(temperatures), NUMBERS_DATA, T)

cities_data = city_names[random_city_indice]
temp_data = temperatures[random_temp_indice]

data = cbind.data.frame(cities_data, temp_data)

time_generating_data_stop =  proc.time() #end generating time

paste("Generated time is", (time_generating_data_stop - start_timer)[3])

#Write to file
write.table(data, sep=",", "data_cities.txt", row.names = F, col.names = F, append = T,
            quote = F)

time_finish =  proc.time() 
paste("writing time to file is", (time_finish - time_generating_data_stop)[3])
paste("Total time to file is", (time_finish - start_timer)[3])
print("______END______")
