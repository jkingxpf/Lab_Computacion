library(ggplot2)
library(dplyr)
library(readr)

landdata_states <- read_csv("dataset/landdata-states.csv")

subState <- subset(landdata_states, landdata_states$Date == 2001.25)

p1 <- subState %>% ggplot(aes(x = Land.Value, y = Structure.Cost)) +
  geom_point()

p1 + geom_point(aes(color = subState$Home.Value))+ geom_smooth()

p1 + geom_point(aes(color = Home.Value, shape = region))
