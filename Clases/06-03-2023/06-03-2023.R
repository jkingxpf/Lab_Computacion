library(fcaR)
data("planets")


objects <- c("Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus",
             "Neptune","Pluro")

fc_planets <- FormalContext$new(planets)

fc_planets$print()
fc_planets$plot()
fc_planets$to_latex()

S <- Set$new(attributes = fc_planets$objects)
S$assign(Jupiter = 1, Saturn = 1)
cat("Given the set of objects:")
s
cat("The extent is:")

SS <- Set$new(attributes = fc_planets$attributes)
SS$assign(moon = 1, large = 1)

fc_planets$extent(SS)
fc_planets$extent(S)
fc_planets$intent(S)

fc_planets$closure(S)

fc_planets$find_concepts()
fc_planets$concepts
fc_planets$concepts$plot()
fc_planets$implications
fc_planets$find_implications()
fc_planets$implications

