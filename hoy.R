library(arules)
data("Mushroom")
mush <- apriori(Mushroom, parameter = list(supp = 0.28818,conf=0.27634,minlen = 2) )

mush2 <- apriori(Mushroom, parameter = list(supp = 0.28818,conf=0.27634,minlen = 3,maxlen = 3) )

length(mush2)

length(mush[1])

is.redundant(mush)
mush_r <- mush[!is.redundant(mush)]
length(mush_r)

##B

inspect(head(mush2,10))
mush[2]@quality$lift

##C
orden <- mush[order(mush@quality$lift,decreasing = T)]
inspect(head(orden,10))

inspect(order[4]@rhs)

##D
rules2 <- subset(mush, mush@quality$lift >  0.7557446)

inspect(head(rules2,10))

rules2 <- rules2[order(rules2@quality$confidence, decreasing  = T)]

rules2[1]@quality$confidence

##E

e <- subset(mush,mush@rhs %in% c("VeilType=partial"))
a <- subset(mush,mush@rhs %ain% c("VeilType=partial"))

inspect(tail(e,10))

inspect(setdiff(mush[1]@rhs,mush[46]@rhs))

length(e)

itemFrequencyPlot(Mushroom)

##F
itemFrequency(Mushroom)[1]

o <- itemFrequency(Mushroom)[order(itemFrequency(Mushroom), decreasing = T)]
o[1:2]

reglas <- subset(mush, mush@lhs %ain% c("VeilType=partial","VeilColor=white"))

reglas_de_dos <- reglas[is.significant(reglas)]

inspect(head(reglas,10))

##G

inspect(orden[2901]@rhs)

filtrado <- subset(Mushroom, Mushroom %in% c("RingType=pendant"))
inspect(head(filtrado))
length(filtrado)

