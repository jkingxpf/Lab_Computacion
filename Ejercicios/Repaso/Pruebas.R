library(arules)
library(dbplyr)
library(lubridate)

data("Adult")
class(Adult)
length(Adult)
dim(Adult)
Adult
inspect(Adult[1:2])

reglas <- apriori(Adult,parameter = list(supp = 0.5, confidence = 0.9))
summary(reglas)

inspect(head(reglas))
