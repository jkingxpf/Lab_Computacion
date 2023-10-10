 

## ----echo=TRUE,eval=TRUE------------------------------
alumnos1 <- c("Luis", "Ana", "Fran", "Pedro", "Laura", "Susana")
alumnos2 <- c("Juan", "Jose", "Amalia", "Lucía", "Maite", "Eduardo")

grupos <- data.frame(integrante1 = alumnos1, integrante2 = alumnos2, stringsAsFactors = F)

print(grupos)
str(grupos)



## ----echo=TRUE,eval=TRUE------------------------------
# Se pueden usar matrices 'sparse'
A <- rbind(c(0,1,0), c(1,0,1), c(1,0,0))
nodeNames <-  c("A","B","C")
dimnames(A) <-  list(nodeNames, nodeNames)
A
str(A)



## ----echo=TRUE,eval=TRUE------------------------------
# Multiplicación matricial
A2 <- A %*% A
A2

A3 <- A %*% A %*% A 
A3


## ----echo=TRUE,eval=TRUE------------------------------
Arcos <- rbind(c("A","B"), c("B","A"), c("B","C"), c("C","A"))
Arcos


## ----echo=TRUE,eval=TRUE------------------------------
# Instalar la primera vez - descomentar
#install.packages("igraph")
#install.packages("igraphdata")
library(igraph)
library(igraphdata)


# Importar la red de datasets ya establecidos: igraphdata

# Limpia la memoria - Cuidado - borra todas las variables
rm(list=ls())

#Lista de datasets de redes de nodos en igraph
# data(package="igraphdata") 
 
# El paquete tiene un conjunto de datasets
# Carga data set y vemos que contiene 
#Red social entre miembros de club de karate de universidad 
data(karate,package="igraphdata") 
plot(karate)


## -----------------------------------------------------
# UKfaculty: Friendship network of a UK university faculty
data(UKfaculty) 
plot(UKfaculty)
UKfaculty
V(UKfaculty)
E(UKfaculty)
V(UKfaculty)
str(UKfaculty)
head(E(UKfaculty)$weight)
head(V(UKfaculty)$Group)


## ----echo=TRUE,eval=TRUE------------------------------
# Un grafo dirigido  vacío  
g <- make_empty_graph(n = 0, directed = TRUE)
g
g <- g + vertices(c("A","B","C"))
g

# Arcos:  A to C ,  B to C
g <- g + edges(c("A","C", "B","C")) 
g

# Eliminar arco  A
g <- g - V(g)["A"]
g
# Eliminará todos los arcos conectados con A


## ----echo=TRUE,eval=TRUE------------------------------
# Un grafo dirigido  vacío  

#     graph() id desde   1. 
g1 <- graph( c(1,2, 1,3, 2,3, 3,4 ));g1
summary(g1)
plot(g1)

# El parámetro "directed" a  FALSE para
# grafos no dirigidos.  

g2 <- graph( c(1,2, 1,3, 2,3, 3,4 , 3, 5, 1, 3), directed=FALSE); g2 
summary(g2)
plot(g2)

#Obtener la lista de arcos a partir de un grafo   
edgelist<-get.edgelist(g2) ; edgelist
edgelist <- as_edgelist(g2) ; edgelist

# Obtener el grafo a partir de la lista de arcos
g3<-graph( t(edgelist));  g3;  plot(g3)
g3<-graph( edgelist);  g3;  plot(g3)

# algunos parámetros de plot 

plot(g3, 
     vertex.color="green", 
     edge.arrow.size=0.5, 
     vertex.size=25,
     edge.curved=0.5,
     layout_as_star=TRUE)


## ----echo=TRUE,eval=TRUE------------------------------
adjm_u<-matrix(
  c(0, 1, 0, 0, 1, 0,
  1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 
  0, 0, 1, 0, 1, 1, 
  1, 1, 0, 1, 0, 0,
  0, 0, 0, 1, 0, 0),
  nrow=6, 
  ncol=6, 
  byrow = TRUE)
#grafo a partir de matriz de adyacencia
g_adj_u <- graph.adjacency(adjm_u, mode="undirected") 

plot(g_adj_u)
# Matriz de adyacencia a partir de grafo
A <- get.adjacency(g_adj_u); A
A <- as_adjacency_matrix(g_adj_u, sparse = FALSE)
A



## ----echo=TRUE,eval=TRUE------------------------------
# Primero, crear el data frame
node1 = c("Ella", "Tu", "El"); node2 = c("El", "Ella", "Tu")
weight = c(10, -2, 3)
df = data.frame(node1, node2, weight); df
# Crear el grafo 
g <- graph.data.frame(df, directed=FALSE); g
plot(g)
# Si se conocen los vértices
# g <- graph.data.frame(df, vertices=listvertices, directed=FALSE);g

# Obtener los nombres de los nodos
V(g)$name 

# Obtener los pesos de los arcos
E(g)$weight  
 




## ----echo=TRUE,eval=TRUE------------------------------
#?graph_from_literal

g <- graph_from_literal(A--C, A-+D, C-+A, , D-+C)
g
plot(g)

#IGRAPH DN-- 4 4 -- 
#+ attr: name (v/c)
#+ edges (vertex names):
#[1] A->D D->C D->B B->A

 G3 <-graph_from_literal(A-B, B -+C)
 plot(G3)
 G3 <-graph_from_literal(A-B, B -C)
 plot(G3)



## -----------------------------------------------------
g_random <- sample_gnp(10, 0.2, directed = FALSE, loops = FALSE)
plot(g_random)


## ----echo=TRUE,eval=TRUE------------------------------
#library(igraph)
# Trees
g <- make_tree(27, children=3)
g; plot(g)

# Cliques 
g <- make_full_graph(n=6)
g; plot(g)

# Lattices
g <- make_lattice(dimvector = c(5,5), circular = FALSE)
V(g)$label <- NA
g; plot(g)

#Stars
g <- make_star(n=10,mode = "undirected")
g;  plot(g)




## ----echo=TRUE,eval=TRUE------------------------------
g <- make_ring(10, directed=TRUE, mutual=TRUE)

V(g)$name <- LETTERS[1:10]

g <-  g + edges(9,5, 7,1, 1,5)

plot(g)



## ----echo=TRUE,eval=TRUE------------------------------

Lykamada <- layout.kamada.kawai(g)
plot(g, layout=Lykamada)

Lyfruchtermant <- layout.fruchterman.reingold(g)
plot(g, layout=Lyfruchtermant)

lo <- layout_in_circle(g)
head(lo, n=4) 

# lo es una matriz de coordenadas  
lo
plot(g, layout=lo)

# See ?layout_ for a full list

# Para redes tipo árbol:  layout_as_tree
gTree <- make_tree(15)
plot(gTree, layout=layout_as_tree(gTree, root = 1))

# layout como un grid
plot(g, layout=layout_on_grid(g))


## -----------------------------------------------------
library(igraph)
#Buscar en ayuda
#?igraph::layout  
g <- make_tree(15)
set.seed(3952)
layout1 <- layout.fruchterman.reingold(g)
plot(g, layout=layout1)


# Otra malla diferente
plot(g, layout=layout.kamada.kawai)
# Malla interactiva - Ejecutar en consola
# tkplot(g, layout=layout.kamada.kawai)


## ---- eval=FALSE--------------------------------------
## V(g)$label.cex <- ...
## V(g)$label.color <- ...
## V(g)$frame.color <- ...
## E(g)$color <- rgb(....
## E(g)$width <-
## 


## -----------------------------------------------------
plot(g, vertex.size = 20)
plot(g, vertex.size = 10, vertex.color = "blue", vertex.frame.color = NA, vertex.label = NA)
plot(g, vertex.size = 10, vertex.color = "blue", vertex.frame.color = NA, vertex.label.cex = .7,  vertex.label = NA, edge.curved = .5, edge.arrow.size = .3, edge.width = .7)


## -----------------------------------------------------
library(tidyverse)
g1random <- sample_gnp(10, p=0.4)

V(g1random)[1]$color <- "yellow" 

g1random %>%
  set_edge_attr("color",value = "blue") %>%
 plot()


## ----echo=TRUE,eval=TRUE------------------------------
g <- make_ring(10, directed=TRUE, mutual=TRUE)

V(g)$name <- LETTERS[1:10]

g <-  g + edges(9,5, 7,1, 1,5)

plot(g)
vowel <- V(g)$name %in% c("A","E","I","O","U") + 1 # gives 1 or 2
plot(g, layout=lo, vertex.shape=c("circle", "square")[vowel])
#colores
plot(g, layout=lo, vertex.color=c("tomato2", "royalblue")[vowel])
#tamaño
plot(g, layout=lo, vertex.size=c(15,30)[vowel])
#Propiedades usando atributos

V(g)$shape <- "circle" # Aplicado a todos los vértices
V(g)$size <- 15
V(g)$color <- "orange"
isVowel <- V(g)$name %in% c("A","E","I","O","U")
# Sobreescribir los nodos vocales 
V(g)[isVowel]$shape <- "square"
V(g)[isVowel]$color <- "royalblue"
V(g)[isVowel]$size <- 25

plot(g, layout=lo)



## ----echo=TRUE,eval=TRUE------------------------------
E(g)$width <- 1
v1 <-V(g)[isVowel]
v1
E(g)[v1  %--%  v1]$width <- 4

# Ver http://igraph.org/r/doc/igraph-es-indexing.html

plot(g, layout=lo)

#Arcos curvados
plot(g, layout=lo, edge.curved=0.3*which_mutual(g))



## ----echo=TRUE,eval=TRUE------------------------------
groupList <- list(vowelGroup = which(isVowel),
                  constGroup1 = c(2,3,4),
                  constGroup2 = c(6,7,8))

groupColours <- c(rgb(0,0.3,1,0.5),
                  rgb(0.8,0.4,0.1,0.5),
                  rgb(0.8,0.4,0.1,0.5))
plot(g, layout=layout_with_fr, # Fruchterman?Reingold layout
     mark.groups=groupList, # Mark the groups
     mark.col= groupColours,
     # Eliminar el borde
     mark.border = NA, 
     edge.curved=0.1*which_mutual(g))
text(0.45,0.1,"Vocales", cex=1.5)
text(0.5,0.9,"Grupo consonantes 1", cex=1.5)
text(-0.8,-1,"Grupo consonantes 2", cex=1.5)



## ----echo=TRUE,eval=TRUE------------------------------
write_graph(g, "gr1.graphml", format="graphml")


