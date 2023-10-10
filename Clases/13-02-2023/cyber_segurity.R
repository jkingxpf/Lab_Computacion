library(readr)
library(dplyr)
library(magrittr)

Cyber_Segurity_Breaches <- Cyber.Security.Breaches

breaches <- Cyber_Segurity_Breaches %>% select(-c(1,2), year,Number)%>%
            select(year,everything()) %>%
            #filter(year!=2002,State=="TX")
            #filter(year %in% c(2002,2003)) %>%
            mutate(selecionado=year+1) %>%
            arrange(State,desc(year))
View(breaches)

resumen <- Cyber_Segurity_Breaches %>%
            group_by(year) %>%
            summarise(max(Individuals_Affected),
                      mean(Individuals_Affected),
                      total=n())
View(resumen)

breaches <- Cyber_Segurity_Breaches %>% select(-c(1,2), year,Number)%>%
  select(year,everything()) %>%
  slice_head(n=10)

View(breaches)
