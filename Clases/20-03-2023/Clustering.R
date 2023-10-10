library(readr)
library(cluster)

protein <- read_csv("R/Lab_Computacion/dataset/protein.csv")
View(protein)

length(protein$Country)
protein$Country <- NULL

summary(protein)
protein <- scale(protein)

kmeans(protein)