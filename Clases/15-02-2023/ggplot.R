library(tidyverse)
data(mpg)

mpg %>%
  ggplot()+
   geom_point(mapping = aes(x=displ, y=hwy,color = cyl))+
   geom_smooth(mapping = aes(x=displ, y=hwy))
   #geom_point(mapping = aes(x=displ, y=hwy), color = "blue")
   #theme_dark()
