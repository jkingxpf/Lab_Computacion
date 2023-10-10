library(dplyr)
library(knitr)
library(tidyverse)

food <- read_csv("R/Lab_Computacion/dataset/protein.csv")

dim(food)

my_food <- food %>% select(-1)

grpMeat <- kmeans(my_food %>% select(c("WhiteMeat","RedMeat")),
                  centers = 3,
                  nstart = 1000)

str(grpMeat)
summary(grpMeat)

grpMeat

Gr1 <- order(grpMeat$cluster)
Gr1

Gr1_food <- food
Gr1_food$cluster <- grpMeat$cluster

Gr1_food %>% ggplot(aes(x = WhiteMeat, y = RedMeat)) +
  geom_point(aes(color = as.factor(cluster))) +
  labs(
    points = Gr1_food$Country
  )

plot(food$RedMeat, food$WhiteMeat, type="n", xlim=c(3,19), xlab="Red Meat", ylab="White Meat")
text(x=food$RedMeat, y=food$WhiteMeat, labels=food$Country,
     col=grpMeat$cluster+1)

grpProtein <- kmeans(food %>% select(-1), centers = 7, iter.max = 1000)

Gr1_protein <- food
Gr1_protein$cluster <- grpProtein$cluster 

Gr1_protein %>% ggplot(aes(x = WhiteMeat, y = RedMeat)) +
  geom_point(aes(color = as.factor(cluster))) +
  labs(
    points = Gr1_food$Country
  )
