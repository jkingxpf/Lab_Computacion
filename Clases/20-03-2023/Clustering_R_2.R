## ----setup, include=FALSE-------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## -------------------------------------------------------------
# Visualización de tablas desde Rmarkdown
#install.packages("kableExtra")
library(knitr)
library(kableExtra)
library(dplyr)
library(magrittr)
options(knitr.table.format = "html") 


## ---- eval=FALSE----------------------------------------------
## datos <- na.omit(datos)


## ---- eval=FALSE----------------------------------------------
## #datos <- scale(datos)
## 
## datos <- datos %>%
##          scale()


## ----eval=FALSE-----------------------------------------------
## kmeans(x, centers, iter.max = 10, nstart = 1)
## #x:  numeric matrix of data, or an object that can be coerced to such a matrix (such as a numeric vector or a data frame with all numeric columns).
## 
## # centers: 	 either the number of clusters, say k, or a set of initial (distinct) cluster centres. If a number, a random set of (distinct) rows in x is chosen as the initial centres.
## 
## #iter.max:	 the maximum number of iterations allowed.
## # nstart:	 if centers is a number, how many random sets should be chosen?. Generate 10 initial random centroids and choose the best one for the algorithm.
## 
## # Ejemplo
## 
## grpMeat <- kmeans(dataset[,c("Atributo1","Atributo2","Atributo3")], centers=5, nstart=10)


## -------------------------------------------------------------
food <- read_csv("R/Lab_Computacion/dataset/protein.csv")
head(food)
# 25 paises y 9 tipos de comida 
dim(food)


## -------------------------------------------------------------
#my.foods <-food[,2:dim(food)[2]]
my.foods <-food %>%
           select(-1)

my.foods %>%
  kable("html") %>%
  kable_styling(bootstrap_options = c("striped", full_width = F))



## -------------------------------------------------------------
# medias de consumo de cada tipo de alimento

#kable(sort(round(colMeans(my.foods, 1))),"html")
my.foods %>%
   colMeans(1)%>%
   round()%>%
   sort()%>%
   kable("html")   


#desviación estándar 
#kable(sort(round(apply(my.foods, 2, sd),1)),"html")

my.foods %>%
   apply(2,sd)%>%
   round(1)%>%
   sort()%>%
   kable("html")   



## -------------------------------------------------------------
 
set.seed(1)   ## to fix the random starting clusters
grpMeat <- kmeans(my.foods[,c("WhiteMeat","RedMeat")], centers=3, nstart=10)

grpMeat <- food %>%   
           select(c("WhiteMeat","RedMeat"))%>%   
           kmeans(centers=3, nstart=10)

paises.agrupado <- data.frame(food$Country,grpMeat$cluster)

paises.agrupado

str(grpMeat)
grpMeat
grpMeat$centers

## -------------------------------------------------------------
## lista ordenada de los grupos

Gr1=order(grpMeat$cluster)


# los índices que se usarán a continuación para ver los clusters
Gr1
# Visualizamos cada pais con su cluster de forma ordenada
data.frame(food$Country[Gr1],grpMeat$cluster[Gr1])


plot(food$RedMeat, food$WhiteMeat, type="n", xlim=c(3,19), xlab="Red Meat",
       ylab="White Meat")


## -------------------------------------------------------------
plot(food$RedMeat, food$WhiteMeat, type="n", xlim=c(3,19), xlab="Red Meat", ylab="White Meat")
text(x=food$RedMeat, y=food$WhiteMeat, labels=food$Country,
       col=grpMeat$cluster+1)


## -------------------------------------------------------------
set.seed(1)
grpProtein <- kmeans(food[,-1], centers=7, nstart=10)
Gr1=order(grpProtein$cluster)
data.frame(food$Country[Gr1],grpProtein$cluster[Gr1])

## plotting cluster assignments on Red and White meat scatter plot
plot(food$RedMeat, food$WhiteMeat, type="n", xlim=c(3,19), xlab="Red Meat", ylab="White Meat")
text(x=food$RedMeat, y=food$WhiteMeat, labels=food$Country, col=grpProtein$cluster+1)



## -------------------------------------------------------------
#? dist
# This function computes and returns the distance matrix computed by using the specified distance measure to compute the distances between the rows of a data matrix.

distances.countries = dist(my.foods,)
class(distances.countries)
kable(as.matrix(distances.countries),"html")
# Miramos lista de paises
kable(data.frame(id=seq(1:dim(food)[1]),country=food[,'Country']),"html")




## -------------------------------------------------------------
# Distancias entre los dos paises 
as.matrix(distances.countries)[5,19]
 
#  Calculñandolo manualmente
sqrt(sum((my.foods[5,]-my.foods[19,])**2))


## -------------------------------------------------------------
#distances.countries = dist(my.foods,  method = "euclidean")
library("factoextra")
distances.countries <-  my.foods %>% 
                        dist(method = "euclidean")

#distances.countries2 <- get_dist(my.foods, method = "pearson")
distances.countries2 <- my.foods %>% 
                        get_dist(method = "pearson")



## -------------------------------------------------------------
distances.countries %>%
      fviz_dist()

distances.countries2 %>%
      fviz_dist()


