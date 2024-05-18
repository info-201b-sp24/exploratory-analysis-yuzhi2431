library(tidyverse)
library(openintro)
library(ggplot2)

data(birds)

ggplot(data = birds %>% filter(!is.na(time_of_day)), 
       mapping = aes(x = height, y = time_of_day)) + 
  geom_boxplot() +
  xlim(0, 10000) +
  labs(x = "Height (ft)",
       y = "Time of day",
       title = "Distrubution of collision height under different time")
