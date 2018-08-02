m <- matrix(c(1:10, 11:20), nrow = 10, ncol = 2)

# mean of the rows
apply(m, 1, mean)

# mean of the columns
apply(m, 2, mean)

# divide all values by 2
apply(m, 1:2, function(x) x/2)

m 
m=m./2
attach(iris)
head(iris)

# get the mean of the first 4 variables, by species
b=by(iris[, 1:4], Species, rowSums)
class(b)
b$setosa

colMeans()

l <- list(a = 1:10, b = 11:20)
lapply(l, function(x){ x/x})
tapply(l, c(1,2), sum)
Reduce(c(1,2,3,4), sum)



my.sum <- function (x) {Reduce(`+`, x)}
my.sum <- function(x) 
{
  
}