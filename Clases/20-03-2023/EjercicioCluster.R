library(readr)
library(dplyr)
library(ggplot2)

states <- read_csv("R/Lab_Computacion/dataset/unempstates.csv")
View(states)

View(states[c(1:5)])

summary(states)
str(states)

class(states)
tstates <- t(states)

tstates <- as.data.frame(tstates)

states %>% ggplot(aes(x = 1:length(states$AL))) +
  geom_point(aes(y = AL), colour = "blue") +
  geom_point(aes(y = AK),colour = "red" )
  ggplot(aes(x = A)) +
  geom_bar() +
  ggplot(aes(x = V3 )) +
  geom_bar()


clustering_tstados <- kmeans(tstates,centers = 2, iter.max = 100)

summary(clustering_tstados)

str(clustering_tstados)

agrupaciones <- data.frame(clusters = clustering_tstados$cluster)

head(agrupaciones,10)

sum(agrupaciones$clusters == 1)
sum(agrupaciones$clusters == 2)


clustering_tstados_3 <- kmeans(tstates,centers = 3, iter.max = 100)
agrupaciones_2 <- data.frame(clusters = clustering_tstados_3$cluster)

head(agrupaciones_2,10)

sum(agrupaciones_2$clusters == 1)
sum(agrupaciones_2$clusters == 2)
sum(agrupaciones_2$clusters == 3)


clustering_tstados_4 <- kmeans(tstates,centers = 4, iter.max = 100)
agrupaciones_3 <- data.frame(clusters = clustering_tstados_4$cluster)

head(agrupaciones_3,10)

sum(agrupaciones_3$clusters == 1)
sum(agrupaciones_3$clusters == 2)
sum(agrupaciones_3$clusters == 3)
sum(agrupaciones_3$clusters == 4)

clustering_tstados_4$size


