library(dplyr)
library(magrittr)
library(rmarkdown)
library(tidyverse)
library(arules)
soet2 <- read_csv("~/R/Lab_Computacion/Proyectos/ProyectoLAB/Survey on Employment Trends  2.csv")
View(soet2)

##primero realizaremos una limpieza de los datos relevantes del dataset,
##en este podemos localizar varias columnas de poco interes como el nombre de la
##persona, el timestamp y su correo electronico.

soet2_clean <- soet2 %>% select(-c(1,2,26))

#Ahora acortaremos los nombres de las columnas
soet2_clean <- soet2_clean %>% rename(edad = `Age group`,
                       contry = `Where are you from?`,
                       casado = `Marital status`,
                       experience = `Work experience`,
                       education = `Educational Qualification`,
                       studying = `Are you still studying?`,
                       degree_is_must = `Do you believe degree is a must for job?`,
                       dream_work_area = `Interested area of work`,
                       currently_employed = `Currently employed`,
                       career_break = `Did you have a career break?`,
                       career_switch = `Did you switch your career?`,
                       reason_shift_career = `Reason for shift in career?`,
                       buscando_trabajo = `Are you actively applying for job?`,
                       skills = `Skills that you are confident`,
                       job_preference = `Job preference`,
                       independent_projects = `Have you carried out any independent works or projects?`,
                       where_search_job = `Where do you search for Job?`,
                       job_response = `Are you receiving response from recruiter after applying?`,
                       freelance = `Are you interested in Freelancing?`,
                       dream_company = `Dream company type?`,
                       work_preference = `Preference of work`,
                       job_search_problems = `What are the problems faced while job search?`)

#Analisis de los datos

View(soet2_clean)

#Observaremos en el database que cantidad de gente esta buscando trabajo, y de esa gente
#cuantos estan trabajando de manera activa y cuantos no.

soet2_clean %>% ggplot(aes(x = buscando_trabajo)) +
  geom_bar(aes(fill = currently_employed), position = "dodge")+
  labs(
    x = "Busqueda de trabajo",
    fill = "Con empleo"
  )

#Comenzaremos analizando los posibles motivos por los que los no empleados son no empleados
# y buscan trabajo

soet2_desempleados <- dplyr::filter(soet2_clean, currently_employed == "No",
                             soet2_clean$buscando_trabajo %in% c("Casually","Yes"))


#¿Que formación tienen estas personas?

soet2_desempleados %>% ggplot(aes(y= education)) +
  geom_bar(fill = "blue") +
  labs(
    y = "Educación estudiada"
  )

#Vemos que las personas que tienen la titulación de Btech tienen menos empleabilidad
#¿Que problemas encuentras las personas desempleadas que buscan trabajo?

soet2_desempleados %>% ggplot(aes(y = job_search_problems)) +
  geom_bar(fill = "green")+
  labs(
    x = "Cantidad",
    y = "Problemas al buscar trabajo"
  )

#Vemos que el principal problema al encontrar trabajo recae en la falta de experiencia del candidato en la materia
#De estas personas con poca experiencia que rango de edad tienen.
soet2_desempleados %>% ggplot(aes(y = edad)) +
  geom_bar(fill = "green")+
  labs(
    y = "Edad"
  )

#Vemos que la gran mayoria son menores de 25 años lo que concuerda con la gran cantidad de personas con falta de experiencia
#que existe entre los desempleados, como vemos en la grafica de abajo.

soet2_desempleados %>% ggplot(aes(y = job_search_problems)) +
  geom_bar(aes(fill = edad), position = "dodge") +
  labs(
    y = "Problemas al encontrar trabajo"
  )

#€Con estos datos nos surge otra pregunta, que tipo de educación tienen estas personas y que porblemas
##tienen segun su educación.

soet2_desempleados %>% ggplot(aes(y= education)) +
  geom_bar(aes(fill = job_search_problems), position = "dodge") +
  labs(
    y = "Educación estudiada"
  )


## Con esto podemos tener un primer vistazo de el tipo de información que nos vamos a econtrar
## en este dataframe. A continuación los datos seran analizados a partir de diferentes tecnicas

##Reglas de asociación.

##Primero prepararemos un dataframe a partir de soet2_clean para poder trabajar con
##reglas de asociación.

str(soet2_clean)

reglas <- apriori(soet2_clean)
inspect(head(reglas,10))

length()
