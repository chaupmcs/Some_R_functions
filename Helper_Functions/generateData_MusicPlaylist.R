start_timer =  proc.time() #timer 



#================================================
#helper function:
Random_and_fixRange <- function(NUMBERS_DATA, new_max, new_min)
{
  x = rnorm(NUMBERS_DATA, mean=(new_max-new_min)/2+new_min, sd=(new_max-new_min)/6)
  
  index <- which(x < new_min)
  x[index] = new_min
  
  index <- which(x > new_max)
  x[index] = new_max
  
  result = ceiling(x)
  return(result)
}
#================================================================

UserId_MIN = 100001
UserId_MAX = 105000
TrackId_MIN = 100
TrackId_MAX = 500

set.seed(124)
NUMBERS_DATA = 24e3


random_UserId = Random_and_fixRange(NUMBERS_DATA, new_min = UserId_MIN, new_max = UserId_MAX)
random_TrackId = Random_and_fixRange(NUMBERS_DATA, new_min = TrackId_MIN, new_max = TrackId_MAX)
random_Shared = sample(2, NUMBERS_DATA, T) - 1
random_Radio= sample(2, NUMBERS_DATA, T) - 1
random_Skip = sample(2, NUMBERS_DATA, T) - 1


data = cbind.data.frame(random_UserId, random_TrackId, random_Shared, random_Radio, random_Skip)

time_generating_data_stop =  proc.time() #end generating time

paste("Generated time is", (time_generating_data_stop - start_timer)[3])

#Write to file
write.table(data, sep="|", "data_musicHadoop.txt", row.names = F, col.names = F, append = T,
            quote = F)

time_finish =  proc.time() 
paste("writing time to file is", (time_finish - time_generating_data_stop)[3])
paste("Total time to file is", (time_finish - start_timer)[3])



#normalize <- function(vector_x, new_max,new_min = 0)
#{
#  x_min = min(x)
#  x_max = max(x)
#  x_range = max(x) - min(x)
#  new_range = new_max - new_min
#  x = (x - x_min) / x_range  * new_range + new_min
  
#  return(x)
#}

print("______END______")
