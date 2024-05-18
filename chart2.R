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
ggsave("Top_Species_Collision_Effects.png", width = 12, height = 8)




## The stacked bar chart visually represents the impact of different bird species on aircraft-wildlife collisions, 
## highlighting how specific species characteristics influence collision outcomes. The distribution of effects—ranging 
##from "No Effect" to "Engine Shut Down"—varies significantly across species, suggesting that physical traits such as 
## size or flocking behavior might play a crucial role. For instance, species like gulls frequently appear in the "No Effect" 
category, indicating that collisions with these birds are less likely to cause damage. Conversely, other species that are associated with more severe outcomes like "Engine Shut Down" or "Precautionary Landing" might represent larger birds or those that tend to fly in flocks, thereby posing a greater threat to aircraft. This visualization underscores the importance of species-specific strategies in managing and mitigating risks associated with aircraft-wildlife collisions.
