##Joaquín Fernández Suárez
##Ejercicio 1:
##a
data("mtcars")

mtcars_kg <- cbind(mtcars, kg = mtcars$wt * 0.453592 * 1000)

##b
M0 <- mean(mtcars_kg$kg)
f_co <- function(kg){
  
  return(95+0.0333*(kg - M0))
}
mtcars_kg_CO <- cbind(mtcars_kg, onjetivo_CO2 = f_co(mtcars_kg$kg))

##c

ordenado <- mtcars_kg_CO[order(mtcars_kg_CO$onjetivo_CO2, decreasing = TRUE),]

head(ordenado)

subset(ordenado, select = c(kg,onjetivo_CO2))

##d

cinco <- head(ordenado,5 )

cbind(cinco, media_kg = mean(cinco$kg))   

##------------------------------------------------------------------------------
##Ejercicio 2:
##a

mpg_order <- unique(mtcars$mpg[order(mtcars$mpg,decreasing = TRUE)])
drat_order <- unique(mtcars$drat[order(mtcars$drat,decreasing = TRUE)])
cyl_order <- unique(mtcars$cyl[order(mtcars$cyl,decreasing = TRUE)])

my_list <- list(cilindrada_ordenada = cyl_order,
                mile_por_hora = mpg_order,
                drat = drat_order)
my_list

##b
length(my_list)

##c length(my_list) = 3

##d
my_list$cilindrada_ordenada
my_list[[1]]

## e my_list[[1]] = [1] 8 6 4

##f
my_list[1]

##g
my_list[[2]][1]

##h my_list[[2]][1] = 33.9

##------------------------------------------------------------------------------
##Ejercicio 3:
library(arules)
data("Mushroom")

##a

my_rules <- apriori(Mushroom,parameter = list(supp = 0.35017,conf =  0.38374))


##b
length(my_rules)
summary(my_rules)

##C

summary(my_rules[2])

##d
head(sort(my_rules, subset = suport), 4)

the_force <- inspect(head(sort(my_rules, subset = suport), 4))

##e

the_force$rhs

##f
rules2 <- subset(my_rules,my_rules@quality$lift == 1)
inspect(head(rules2, 10))

##g
r1 <- subset(my_rules,
             subset = (confidence >=  0.3846154)) 
             
r2 <- subset(r1, subset = rhs %in% c("VeilColor=white") )

inspect(r2)



length(r1)
inspect(head(r1,5))

##h
ordenado <- sort(my_rules, by = "confidence" )
inspect(ordenado[3544])

inspect(head(Mushroom))

subset(Mushroom,Mushroom@itemInfo$variables %in% c(GillSpace=close) )


