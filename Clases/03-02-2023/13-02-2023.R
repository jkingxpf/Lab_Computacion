#Funciones
Funcion <- function(parametrosEntrada){
  cuerpo
  return(parametrosEntrada)#no obligatorio pero aconsejable
} 

#va a devolver los elementos del vector
#mayores que x y la media.

mayoresde <- function(vector,x){
  
  indices <- which(vector >= x)
  mayores <- vector[indices]
  media <- mean(mayores)
  return(list(mayores,media))
  
}#final funcion

data("airquality")
sapply(airquality, function(x) mean(x,na.rm = TRUE)   )

s <- split(airquality, airquality$Month)#importante
s
s[[5]]


# 