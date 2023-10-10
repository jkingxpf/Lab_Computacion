library(fcaR)

objects <- paste0("O",1:6)
n_objects <- length(objects)

atributes <- paste0("P",1:6)
n_atributes <- length(atributes)

I <- matrix(data = c(0, 1, 1, 0, 0, 1,
              1, 1, 1, 0, 0, 0,
              1, 1, 0, 0, 1, 0,
              1, 0, 0, 1, 1, 0,
              1, 0, 0, 1, 0, 0,
              0, 0, 1, 0, 0, 0),
            nrow = n_objects,
            byrow = F)

colnames(I) <- atributes 
rownames(I) <- objects

I

fc <- FormalContext$new(I)

#Compute implications
fc$find_implications(verbose = F)

#Cardinality and mean size in the ruleset
fc$implications$cardinality()

sizes <- fc$implications$size()

colMeans(sizes)

#the implications

fc$implications

#Visualzation
fc$concepts$plot()

fc$plot()

##Eliminar redundancias
fc$implications$apply_rules(rules = c("composition",
                                      "generalization",
                                      "simplification"),
                            parallelize = F)
fc$implications$cardinality()

sizes <- fc$implications$size()

colMeans(sizes)

fc$implications

##La manera continua

objects_c <- paste0("O",1:6)
n_objects_c <- length(objects_c)

atributes_c <- paste0("P", 1:6)
n_atributes_c <- length(atributes_c)

IC <- matrix(data = c(0, 1, 0.5, 0, 0, 0.5,
               1, 1, 0.5, 0, 0, 0,
               0.5, 1, 0, 0, 1, 0,
               0.5, 0, 0, 1, 0.5, 0,
               1, 0, 0, 0.5, 0, 0,
               0, 0, 1, 0, 0, 0),
             nrow = n_objects_c,
             byrow = F)

colnames(IC) <- atributes_c
rownames(IC) <- objects_c

IC

fcc <- FormalContext$new(IC)

##Compute
fcc$find_implications()


fcc$implications$cardinality()
sizes <- fcc$implications$size()

colMeans(sizes)

##Visualizacion

fcc$plot()

##Eliminar redundancias

fcc$implications$apply_rules(rules = c("composition"),
                             reorder = F,
                             parallelize = F)

fcc$implications

fcc$implications$cardinality()

sizes <- fcc$implications$size()

colMeans(sizes)

fcc$implications$apply_rules(rules = c("simplification"),
                             reorder = F,
                             parallelize = F)

fcc$implications$cardinality()

sizes <- fcc$implications$size()

colMeans(sizes)

fcc$implications$apply_rules(rules = c("generalization"),
                             reorder = F,
                             parallelize = F)

fcc$implications$cardinality()

sizes <- fcc$implications$size()

colMeans(sizes)

##Closures

S <- Set$new(attributes = fcc$attributes)
S$assign(P2 = 0.5, P3 = 0.5)
S

fcc$implications$closure(S)
