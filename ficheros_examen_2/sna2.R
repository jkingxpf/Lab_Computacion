## ----setup, include=FALSE-------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## -------------------------------------------------------------------------
library(igraph)
g1 <- graph( c(1,2, 1,3, 2,3, 
               3,4, 3,5, 1,5,
               4,2, 3,6, 4,8,
               8,1, 9,1, 10,2, 
               7,6, 5,10))
g1
summary(g1)
plot(g1)


## -------------------------------------------------------------------------
class(g1)
V(g1)
V(g1)[1]
E(g1)
E(g1)[1]
class(V(g1))
class(E(g1))


## -------------------------------------------------------------------------
g1
plot(g1)

##Numero de arcos conectados a un grafo
igraph::degree(g1)
igraph::degree(g1, mode="in")
igraph::degree(g1, mode="out")
deg <- centr_degree(g1)
deg


## -------------------------------------------------------------------------
##Mide el grado en el que la información fluye a través de un vértice 
#particular y su importancia relativa como un intermediario en la red.
igraph::betweenness(g1)
 


## -------------------------------------------------------------------------
#Como el anterior pero teniendo en cuenta cada arco 
g1 <- set.edge.attribute(g1, "weight",  value= 1)
bg <- edge_betweenness(g1)
plot(g1, edge.label = bg)


## -------------------------------------------------------------------------
#Se obtiene como 1 divido por la suma de las distancias desde un vértice al resto.
#Alcanzará su valor minimo cuando un vértice esté conectado a todos los demás.
 igraph::closeness(g1)


## -------------------------------------------------------------------------
##La medida Eigenvector Centrality se calcula como el autovalor de mayor 
#módulo de la matriz de adyacencia que contiene los pesos.
eigen_centrality(g1)


## -------------------------------------------------------------------------
##Algoritmo de Google para realizar un ranking con la importancia 
#de los resultados de la búsqueda.
#Nodos son más importantes si tienen muchos enlaces de entrada.
page.rank(g1)


## -------------------------------------------------------------------------
#El máximo camino más corto entre cualquier par de nodos
plot(g1)
diameter(g1)


## -------------------------------------------------------------------------
#El menor número de arcos a atravesar para conectar dos nodos.
sp <- shortest_paths(g1, from="1", to="10")
sp$vpath
sp1 <- shortest_paths(g1, from="1", to="9")
sp1$vpath
distances(g1)


## -------------------------------------------------------------------------
##Probabilidad de que vértices adyacentes de un vértice estén conectados .
##Se denomina también coeficiente de agrupación o clustering.
transitivity(g1, type = "global")


## -------------------------------------------------------------------------
transitivity(g1, type = "local")

