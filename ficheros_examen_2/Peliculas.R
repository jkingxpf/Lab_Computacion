library(tidyverse)
library(igraph)
actores <- read_csv("R/Lab_Computacion/dataset/actores.csv")
peliculas <- actores <- read_csv("R/Lab_Computacion/dataset/peliculas.csv")

#Crear el gráfo

g <- graph_from_data_frame(d = peliculas, vertices = actores,directed = FALSE)

##Nodos en el grafo
length(V(g))

##Aristas en el grafo
length(E(g))

##Nodo 3 del gráfo
V(g)[3]

plot(g)

##Cambiar el layout

star <- layout.star(g)
plot(g, layout=star) 

##otra forma

plot(g, layout_as_star = T)

##Asignar grupos en el plot

group_oscar <- list(which(actores$BestActorActress %in% "Winner"))

group_color <- c(rgb(0.1,0.5,0.5,0.5))

plot(g,
     mark.groups =group_oscar, # Mark the groups
     mark.col= group_color)


plot(g, layout=layout_with_fr, # Fruchterman?Reingold layout
     mark.groups=groupList, # Mark the groups
     mark.col= groupColours)

##Cambiar atributos del grafo

V(g)[which(actores$BestActorActress %in% "Winner")]$color <- "red"

pelis <- c("Forest Gump", "The Rock")
indices <- E(g)$Movie %in% pelis

E(g)[indices]$color <- "red"
plot(g)

##Modificar el grafo

legend(g, legend = degree(g, mode = "all"))
