library(tidyverse)
datos <- read_csv("R/Lab_Computacion/dataset/dataset938.csv")

##Construir un modelo de una variable
modelo <- lm(gastos~empleados, datos)

##Coeficientes
modelo$coefficients

##Dibujar el modelo

datos %>% ggplot(aes(x = empleados)) +
  geom_point(aes(y = gastos))+
  geom_line(aes(y = predict(modelo,datos), color = "red"))

##Predecir y segun x dados

d <-  data.frame(empleados = c(347, 349, 351))
predict(modelo, d)

##Coeficiente de determinación
summary(modelo)

##Gráficas con información del modelo
plot(modelo)


##-------------------------------------------

insurance <- read_csv("R/Lab_Computacion/dataset/insurance.csv")

##matrix de correlaciones 
cor(insurance[c("age","bmi","children","expenses")])

##Visualizar relaciones
pairs(insurance[c("age","bmi","children","expenses")])

##libreria psych
library(psych)

##Visualizacion con libreria psych
pairs.panels(insurance[c("age","bmi","children","expenses")])

##modelo con todas las variables

modelo2 <- lm(expenses~. , insurance)
summary(modelo2)

##mejorar modelo con calores no lineales

modelo_no_lineal <- update(modelo2, . ~ . + I(age^2), data=insurance)
summary(modelo_no_lineal)

##Sustituir un dato or otro

insurance$bmi <- as.numeric(insurance$bmi >= 30)
insurance <- rename(insurance, bmi30 = bmi)

##Crear modelo 4 con todas las variables.

modelo4 <- lm(expenses~. , insurance)
