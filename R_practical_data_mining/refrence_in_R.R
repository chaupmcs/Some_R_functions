set<-function(x,value){
  eval.parent(substitute(x<-value))
}

valX <- 51
set(valX ,10)
valX


addOne_1<-function(x,value){
  eval.parent(substitute(x<-x+1))
}
valX <- 51
addOne_1(valX)
valX
x <- c(TRUE,FALSE,0,6) 
y <- c(FALSE,TRUE,FALSE,TRUE)
x&&y
a
TRUE || a




pow <- function(x, y) {
  # function to print x raised to the power y
  
  result <- x^y
  print(paste(x,"raised to the power",y,"is",result))
}
pow(2,3)
pow(y=2,x=3)




outer_func <- function(){
  inner_func <- function(){
    a <<- 30
    print(a)
  }
  inner_func()
  print(a)
}


recursive <- function(n)
{
  if (n==0)
    return(1)
  else
    return(n*(recursive(n-1)))
}

recursive(5)

'+'(1,2)


`%divisible%` <- function(x,y)
{
  if (x%%y ==0) return (TRUE)
  else          return (FALSE)
}

x = seq(-2,4)
x
x[c(T,T,T)]
x = c("Age"=28, "Job"= "student", "Homeless" = F)
lis = list("Age"=28, "Job"= "student", "Homeless" = F)
x$Age

x=0
M = matrix(c(15,14,51,20,2,36,x,11,33,63,82,12,39,57,92,28), nrow = 4, dimnames = list(c("A","B","C", "D"), c("X","Y","Z","T")))

colnames(M)
names(M)
dim(M)
attributes(M)
M[c(3,2),]
class(lis)

apply(M, c(1:2), sum)
Row = c(sum(M[1,]),sum(M[2,]),sum(M[3,]),sum(M[4,]))
Col = c(sum(M[,1]),sum(M[,2]),sum(M[,3]),sum(M[,4]))

M
Row
Col

3*5    2    3*11   3*13
2*7    6^2  3^2*7  3*19
3*17   x    2*41   2^2*23
2^2*5  11   2^2*3  2^2*7


3+5+  2+  3+11+  3+13
2+7+  6+  3+7+   3+19
3+17+ x+  2+41+  2+23
2+5+  11+ 2+3+   2+7
x


student <- function(n,a,g) {
  # we can add our own integrity checks
  if(g>4 || g<0)  stop("GPA must be between 0 and 4")
  value <- list(name=n, age=a, GPA=g)
  
  # class can be set using class() or attr() function
  # attr(value, "class") <- "student"
  class(value) <- "student"
  value
}



a <- student(1,2,3)
a
methods(class="default")
methods(print)
print.default("x")
a = 5
cat(a, "y")
print

grade <- function(obj)
{
  UseMethod("grade")
}

grade.default <- function(obj)
{
  cat("This is a generic function\n")
}
grade.student <- function(obj)
{
  cat("Your grade is", obj$GPA, "\n")
}
grade(a)
s <- student("Paul", 26, 3.7)

student <- setClass("student", slots=list(name="character", age="numeric", GPA="numeric"))
isS4(student)

student2 <- setRefClass("student2", fields = list(name = "character", age = "numeric", GPA = "numeric"))
isS4(student2)
student
a <-   new("student2",name="chau", age=1,GPA=1)
b=a$copy()

b$age=a$age
b$age=31

class(student)



student <- setRefClass("student",
                       fields=list(name="character", age="numeric", GPA="numeric"),
                       methods=list(
                         inc_age = function(x) {
                           age <<- age + x
                         },
                         dec_age = function(x) {
                           age <<- age - x
                         }
                       )
)

