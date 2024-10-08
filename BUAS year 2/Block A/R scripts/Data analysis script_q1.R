# Load the necessary library
library(tidyverse)
library(dplyr)
library(statsr)
library(ggplot2)
library(tidyr)

# Read the processed data CSV file
data_1 <- read.csv("C:/Users/neilr/Documents/BUAS year 2/Block A/Data/output/processed_data_25.csv") %>%
  filter(demo_role %in% c("Student", "Educator")) %>%
  mutate(year = case_when(
    demo_role == "Student" ~ demo_year_study,
    demo_role == "Educator" ~ "Educator"
  ))

# View the first few rows
head(data)
#-------------------------------------------------------------------------------------------------#
#Plotting data
filtered_data <- data_1[data_1$demo_role == "Student",]

mean_values <- colMeans(filtered_data[, c("media_domain_2", "media_domain_4", "media_domain_5",
                                          "media_domain_6", "media_domain_7", "media_domain_8",
                                          "media_domain_9")], na.rm = TRUE)

mean_df <- data.frame(media_domain = names(mean_values), mean_value = mean_values)
  
# Calculate percentages
total_responses <- nrow(filtered_data)
mean_df$percentage <- (mean_df$mean_value / 5) * 100

# Plotting
ggplot(mean_df, aes(x = media_domain, y = mean_value, fill = media_domain)) +
  geom_bar(stat = "identity", width = 0.5) +
  geom_text(aes(label = paste(round(percentage, 1), "%")), vjust = -0.5, size = 3, color = "black") + 
  labs(title = "Mean Values and Percentages of Media Domains for Students",
       x = "Media Domain",
       y = "Mean Value") +
  scale_fill_manual(values = c(
    "media_domain_2" = "skyblue",
    "media_domain_4" = "palegreen",
    "media_domain_5" = "salmon",
    "media_domain_6" = "lightblue",
    "media_domain_7" = "lightgreen",
    "media_domain_8" = "tomato",
    "media_domain_9" = "lightcoral"
  ), labels = c(
    "I would like to use AI",
    "There are many AI application possibilities in your domain",
    "AI has an impact on my profession",
    "AI will create new jobs in my field",
    "Intorduction to AI will improve my profession",
    "AI will boost the domain",
    "AI will be used more widely"
  )) +
  scale_y_continuous(breaks = seq(1, 5, by = 1), labels = c(
    "Strongly Disagree", 
    "Somewhat Disagree", 
    "Neither Disagree nor Agree", 
    "Somewhat Agree", 
    "Strongly Agree"
  )) +
  theme_minimal()
