#Joaquín Fernández Suárez Informática B
library(dplyr)
library(magrittr)
library(ggplot2)
library(rmarkdown)
library(tidyr)
paged_table(starwars)
##xlimit limit
#1
starwars %>% ggplot(aes(y = starwars$mass,x = starwars$height)) + geom_point()

n_starwars <- starwars %>% filter(mass <= 500, height < 225 )

n_starwars %>% ggplot(aes(y = mass,x = height)) + geom_point() + geom_smooth()

#2

n_g_starwars %>% ggplot(aes(y = mass, x = height,color = gender)) +
  geom_point()

n_g_starwars <- n_starwars %>% drop_na()
View(n_g_starwars)

#3

machos <- starwars %>% drop_na(birth_year) %>%
  filter(species == "Human", homeworld == "Tatooine", sex == "male") %>%
  arrange(desc(birth_year)) %>% head(6)
machos

#4

arios <- starwars %>% filter(species == "Human",
                             homeworld == "Tatooine",
                             hair_color == "blond",
                             eye_color == "blue") %>% 
  arrange(desc(birth_year))
arios

mean(arios$height)

#5

h_naboos <- starwars %>% filter(species %in% c("Human","Naboo"))

h_naboos$heavyorlight <- ifelse(h_naboos$mass > 79, "heavy","light")

h_naboos$heavyorlight

f_h_naboos <- select(h_naboos,h_naboos$name,h_naboos$height,h_naboos$mass,
                     h_naboos$heavyorlight)
