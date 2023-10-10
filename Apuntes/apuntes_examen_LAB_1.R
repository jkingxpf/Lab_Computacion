##FicheroR para el examen de Laboratorio de Computación Cientifica
##Por Joaquín Fernández Suárez

#--------------------------------------------------------------------------------
##Librerias importantes

##Instaling Rgraphviz
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Rgraphviz")

##Reglas de asociación 
library(arules)

##Conjunto de librerias 
library(tidyverse)

##Visualización de gráficas :: tidyverse
library(ggplot2)

##Manejo de fechas :: tidyverse
library(lubridate)

##Libreria de FCA 
library(fcaR)

#-------------------------------------------------------------------------------
#R basico

##Como saber la clase de una variable
class()

##Separar vector por un simbolo
split()

##Repeticion de una secuencia
rep()

##Secuencia de valores
seq()

##Secuencia de valores de unidad en unidad
c(1:10)

##ordenar una lista
sort()

##obtener el orden de los elementos de una lista
order() ##Devuelve posiciones

##añadir a los elementos de una cadena un nuevo elemento
paste0(c(1:10),c(10:1))
paste0(c(5:50)," + 2")

##nombre de filas y de columnas de una matriz o dataset

colnames()
rownames()






#-------------------------------------------------------------------------------
##Tydiverse

##ordenar datasets
arrange() 

#-------------------------------------------------------------------------------
##Arules
##Funcionamiento de cut y ordered para discretizar
v1 <- c(1:100)
v2 <- cut(v1,c(0,25,50,75,100),labels = c("bajo","medio","alto","muyalto"))
v3 <- ordered(v2) 

##Transformar a dato transacción
as(Dataset_procesado,"transactions")

##Comvertir atributo en factor
factor()

##Crear una lista como por ejemplo, una lista de canciones por cada usuario
lista.musica.por.usuario <- split(x=lastfm[,"artist"],f=lastfm$user)

##Ver la frecuencia de los items
data("Mushroom")
itemFrequencyPlot(Mushroom)

##Subset de reglas segun una formula
subset()

##Allin/in/parcialin
#        %ain%  / %in% / %pin%

#-------------------------------------------------------------------------------
##FCA 

##Encontrar todos los conceptos y todas las impicaciones
fc$find_concepts()
fc$find_implications()

##Encontrar los intent(atributos relacionados a objetos) y extends (objetos relacionados a atributos)
S <- Set$new(attributes = objetos)
S$assign(objetos_a_elegir, valores)

fc$intent(S)-> atributos 

SS <- Set$new(attributes = atributos)
SS$assign(atributos_a_elegir, valores)

fc$extent(SS) -> objetos

##Encontrar los atributos cerrados de un conjunto s

SS <- Set$new(attributes = atributos)
SS$assign(s, valores)

fc$clousure(SS) -> atributo

##Comprobar si set SS es cerrado

fc$is_closed(SS)

##pasar FC a latex
fc$to_latex()

##Observar FC

fc$plot()
fc$print()

##Clarification y reduction

##Solo objetos FC binarios con redundancias de atributos
fc$reduce(TRUE)

##Reducir objetos y atributos redundantes en FC
fc$clarify(TRUE)

##Guardar y cargar FC
fc$save(filename = "./file.rds")
fc2 <- FormalContext$new()
fc2$load("./file.rds")

##Coger todos los extends y los intents de los conceptos como matriz

fc$concepts$extents()

fc$concepts$intents()

##Lista de soporte
fc$concepts$support()

##sublattices

idx <- which(fc$concepts$support() > 0.2)
sublatice <- fc$concepts$sublattice(idx)
sublatice

fc$concepts$plot()
sublatice$plot()

##Subconcepts and superconcepts

C <- fc$concepts[5]
fc$concepts$subconcepts(C)
fc$concepts$superconcepts(C)

##Tambien podemos calcular el supremo y el infimo de un conjunto como el subconcep
##mas comun de todos los dados y el superconcept menos comun.

C <- fc$concepts[5:9]

# Supremum of the concepts in C
fc$concepts$supremum(C)

# Infimum of the concepts in C
fc$concepts$infimum(C)

#Cantidad de reglas
fc$implications$cardinality()

#Media de los elementos de izquiera y derecha de la regla
sizes <- fc$implications$size()
sizes
colMeans(sizes)

#aplicar reglas de simplificacion
fc$implications$apply_rules(rules = c("composition",
                                      "generalization",
                                      "simplification",
                                      "r-simplification"),
                            parallelize = FALSE)
#Importar reglas de asociacion (arules) a FCA

fc <- FormalContext$new(dataset)
fc$implications$add(reglas_arules)

#Pasar de FCA a Arules
R <- fc$implications$to_arules()

#Sacar irreducibles

fc$concepts$join_irreducible()
