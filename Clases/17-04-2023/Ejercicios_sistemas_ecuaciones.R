##Joaquín Fernández Suárez

library(pracma)

##Ejercicio 1
A <- matrix(c(1,2,-1,-2,1,2),ncol = 2 )
A
b <- c(1,-3,1)
AAt <- tcrossprod(A,A)

x <- solve(AAt,b)
x <- qr.solve(AAt,b)
x <- qrSolve(AAt,b)

Rank(AAt)
Rank(cbind(AAt,b))

##Como la matriz AAt y la apliada no tienen el mismo rango no es compatible determinado
##La fila 3 es igual a -Fila 1

cond(AAt)


residuo <- AAt %*% x -b

error <- norm(residuo,type = c("2"))

##Ejercicio 2
#a)
A <- matrix(data = c(-3, 1, 1, 1,1, -3, 1, 1,1, 1, -3, 1,1, 1, 1, -3),
            nrow = 4, byrow = T)

b <- c(0,8,-8,0)

solve(A,b)

Rank(A) == Rank(cbind(A,b))

##Tiene el mismo rango
##No se puede resolver las ecuaciones porque A no tiene inversa

#b)
x <- qrSolve(A,b)

residuo <- A%*%x - b

norm(residuo, type = c("2"))

##ejercicio 3

A <- matrix(c(3,-2,1,1,-3,1,1,1,-1,3,0,1),ncol = 3, byrow = T)
b <- c(2,5,-5,0)

solve(A,b)
x <- qrSolve(A,b)

x

residuo <- A%*%x -b

norm(residuo,c("1"))
norm(residuo,c("I"))
norm(residuo,c("2"))

#La solución es aquella donde existe el menor error que es practicamente 0.
