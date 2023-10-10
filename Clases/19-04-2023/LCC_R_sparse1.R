

## ----eval=FALSE,size="footnotesize"--------------------------------------
library(pracma)
n <-5000 # Size of matrix
M <- matrix(n,n,data=0) # Creamos matriz cuadrada de ceros
# Unos en la diagonal
dinf <- rep(1,n-1)
dinf <- dinf[-1] # Trim aa to fit below the diagonal
dinf[n-1]  <-  0 # Excepto la primera y la última

# Creamos la diagonal principal
dprin <- rep(-1.99,n)
dprin[1] <- dprin[n] <- 1
# Creamos la diagonal superior
dsup <- rep(1,n-1)
dsup[n-1]  <- 0 # Except first and last element



## ----eval=FALSE,size="footnotesize"--------------------------------------
## # Vector de los términos independientes
b  <-  rep(0,n)
b[1]  <-  0.5
b[n]  <-  0.69

# Assemble matrix
M[1,1:2]  <-  c(dprin[1],dsup[1])
M[n,(n-1):n]  <-  c(dinf[n-1],dprin[n])
for (i in 2:(n-1))
  M[i,(i-1):(i+1)]  <-  c(dinf[i-1],dprin[i],dsup[i])
M

library(tictoc)

options(digits=3)
# Solve
system.time(soln  <-  solve(M,b))
#soln
res <-norm(M%*%soln-b,'1')
res



## ----eval=FALSE,size="footnotesize"--------------------------------------
# Solve.tridiag from the limSolve package.
# This algorithm goes as O(n)- solve O(n^3).
require(limSolve)

n <-5000 # Size of matrix
M <- matrix(n,n,data=0) # Creamos matriz cuadrada de ceros
# Unos en la diagonal
dinf <- rep(1,n-1)
dinf <- dinf[-1] # Trim aa to fit below the diagonal
dinf[n-1]  <-  0 # Excepto la primera y la última

# Creamos la diagonal principal
dprin <- rep(-1.99,n)
dprin[1] <- dprin[n] <- 1



## ----eval=FALSE,size="footnotesize"--------------------------------------
##
##
## # Creamos la diagonal superior
dsup <- rep(1,n-1)
dsup[n-1]  <- 0 # Except first and last element

# Vector de los términos independientes
b  <-  rep(0,n)
b[1]  <-  0.5
b[n]  <-  0.69
##
 system.time(tri.soln <- Solve.tridiag(dsup,dprin,dinf,b))


## ----eval=FALSE,size="footnotesize"--------------------------------------

require(limSolve)
options(digits=3)
set.seed(333)

#

nup  <- 2                         # nr nonzero bands above diagonal
ndwn <- 3                         # nr nonzero bands below diagonal
nn   <- 10                        # nr rows and columns of A

A <- matrix(nrow = nn, ncol = nn, data = runif(1 : (nn*nn)))
A [row(A) < col(A) - nup | row(A) > col(A) + ndwn] <- 0
diag(A) <- 1                      # 1 on diagonal is easily recognised

# right hand side
B <- runif(nrow(A))

# solve it, using the default solver and banded (inputting full matrix)
Full  <- solve(A, B)
Band1 <- Solve.banded(A, nup, ndwn, B)



## ----eval=FALSE,size="footnotesize"--------------------------------------
# Assemble matrix
abd <- rbind(c(0,0,up2),c(0,up1),bb,c(dn1,0),c(dn2,0,0))

B <- runif(n) # rhs of system
tic("inicio")
Band <- Solve.banded(abd, nup=2, nlow=2,B)
toc()

system.time(Band <- Solve.banded(abd, nup=2, nlow=2,B))


## ----eval=FALSE,size="footnotesize"--------------------------------------
## # Define matrix dimensions, set elements to 0
AA = matrix (nr= 12, nc=12, 0)
# Enter matrix elements
# top
AA[1,1:4] = c( 0.0, -0.98, -0.79, -0.15)
AA[2,1:4] = c(-1.00, 0.25, -0.87, 0.35)

#bloque1
AA[3,1:8] = c( 0.78, 0.31, -0.85, 0.89, -0.69, -0.98, -0.76, -0.82)
AA[4,1:8] = c( 0.12, -0.01, 0.75, 0.32, -1.00, -0.53, -0.83, -0.98)
AA[5,1:8] = c(-0.58, 0.04, 0.87, 0.38, -1.00, -0.21, -0.93, -0.84)
AA[6,1:8] = c(-0.21, -0.91, -0.09, -0.62, -1.99, -1.12, -1.21, 0.07)

#bloque2
AA[7,5:12] = c( 0.78, -0.93, -0.76, 0.48, -0.87, -0.14, -1.00, -0.59)
AA[8,5:12] = c(-0.99, 0.21, -0.73, -0.48, -0.93, -0.91, 0.10, -0.89)
AA[9,5:12] = c(-0.68, -0.09, -0.58, -0.21, 0.85, -0.39, 0.79, -0.71)
AA[10,5:12] = c( 0.39, -0.99, -0.12, -0.75, -0.68, -0.99, 0.50, -0.88)

#bloque inferior
AA[11,9:12] = c( 0.71, -0.64, 0.0, 0.48)
AA[12,9:12] = c( 0.08, 100.0, 50.00, 15.00)

 AA


## ----eval=FALSE,size="footnotesize"--------------------------------------
## # Define matrix dimensions, set elements to 0
B = c(-1.92,-1.27,-2.12,-2.16,-2.27,-6.08,-3.03,-4.62,-1.02,
-3.52,0.55,165.08)

# matrix AA is divided into blocks as follows:
Top = matrix(nr=2, nc=4, data=c(1,-1,1,2,2,1,3,1))
Top
Bot = matrix(nr=2, nc=4, data=c(1,-1,15,4,-1,1,1,4))
Bot
Blk1 = matrix(nr=2, nc=4, data=c(0,2,1,-1,0,-1,-1,5))
Blk1
Blk2 = matrix(nr=2, nc=4, data=c(2,1,3,0,1,-1,2,0))
Blk2

AR = array(dim=c(2,4,2),data=c(Blk1,Blk2))
# overlap is the sum of the number of rows of Top and Bot.
Solve.block(Top,AR,Bot,B,overlap=0)

# ejercicio 3

Top = matrix(nr=2, nc=4, data=AA[1:2,1:4])
Top
Bot = matrix(nr=2, nc=4, data=AA[11:12,9:12])
Bot
Blk1 = matrix(nr=4, nc=8, data=AA[3:6,1:8])
Blk1
Blk2 = matrix(nr=4, nc=8, data=AA[7:10,5:12])
Blk2

B=c(1,3,-2,2,5,6,3,0)

AR = array(dim=c(4,8,2),data=c(Blk1,Blk2))
# overlap is the sum of the number of rows of Top and Bot.
Solve.block(Top,AR,Bot,B,overlap=4)
