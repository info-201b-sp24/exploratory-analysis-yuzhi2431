library(tidyverse)
library(openintro)
library(ggplot2)

data(birds)

# Summarize the data to find the top species
top_species <- df_species_effect %>%
  group_by(Species) %>%
  summarise(Total = sum(Frequency)) %>%
  top_n(10, Total) %>%
  pull(Species)

# Filter the main data frame for only top species
df_top_species_effect <- df_species_effect %>%
  filter(Species %in% top_species)

# Plot
ggplot(df_top_species_effect, aes(x = Species, y = Frequency, fill = Effect)) +
  geom_bar(stat = "identity", position = "fill") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Top Bird Species and Collision Effects",
       x = "Species",
       y = "Proportion")



## The stacked bar chart visually represents the impact of different bird species on aircraft-wildlife collisions, 
## highlighting how specific species characteristics influence collision outcomes. The distribution of effects—ranging 
##from "No Effect" to "Engine Shut Down"—varies significantly across species, suggesting that physical traits such as 
## size or flocking behavior might play a crucial role. For instance, species like gulls frequently appear in the "No Effect" 
category, indicating that collisions with these birds are less likely to cause damage. Conversely, other species that are associated with more severe outcomes like "Engine Shut Down" or "Precautionary Landing" might represent larger birds or those that tend to fly in flocks, thereby posing a greater threat to aircraft. This visualization underscores the importance of species-specific strategies in managing and mitigating risks associated with aircraft-wildlife collisions.
