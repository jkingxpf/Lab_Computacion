 

## ----eval=FALSE,size="footnotesize"--------------------------------------
library(pracma)
A=matrix(c(2, 3, 4, 1 ,-3, 0,1, -1, 4),nrow=3,byrow=TRUE)
b=c(-2, 4,6)
sol <-itersolve(A,b,c(0,0,0),nmax=1000,method=c("Jacobi"))
sol


## ----eval=FALSE,size="footnotesize"--------------------------------------
A = matrix(c(4, -1, -1, 0, 0, 0,
-1, 4, 0, -1, 0, 0,
-1, 0, 4, -1, -1, 0,
0, -1, -1, 4, 0, -1,
0, 0, -1, 0, 4, -1,
0, 0, 0, -1, -1, 4), nrow=6, byrow=TRUE)

b = c(1, 5, 0, 3,1,5)

x0 = c(0.25, 1.25, 0, 0.75, 0.25, 1.25)

