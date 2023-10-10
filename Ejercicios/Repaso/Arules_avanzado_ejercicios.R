##Ejercicio 1:
library(arules)
library(readr)
library(ggplot2)
library(dplyr)
library(lubridate)
consumo <- read_csv("R/Lab_Computacion/Ejercicios/Repaso/consumo.csv")

##Ejercicio 2:

length(
  unique(consumo$Transaction) )

##Ejercicio 3:


contador <- count(consumo, consumo$Item)

top <- head(sort(contador$n, decreasing = TRUE),
     10)
top_10 <- filter(contador, contador$n %in% top)

top_10 %>% ggplot(aes(x = `consumo$Item`, y = n)) +
  geom_point()

##Ejercicio 4:
consumo$Day <- wday(consumo$Date)
consumo$Month <- month(consumo$Date)
consumo$Year <- year(consumo$Date)

contador_dia <- count(consumo, consumo$Day)
contador_mes <- count(consumo,consumo$Month)
contador_año <- count(consumo,consumo$Year)

arrange(contador_dia,desc(contador_dia$n))
arrange(contador_mes,desc(contador_mes$n))
arrange(contador_año,desc(contador_año$n))

##Ejercicio 5:
c <- data.frame(Transaction = consumo$Transaction,Item = consumo$Item)
View(c)
lista_compra_usuario <- split(consumo$Item,consumo$Transaction)
head(lista_compra_usuario)

##Ejercicio 6:
summary(lista_compra_usuario)

##Ejercicio 7:
length(lista_compra_usuario)

##Ejercicio 8:

Tlista_compra_usuario <- as(lista_compra_usuario,"transactions")

##Ejercicio 9:

inspect(Tlista_compra_usuario)

##Ejercicio 10:
reglas <- apriori(Tlista_compra_usuario, parameter = list(supp = 0.15,conf = 0.3))

##Ejercicio 11:
inspect(reglas)

