library(pracma)

##Ejercicio 1
## a)


A <- matrix(c(4,-1,-2,0,-1,4,0,-sqrt(2),-2,0,4,-1,0,-sqrt(2),-1,4), nrow = 4,byrow = T)
a <- c(4,-1,-2,0,-1,4,0,-2,-sqrt(2),-2,0,4,-1,0,-sqrt(2),-1,4)
length(a)
A
b <- c(4,0,0,-4)
x <- solve(A,b)

residuo <- A%*%x - b
norm(residuo,'2')

## b)
D <- diag(diag(A))
L <- A
R <- A
L[!lower.tri(A, diag = FALSE)] <- 0
R[!upper.tri(A, diag = FALSE)] <- 0
ID <- solve(D)
BJ <- -ID %*% (L + R)

rad <- max(abs(pracma::eig(BJ)))
rad #converge

jacobi(A,b,n = 100)

residuoJ <- A%*%x-b
norm(residuoJ,'2')


##Ejercicio 2
##a)
n <- 1000
dg <- (1:n) * 4
dg_s_i <- rep(-1,n-1)

A <- zeros(n)
A <- A + Diag(dg) + Diag(dg_s_i,1) +Diag(dg_s_i,-1)
A[1:5,1:5]

b <- matrix(c(1,rep(7,n-2),2),ncol = 1)

x <- solve(A,b)

residuo <- A%*%x - b
norm(residuo,'2')

#b)

tiempo_qr <- system.time(x_qr <- qr.solve(A,b))

x <- solve(A,b)

residuo <- A%*%x_qr - b
norm(residuo,'2')

#c)

tiempo_qr <- system.time(x_j <- jacobi(A,b))

residuo <- A%*%x_j$x - b
norm(residuo,'2')

#d)

x_iter <- itersolve(A,b)

residuo <- A%*%x_iter$x - b
norm(residuo,'2')

#e
library(limSolve)

x_tri <- Solve.tridiag(dg_s_i,dg,dg_s_i,b)

residuo <- A%*%x_tri - b
norm(residuo,'2')
