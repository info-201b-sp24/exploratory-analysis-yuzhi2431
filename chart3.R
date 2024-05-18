library(tidyverse)
library(openintro)
library(ggplot2)
 
data(birds)

sky_effect_counts <- birds %>%
  group_by(sky, effect) %>%
  summarise(Count = n(), .groups = 'drop')

ggplot(sky_effect_counts, aes(x = sky, y = Count, fill = effect)) +
  geom_bar(stat = "identity") +
  labs(title = "Collision Effects Under Different Sky Conditions",
       x = "Sky Condition",
       y = "Number of Collisions") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))