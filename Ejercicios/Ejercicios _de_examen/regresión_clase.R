library(tidyverse)
data <- read_csv("R/Lab_Computacion/dataset/dataset938.csv")

data
#1
modelo <- lm(gastos~empleados,data)

##2
data %>% ggplot(aes(x = empleados)) + 
  geom_point(aes( y = gastos)) +
  geom_line(aes(y = predict(modelo,data),color = "red") )

##En el gráfico podemos ver que existe una correlación bastante fuerte entre la variable empleado
## y la variable gasto, permitiendo predecir la tendencia del gasto segun la cantidad de empleados.

#3
mean(predict(modelo, data.frame(empleados = c(347, 349, 351))))

#4
summary(modelo)

#5
plot(modelo)

#8
coefficients(modelo)

#10

modelo6 <- lm(gastos~I(empleados^3),data)

summary(modelo6)
