
library(tidyverse)
library(openintro)

data(birds)
summary_info <- list()

summary_info$collision_mean_height <- birds %>% filter(!is.na(height)) %>% summarize(mean_height = mean(height)) %>% pull()

summary_info$median_bird_seen <- birds %>% filter(!is.na(birds_seen)) %>% mutate(bd_seen = as.numeric(str_extract(birds_seen, "\\d+"))) %>%
  summarize(median =  median(bd_seen)) %>% pull()

summary_info$max_bird_seen <- birds %>% filter(!is.na(birds_seen)) %>% mutate(bd_seen = as.numeric(str_extract(birds_seen, "\\d+"))) %>%
  summarize(max =  max(bd_seen)) %>% pull()

summary_info$median_bird_struck <- birds %>% filter(!is.na(birds_struck)) %>% mutate(bd_struck = as.numeric(str_extract(birds_struck, "\\d+"))) %>%
  summarize(median =  median(bd_struck)) %>% pull()

summary_info$max_bird_struck <- birds %>% filter(!is.na(birds_struck)) %>% mutate(bd_struck = as.numeric(str_extract(birds_struck, "\\d+"))) %>%
  summarize(max =  max(bd_struck)) %>% pull()

