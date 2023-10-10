##Joaquín Fernández Suárez

library(pracma)
library(limSolve)

dg <- (1:10000)*2
dsup <- rep(1,9999)
dinf <- rep(-1,9999)

M <- Diag(dg)
M <- M + Diag(dsup,1)
M <- M + Diag(dinf,-1)
M[2,1]

n <- 10000
b <- zeros(n,1)
b[1,1] <- 1
b[n,1] <- -1
b[n,1]

x1 <- Solve.tridiag(dsup,dg,dinf,b)
x2 <- solve(M,b)


res1 <- M%*%x1-b
norm(res1)
