library(tidyverse)
library(openintro)
library(ggplot2)

data(birds)

species_effect_counts <- birds %>%
  group_by(species, effect) %>%
  summarise(Count = n(), .groups = 'drop') 


top_species <- species_effect_counts %>%
  group_by(species) %>%
  summarise(Total = sum(Count)) %>%
  top_n(10, Total) %>%  
  pull(species)

filtered_data <- species_effect_counts %>%
  filter(species %in% top_species)

# Create the bar chart
ggplot(filtered_data, aes(x = species, y = Count, fill = effect)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Impact of Top Bird Species on Collision Effects",
       x = "Species",
       y = "Number of Collisions",
       fill = "Collision Effect") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 65, vjust = 0.6),  
        plot.margin = unit(c(1,1,1,1), "cm")) 



