#Lab_Computación
cos(pi)
a <- cos(pi) + 1
print(a)
class(pi)
typeof(pi)
typeof(1L)
str(45L)
is.numeric(1L)
is.double(1L)
is.logical(2)
as.double(1L)
cat("lll","hola")
seq(1,100,9)
rep(seq(1,6,pi),8)
vector1 <- c(1,pi,4,5,1:10,NA)
vector1[c(1,4)]

vector2 <- c(3,5)
vector2[c(TRUE,FALSE,TRUE)]
vector1[c(TRUE,FALSE,TRUE)]


seq(1,10,by=2)
list()
v1 <- 1+c(2,9,4)
v1
c(1,2,3) + c(10,20)
c(10,20) + c(1,2,3)
v1[2] + 2

vector1[5] <- 0
vector_bool <- is.na(vector1)
sum(vector_bool)

as.logical(sum(vector_bool))

which(is.na(vector1))
vector1[is.na(vector1)]

vector1
mean(vector1,na.rm=TRUE)
17/3
17/4

unique()
sort(v3)
order(v3)
v3 <- c(1:10,20:6)
v3[order(v3)]
sample(v3,8,replace = TRUE)
var(v3)
(length(v3)/(length(v3)-1))*var(v3)

#FACTOR
v1 <- c("bueno","malo","muy malo","genial","genial")
v1
v2 <- factor(v1)
v2
v2 <- factor(v1,levels =c("muy malo","malo","bueno","genial","expectacular"),ordered = TRUE)
v2
class(v2)
str(v2)

#listas
l1 <- list(v1,"alumno2",8,"convocatoria febrero",vector2,list("martinez","fernandez","raul"))
l1
l1[6]
class((l1[6]))
l1[6][[1]]
class(l1[6][[1]])
l1[6][[1]][3]
str(l1[[6]][[3]])
str(l1)

l2 <- list(v1,"alumno2",8,"convocatoria febrero",vector2,list("martinez","fernandez","raul"))