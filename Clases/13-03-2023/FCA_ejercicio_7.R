library(arules)
library(fcaR)

fc_ganter <- readRDS("R/Lab_Computacion/Clases/13-03-2023/fc_ganter_rds.rds")

fc_ganter
fc_ganter$plot()

fc_ganter$find_implications()
fc_ganter$implications

fc_ganter$implications$cardinality()

sizes <- fc_ganter$implications$size()
colMeans(sizes)

fc_ganter$implications$apply_rules(rules = c("simplification"),
                                   parallelize = F)
fc_ganter$implications


fc_ganter$implications$apply_rules(rules = c("composition",
                                             "simplification",
                                             "generalization"),
                                   parallelize = F)

sizes <- fc_ganter$implications$size()

S <- Set$new(attributes = fc_ganter$attributes)
S$assign(`needs water` = 1, `one seed leaf` = 1)

fc_ganter$implications$closure(S)

fc1 <- fc_ganter$clone()

fc1

fc1$implications <- fc1$implications[-1]

fc1$implications$filter(lhs = "one seed leaf")

fc1$implications$get_attributes()

fc1$implications$support()