is.atomic(TRUE)
M1 <- matrix(1:6,nrow = 6, ncol = 3)
M2 <- matrix(6:1,3,6)
M2
M3 <- c(1,2,3) + M1
M3
v1 <- M1[M1<3]
v1
M1
i1 <- which(M1<3)
i1
M2 <- M1 
M2[i1] <- 0
M2
M1[2,3]
M1[5,2]
M1
M1[1:3,1:2]
M1[c(2,5),]

f1 <- c( 1, 2, 3)
f2 <- c( 4, 5, 6)
f3 <- c( 7, 8, 9)

M1 <- rbind(f1,f2,f3)
M1
M1 <- cbind(f1,f2,f3)
M1
v1<- 1:12
dim(v1) <- c(3,4)
v1
dim(v1)
dim(M1)

A <- matrix(c(pi,sqrt(2),0,1,5,1, 1, 0 ,-1),3,3,byrow = TRUE)
A
B <- matrix(c(pi,sqrt(2),0,1,5,1, 1, 0 ,-1),3,3,byrow = FALSE)
B
A+B; A*B
A%*%B
t(A)
det(A)
diag(A)
b <- c(2,3,1)
x <- solve(A,b);x
x
eigen(A)

 n1 <- c("Luis","Antonio","Daniel")
 e1 <- c(21,20,22)
 D1 <- data.frame(alumnos=n1,edad=e1); D1
D1[1:2] 
D1[2:1]
D1[1:3]
D1[1,]
D1[1:2,]
D1[1:2,]$alumnos
D1[2:1,]$edad
D1[,1]
D1[,2:1]
alumno1 <- list(nombre = "Luis", no.asignaturas = 3,
                  nombre.asignaturas = c("Lab1", "Lab2", "Lab3"))
 df1 <- as.data.frame(alumno1);df1

 alumno2 <- list(nombre = "Antonio", no.asignaturas = 3,
                     nombre.asignaturas = c("Lab2", "Lab1", "Lab3"))
 df2 <- as.data.frame(alumno2)
 mi.df1 <- rbind(df1, df2)
 mi.df1
 alumno1b <- list(apellido = "Fernandez",
                   ciudad= c("Málaga", "Málaga", "Sevilla"))
df1b <- as.data.frame(alumno1b)
df1b
mi.df2 <- cbind(mi.df1, df1b)
mi.df2


a1 <- c("Luis","Antonio","Daniel")
e1 <- c(21,20,22)
D1 <- data.frame(alumnos=a1,edad=e1)
D1
D2 <- data.frame(alumnos=c("Luis","Daniel","Ángel"),
                   ciudad=c("Madrid", "Córdoba", "Málaga"))
D2
D3 <- merge(D1,D2,by="alumnos")
D3


my.dataset <- data.frame(
ciudad=c('Málaga','Sevilla','Cádiz','Málaga', 'Cádiz'),
Estación=c('Invierno','Verano','Otoño','Otoño','Verano'),
temperatura = c(37.4,36.3,38.6,37.2,38.9))
my.dataset
my.dataset$ciudad

my.dataset$ciudad[my.dataset$Estación=="Verano"]







library(datasets)
data("airquality")
View(airquality)
mean(airquality$Ozone)
mean(airquality$Ozone[!is.na(airquality$Ozone)])
mean(which(!is.na(airquality$Ozone)))


v <- rep(seq(1, 5, 3), times=3)     
v
mean(v)
v <- seq(from=2, to=3, by=0.1)
length(v)
c2 <- c(TRUE,FALSE)
sum(is.integer(as.character(c2))+1)
