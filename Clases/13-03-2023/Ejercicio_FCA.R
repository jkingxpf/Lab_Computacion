library(fcaR)
library(readr)
library(dplyr)
library(hasseDiagram)

contextformal<- read_delim("R/Lab_Computacion/Clases/13-03-2023/contextformal_tutorialGanter.csv", 
                                           delim = ";", escape_double = FALSE, trim_ws = TRUE)


contextformal <- as.data.frame(contextformal)

rownames(contextformal) <- contextformal$...1
contextformal$...1 <- NULL


fc_ganter <- FormalContext$new(contextformal)

fc_ganter$plot()

fc_ganter$to_latex()

attr_ganter <- fc_ganter$attributes

obj_ganter <- fc_ganter$objects

obj_ganter

class(attr_ganter)
class(obj_ganter)

S <- Set$new(attributes = attr_ganter)
S$assign(`needs water` = 1, `lives in water` = 1)

fc_ganter$extent(S)


SS <- Set$new(attributes = obj_ganter)
SS$assign(`Leech` = 1, `Bream` = 1, `Frog` = 1, `Spike-Weed` = 1, `Reed` = 1)

fc_ganter$intent(SS)

fc_ganter$find_concepts()

fc_ganter$find_implications()

fc_ganter$implications$support()

fc_ganter$concepts$size()
fc_ganter$concepts$support() >= 0.3
conceptos <- fc_ganter$concepts[fc_ganter$concepts$support() >= 0.3]
conceptos

fc_ganter$concepts$bottom()
conceptos

fc_ganter$concepts$top()


saveRDS(fc_ganter,"R/Lab_Computacion/Clases/13-03-2023/fc_ganter_rds.rds")

fc_ganter <- readRDS("R/Lab_Computacion/Clases/13-03-2023/fc_ganter_rds.rds")
fc_ganter$concepts

