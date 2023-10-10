##Ejercicio 1

obA <- c(8:20)
obB <- c(20:8)
obC <- matrix(seq(20,40,4),nrow = 2, ncol = 3)

lista1 <- list(observacionA = obA,
               observacionB = obB,
               observacionC = obC,
               observacionD = obC)
str(lista1)

resultados <- lapply(lista1, sum)

apply(resultados, 2, sum)

sum(as.vector(resultados))
sumR <- function(l){
  
}

#Ejercicio2
library(dplyr)

data("mtcars")
mtcars$namecar <-  rownames(mtcars)

ochoCL <- mtcars %>% filter(cyl == 8)
ochoCL

g <- head(sort(ochoCL$gear, decreasing = T),1)
g
c <- head(sort(ochoCL$carb, decreasing = T),1)


f_ochoCL <- ochoCL %>% filter(mpg >= 10.4, mpg <= 17.4,gear == g, carb == c )
f_ochoCL

print(f_ochoCL)

##Ejercicio3
library(arules)

data("Mushroom")

mis_reglas <- apriori(Mushroom,
                      parameter = list(sup = 0.28818,
                                       conf = 0.27634,
                                       minlen = 2) )
length(mis_reglas)

mis_reglas[2]@quality$lift

mis_reglas_lift <- mis_reglas[order(mis_reglas@quality$lift)] 

inspect(head(mis_reglas_lift,10))

inspect(mis_reglas_lift@lhs[2])

rules2 <- subset(mis_reglas, mis_reglas@quality$lift > 0.7557446)

inspect(head(rules2,10))

rules2 <- rules2[order(rules2@quality$confidence, decreasing = T)] 

rules2[1]@quality$confidence

VT_partial <- subset(mis_reglas, mis_reglas@rhs %in% c("VeilType=partial"))

inspect(head(VT_partial,10))

inspect(Mushroom@itemInfo$variables)

Mushroom@itemInfo$variables
Mushroom@data@i

atr <- inspect(mis_reglas_lift[2901]@rhs)

subset(Mushroom, Mushroom@itemInfo$levels == "partial")

