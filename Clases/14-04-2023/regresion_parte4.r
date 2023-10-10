library(tidyverse)
library(skimr) 

library(readr)
evaluacion <- read_csv("~/R/Lab_Computacion/dataset/evaluation_courses.csv")
evals5 <- evaluacion %>% 
  select(ID, score, bty_avg, age,gender)  

head(evals5)
summary(evals5)
 

glimpse(evals5)

evals5 %>% skim()

evals5 %>%
  sample_n(size = 5)

evals5 %>%
  summarize(mean_bty_avg = mean(bty_avg), 
            mean_score = mean(score),
            median_bty_avg = median(bty_avg), 
            median_score = median(score))

evals5 %>% select(score, bty_avg) %>% skim()
  

evals5 %>% 
  summarize(correlation = cor(score, bty_avg))
 
ggplot(evals5, aes(x = age, y = score, color = gender)) +
  geom_point() +
  labs(x = "Edad", y = "Nota de evaluación", color = "Género") +
  geom_smooth(method = "lm", se = FALSE)
 
model1 <- lm(score ~ bty_avg, data = evals5)
model1
summary(model1)

ggplot(evals5, aes(x = bty_avg, y = score)) +
  geom_point() +
  geom_line(aes(x = bty_avg, y = predict(model1,evals5)),col="blue") 

 
ggplot(evals5, aes(x = bty_avg, y = score)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

 
# Fit regression model:
modelo2 <- lm(score ~ age * gender, data = evals5)

modelo2
summary(modelo2)
 
evals5 %>% select(score, age, gender) %>% skim()
 
 
 
evals5 %>% 
  summarize(correlation = cor(score, age))
 
ggplot(evals5, aes(x = age, y = score, color = gender)) +
  geom_point() +
  labs(x = "Age", y = "Teaching Score", color = "Gender") +
  geom_smooth(method = "lm", se = FALSE)
 
# Fit regression model:
model1 <- lm(score ~ age , data = evals5)

model2 <- lm(score ~ age  +  bty_avg , data = evals5)

model1

model2

summary(model1)

summary(model2)
 