library(fcaR)
library(arules)

data("Mushroom",package = "arules")

mush <- apriori(Mushroom,parameter = list(conf = 1))

##Preprocessing

system.time(
  idx_redundant <- is.redundant(mush)
)

mush_clean <- mush[!idx_redundant]

length(mush_clean)

##Import in fcaR

fc <- FormalContext$new(I = Mushroom)

fc$implications$add(mush_clean)

fc$implications$cardinality()

sizes <- fc$implications$size()

colMeans(sizes)

##Aplicando reglas

fc$implications$apply_rules(rules = c("composition",
                                      "generalization",
                                      "simplification"),
                            parallelize = F)

fc$implications$cardinality()

sizes <- fc$implications$size()

colMeans(sizes)

fc$implications$apply_rules(rules = c("composition",
                                      "generalization",
                                      "simplification",
                                      "r-simplification"),
                            parallelize = F)

fc$implications$cardinality()

sizes <- fc$implications$size()

colMeans(sizes)
