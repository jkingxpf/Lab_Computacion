 
## ----eval=FALSE,size="footnotesize"--------------------------------------
A <- spMatrix(10,20, i = c(1,3:8), j = c(2,9,6:10),  x = 7 * (1:7)); A
str(A)
A[2:7, 12:20] <- rep(c(0,0,0,(3:1)*30,0), length = 6*9); A
# Si en algún cálculo deja de ser sparse, lo hace automáticamente
A + 1
3*A
# Operaciones matriciales con matrices dispersas
crossprod(A)  # t(A) %*% A
tcrossprod(A)  # A %*% t(A)
# Obtener una imagen de matriz dispersa
 image(A)


## ----eval=FALSE,size="footnotesize"--------------------------------------
 library('Matrix')
M1 <- matrix(0, nrow = 1000, ncol = 1000)
M2 <- Matrix(0, nrow = 1000, ncol = 1000, sparse = TRUE)
object.size(M1); object.size(M2)
#M1 no cambiará de tamaño si añadimos un elemento.
M1[500, 500] <- 1; M2[500, 500] <- 1
object.size(M1); object.size(M2)
# Operaciones con matrices dispersas son realizadas muy eficientemente
M2 %*% rnorm(1000)
M2 + 2*M2
M2 - M2
t(M2)
#Pueden usarse cBind, rBind
M3 <- cBind(M2, M2)
nrow(M3); ncol(M3)
M4 <- rBind(M2, M2)
nrow(M4); ncol(M4)

