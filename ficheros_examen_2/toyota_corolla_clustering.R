library(tidyverse)
ToyotaCorolla <- read_csv("R/Lab_Computacion/dataset/ToyotaCorolla.csv")

##Aplicar kmeans con cuatro centros.

kmeans_toyota <- kmeans(ToyotaCorolla %>% select(c("Price","KM")),
                        centers = 4,
                        iter.max = 1000)

##Ver el tamaño de los grupos y sus centros.

##Centros
kmeans_toyota$centers

##Tamaños
kmeans_toyota$size

##Ordenar los estados según el cluster y almacenar la información

toyota <- ToyotaCorolla
toyota$group <- kmeans_toyota$cluster
toyota <- toyota[order(toyota$group),]

##Visualizar

##Visalizar los grupos según sus variables

toyota %>% ggplot(aes(x = Price, y = KM)) + 
  geom_point(aes(color = as.factor(group)))

##Poniendo el nombre de la fila en los puntos

toyota %>%
  as_tibble() %>%
  mutate(cluster = toyota$group,
         state = row.names(toyota)) %>%
  ggplot(aes(Price, KM, color = factor(cluster), label = state)) +
  geom_text()


##Calcular la distancia euclidea de las filas.
euclidean_dist <- dist(ToyotaCorolla %>% select(c("Price","KM")), method = "euclidean")

##Realizar un dendograma

library(cluster)
library(factoextra)

toyota_jerarquico <- hclust(d = euclidean_dist,method = "complete")

fviz_dend(toyota_jerarquico,k = 5)

##obtener los clusters
cutree(toyota_jerarquico,k = 5)

##Visualizar distancias
euclidean_dist %>% fviz_dist()

##Merge
toyota_jerarquico$merge

##Visualizar la cantidad optima de clusters
##Importante no usar variables caracteristicas con distancias en las que no se puede usar

fviz_nbclust(x = ToyotaCorolla %>% select(-"FuelType"),
             method = "wss",
             FUNcluster = kmeans,
             diss = euclidean_dist )

##Visualizar clusters con las dos variables PCA más significativas

fviz_cluster(data = ToyotaCorolla %>% select(-"FuelType"), object = kmeans_toyota)
