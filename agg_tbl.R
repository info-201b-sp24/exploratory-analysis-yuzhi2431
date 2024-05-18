# Load the necessary libraries
library(openintro)
library(dplyr)

# Load the birds dataset
data("birds")

# Perform the group_by operation
birds %>%
  select(species, birds_struck) %>%
  group_by(species) %>% 
  summarise(total_birds_struck = n()) %>%
  arrange(desc(total_birds_struck)) %>%
  slice_head(n=10)

