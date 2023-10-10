## ----setup, include=FALSE-------------------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)


## ----cargandolibrerias,echo=TRUE------------------------------------------------------
library(arules)
data("AdultUCI")
View(AdultUCI)
str(AdultUCI)


## ----borrando columna,echo=TRUE-------------------------------------------------------
AdultUCI$fnlwgt <-NULL  
## o  AdultUCI[["fnlwgt"]] <- NULL

AdultUCI$`education-num` <- NULL 


## ----cut,echo=TRUE--------------------------------------------------------------------
# ejemplo de funcionamiento de cut y ordered
v <- 1:100
v2 <- cut(v,c(0,25,50,75,100),labels=c("bajo","medio","alto","muyalto"))
?ordered
v3 <- ordered(v2)


## ----discretizar,echo=TRUE------------------------------------------------------------

AdultUCI$age <- ordered(cut(AdultUCI[[ "age"]], c(15,25,45,65,100)),
  labels = c("Young", "Middle-aged", "Senior", "Old"))

AdultUCI[[ "hours-per-week"]] <- ordered(cut(AdultUCI[[ "hours-per-week"]],
  c(0,25,40,60,168)),
  labels = c("Part-time", "Full-time", "Over-time", "Workaholic"))

AdultUCI[[ "capital-gain"]] <- ordered(cut(AdultUCI[[ "capital-gain"]],
  c(-Inf,0,median(AdultUCI[[ "capital-gain"]][AdultUCI[[ "capital-gain"]]>0]),
  Inf)), labels = c("None", "Low", "High"))

AdultUCI[[ "capital-loss"]] <- ordered(cut(AdultUCI[[ "capital-loss"]],
  c(-Inf,0, median(AdultUCI[[ "capital-loss"]][AdultUCI[[ "capital-loss"]]>0]),
  Inf)), labels = c("None", "Low", "High"))




## ----aprioriNoParametros,echo=TRUE----------------------------------------------------
reg <- apriori(AdultUCI)
inspect(head(reg))


## ----convirtiendoadult,echo=TRUE------------------------------------------------------
Adult1 <- as(AdultUCI, "transactions")
class(Adult1)
length(Adult1)
dim(Adult1)
Adult1
inspect(Adult1[1:2])


## ----innspeccionandoAdult,echo=TRUE---------------------------------------------------
data("Adult")
class(Adult)
length(Adult)
dim(Adult)
Adult
inspect(Adult[1:2])


## ----operacionesReglas,echo=TRUE, eval=FALSE------------------------------------------
## data("Adult")
## r1 <- apriori(Adult[1:1000], parameter = list(support = 0.5))
## r2 <- apriori(Adult[1001:2000], parameter = list(support = 0.5))
## #Convertir en un dataframe
## dfr1 <-DATAFRAME(r1)
## r_comb <- c(r1, r2)
## duplicated(r_comb)
## intersect(r1,r2)
## union(r1,r2)
## lhs(reglas1)
## rhs(reglas1)
## class(lhs(reglas1))

