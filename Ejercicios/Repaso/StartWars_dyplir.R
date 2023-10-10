library(dplyr)
library(tidyverse)
library(magrittr)
library(ggplot2)
library(rmarkdown)

paged_table(starwars)

data("starwars")

##Filtrado de la muestra por peso y altura

starwars1 <- starwars %>% filter(mass < 500, height < 225)


starwars1 %>% ggplot(aes(y = mass,x = height)) +
  geom_point() +
  geom_smooth()

##Visualizar los datos pero con el genero

starwars_no_na <- drop_na(starwars)

starwars_no_na %>% ggplot(aes(y = mass, x = height, color = sex)) +
  geom_point() 

##Obtener los 10 humanos mas viejos, masculinos, con plameta natal tatooine

tatooine <- starwars %>% filter(gender == "masculine",species == "Human", homeworld == "Tatooine")
class(tatooine)

head(arrange(tatooine, desc(tatooine$birth_year)),10)

##Arios entre nosotros

tatooine_ario <- tatooine %>% filter(hair_color == "blond", eye_color == "blue")

arrange(tatooine_ario,desc(tatooine_ario$birth_year))

mean(tatooine_ario$height)

##Clasificar especies por su peso, especie naboo y human

naboo_human <- starwars %>% filter(species %in% c("Human","Naboo"))

heavyorlight <- if_else(naboo_human$mass > 79,
                        true = "pesado",
                        false = "ligero",
                        missing = "etereo") 

heavyorlight
pesaje <- data.frame(name = naboo_human$name,height = naboo_human$height,mass = naboo_human$mass,heavyorlight)

arrange(pesaje,desc(pesaje$mass))

##IMC de mis compas aliens

starwars_F <- drop_na(starwars,height,mass)

f_IMC <- function(peso,altura){
  return(peso/(altura^2))
}

starwars_IMC <- data.frame(name = )