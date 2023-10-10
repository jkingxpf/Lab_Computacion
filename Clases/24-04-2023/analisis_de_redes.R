library(igraph)
library(igraphdata)
library(readr)
actores <- read_csv("~/R/Lab_Computacion/Clases/24-04-2023/actores.csv")
peliculas <- read_csv("~/R/Lab_Computacion/Clases/24-04-2023/peliculas.csv")

g_pelis <- graph_from_data_frame(d = peliculas, vertices = actores,directed = FALSE)
plot(g_pelis)

#cantidad nodos
length(V(g_pelis))

#cantidad arcos
length(E(g_pelis))

#Nodo 3
V(g_pelis)[3]

#Arco 1
E(g_pelis)[1]

#Cambiar layaout
plot(g_pelis,
     layout_as_tree = TRUE)

#Agrupar aquellos que tengan un oscar
group_oscar <- list(which(actores$BestActorActress %in% "Winner"))

group_color <- c(rgb(0.1,0.5,0.5,0.5))

plot(g_pelis,
     mark.groups =group_oscar, # Mark the groups
     mark.col= group_color,
     
     layout_as_star = TRUE
)

#Cambiar atributos

V(g_pelis)$color <- "green"
E(g_pelis)$color <- "blue"

plot(g_pelis)


pelis <- c("Forest Gump", "The Rock")
indices <- E(g_pelis)$Movie %in% pelis

E(g_pelis)[indices]$color <- "red"
tkplot(g_pelis)
