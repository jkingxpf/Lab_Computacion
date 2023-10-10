nota_grupos1 <- c(1:5,7:3)
nota_grupo2_3 <- matrix(c(2,2,8,3,9,8),ncol = 3,nrow = 2,byrow=TRUE)
nota_grupo2_3
calificaciones <- list( 
  list(
    notas_grupo1a = c(1:9,7:3),
    notas_grupo1b = c(10,8,7,6)),
  notas_grupo2_3 = matrix(c(4,2,8,3,9,8),nrow=2,ncol=3,byrow=TRUE))
calificaciones

#1
c_length <- lapply(c(calificaciones[[1]],calificaciones[2]),length)
str(c_length)

#2
sapply(c(calificaciones[[1]],calificaciones[2]),mean)

#4
f1 <- function(x){
  (3*x)/10
}

l_norm <- lapply(c(calificaciones[[1]],calificaciones[2]),f1)
l_norm

#5
l_norm_anon <- lapply(c(calificaciones[[1]],calificaciones[2]), function(x){
                                                          (3*x)/10
                                                                })

#6
##unlist <- aplanar lista
#l_not_rep <- 
  
#7

  

