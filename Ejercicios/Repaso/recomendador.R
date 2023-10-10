library(arules)
library(readr)

lastfm <- read_csv("R/Lab_Computacion/dataset/lastfm.csv")
lastfm[1:20,]

length(lastfm$user)
class(lastfm$user)

lastfm$user <- factor(lastfm$user)
levels(lastfm$user)

##lastfm$artist <- factor(lastfm$artist)
##levels(lastfm$artist)

reglas1 <- apriori(lastfm,parameter = list(supp = .01, conf = 0.5))

inspect(head(reglas1,10))

##Lista de musica por usuario
lista_musica_por_usuario <- split(x = lastfm$artist,lastfm$user)
head(lista_musica_por_usuario)


class(lista_musica_por_usuario)
##Elimina duplicado
lista_musica_por_usuario <- lapply(lista_musica_por_usuario, unique)

##Convertir a transacción
transacciones_musica_por_usuario <- as(lista_musica_por_usuario,"transactions")

str(transacciones_musica_por_usuario)

##Ver la frecuencia relativa  de las canciones

itfreq1 <- itemFrequency(transacciones_musica_por_usuario)
head(itfreq1)

reglas2 <- apriori(transacciones_musica_por_usuario,parameter = list(supp = 0.01,
                                                                     conf = 0.5))
reglas2
inspect(head(reglas2))

##Sistema de recomendación

reglas2_lisft <- subset(reglas2,subset = lift > 1)

##Ordenamos las reglas por la confianza

reglas2_lisft_ord <- sort(reglas2_lisft, by = "confidence")

##Recomendamos a un usuario que escucho coldplay

r1 <- subset(reglas2_lisft_ord,subset = lhs %in% c("coldplay"))
inspect(r1)


