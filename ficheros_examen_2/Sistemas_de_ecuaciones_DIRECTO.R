 
## ----eval=FALSE,size="footnotesize"--------------------------------------
A <- matrix(c(1,1,0,2,3,1,0,1,0),nrow=3)
B <- matrix(c(-1,0,1,1,1,2,0,1,0),nrow=3)

A * B # multiplicación elemento a elemento
A %*% B  # Multiplicación normal de matrices
crossprod(A,B)  # A'B
crossprod(A) 	  # A'A
t(A)            # transpuesta de A
diag(A)         # extraer la diagonal - devuelve un vector
diag(1,4)       # devuelve la matriz identidad de orden 4
diag(c(1,3,1), 3) # devuelve la matriz diagonal con vector en la diagonal de orden 3
diag(diag(A)) # Ejecutar en R
diag(1, 3, 4)  # Ejecutar en R


## ----eval=FALSE,size="footnotesize"--------------------------------------
library(pracma)
# Usar estas matrices
A <- matrix(c(1,1,0,2,3,1,0,1,0),nrow=3)
v <- c(1,2,3)
cond(A)  # devuelve el nº de condición de una matriz - debe estar cercano a 1
Polcar <- charpoly(A, info = TRUE) # polinomio característico de A
eye(3)    # devuelve la matriz identidad de orden 4
ones(3)    # devuelve la matriz de unos de orden 4
zeros(3)    # devuelve la matriz de ceros de orden 4
eye(3,4); ones(3,4); zeros(3,4)    # Ejecutar en R


## ----eval=FALSE,size="footnotesize"--------------------------------------
Diag(v, 1)    # devuelve la matriz diagonal con vector $v$  en la diagonal
Diag(A, 1)    # devuelve el vector de A que está en diagonal 1
tril(A)   # devuelve la triangular inferior y la diagonal
triu(A)   # devuelve la triangular superior y la diagonal

hilb(3) # matriz de hilbert de orden 3
magic(3)  # matriz mágica de orden 3
Rank(A)  # el rango de una matriz
Trace(A) #la traza de una matriz



## ------------------------------------------------------------------------
A <-matrix(rnorm(9),nrow=3); A1 <- solve(A)
Ident <- A%*%A1;Ident
# hay errores de redondeo - comprobación de igualdad exacta
 identical(A, solve(solve(A)))
# comprobación teniendo en cuenta la precisión de la máquina
 all.equal(A, solve(solve(A))) 


## ----eval=FALSE,size="footnotesize"--------------------------------------
A <-matrix(rnorm(9),nrow=3)
b <- c(1,2,-1)
x <- solve(A,b)
x
residuo <- A%*%x-b
norm(residuo,'1')
norm(residuo,'I')
norm(residuo,'2')


## ----eval=FALSE,size="footnotesize"--------------------------------------
A = matrix(c(1,   1,
             1,  -1,
            3,  -1,
            0, 1), nrow=4, byrow=TRUE)
b = c(2,0.1, 2,1)
b <- as.matrix(b)
Ab <- cbind(A,b)
qr(A)$rank
qr(Ab)$rank
solve(A,b)# da error
x <- qr.solve(A,b)
x
residuo <- A%*%x-b
residuo
norm(residuo,'2')
## 

