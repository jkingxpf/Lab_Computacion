library(tidyverse)
library(factoextra)
library(f)
ToyotaCorolla <- read_csv("R/Lab_Computacion/dataset/ToyotaCorolla.csv")
ToyotaCorolla <- na.omit(ToyotaCorolla)

Toyota_groups <- kmeans(ToyotaCorolla %>% select(c("Price")),
       centers = 4,
       iter.max = 1000)

Toyota_groups$centers
Toyota_groups$size

Toyota1 <- ToyotaCorolla
Toyota1$cluster <- Toyota_groups$cluster
Toyota1 <- Toyota1[order(Toyota1$cluster),]

str(Toyota_groups)

m1 <- filter(Toyota1,Toyota1$cluster == 1)
m2 <- filter(Toyota1,Toyota1$cluster == 2)
m3 <- filter(Toyota1,Toyota1$cluster == 3)
m4 <- filter(Toyota1,Toyota1$cluster == 4)

dt <- function(ap){
  sqrt(mean(ap^2) - mean(ap)^2)
}

t <- data.frame(media = c(mean(m1$Price),
                mean(m2$Price),
                mean(m3$Price),
                mean(m4$Price)),
                desviacion = c(dt(m1$Price),
                               dt(m2$Price),
                               dt(m3$Price),
                               dt(m4$Price)))

t %>% ggplot(aes())

dist(ToyotaCorolla %>% select(c("Price","KM","Age", "HP"), meth)
