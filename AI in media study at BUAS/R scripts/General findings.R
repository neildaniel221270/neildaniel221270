# Load the necessary library
library(tidyverse)
library(dplyr)
library(statsr)
library(ggplot2)
library(tidyr)

# Read the processed data CSV file
data <- read.csv("C:/Users/neilr/Documents/BUAS year 2/Block A/Data/output/processed_data_25.csv") %>%
  filter(demo_role %in% c("Student", "Educator")) %>%
  mutate(year = case_when(
    demo_role == "Student" ~ demo_year_study,
    demo_role == "Educator" ~ "Educator"
  ))

head(data)

# Read the processed data CSV file
data_text <- read.csv("C:/Users/neilr/Documents/BUAS year 2/Block A/Data/data/df_text_2023-10-27.csv") %>%
  filter(demo_role %in% c("Student", "Educator")) %>%
  mutate(year = case_when(
    demo_role == "Student" ~ demo_year_study,
    demo_role == "Educator" ~ "Educator"
  ))

head(data_text)

count_media <- sum(data_text$demo_domain == "Media")
print(count_media)

count_consent <- sum(data_text$Q2.2 == "I consent")
print(count_consent)
#Plotting repondants by demo_role--------------------------------------------------------------------#
# Count the number of respondents for each demo_role
role_counts <- table(data$demo_role)

# Calculate percentages
role_percentages <- prop.table(role_counts) * 100

# Create a pie chart with labels and percentages
pie(role_counts, 
    labels = paste(names(role_counts), "\n", round(role_percentages, 1), "%"), 
    main = "Distribution of Respondents by demo_role")

#Plotting repondants by demo_age---------------------------------------------------------------------#
# Count the number of respondents for each demo_age
age_counts <- table(data$demo_age)

# Calculate percentages
age_percentages <- prop.table(age_counts) * 100

# Create a pie chart with labels and percentages
pie(age_counts, 
    labels = paste(names(age_counts), "\n", round(age_percentages, 1), "%"), 
    main = "Distribution of Respondents by Age")

# Create a data frame with age categories and their percentages
age_table <- data.frame(Age_Category = names(age_counts), Percentage = round(age_percentages, 1))

# Set custom column names
colnames(age_table) <- c("Age Category", "Percentage")

# Print the table
print(age_table)

#Plotting repondants by demo_study_year--------------------------------------------------------------------#
# Count the number of respondents for each year
year_counts <- table(data$demo_year_study)

# Calculate percentages
year_percentages <- prop.table(year_counts) * 100

# Replace multi-year categories with "Educator"
year_categories <- names(year_counts)
year_categories[grepl(",", year_categories)] <- "Educator"

# Create a pie chart with labels and percentages
pie(year_counts, 
    labels = paste(year_categories, "\n", round(year_percentages, 1), "%"), 
    main = "Distribution of Respondents by Year")

# Create a data frame with year categories and their percentages
year_table <- data.frame(Year_Category = year_categories, Percentage = round(year_percentages, 1))

# Set custom column names
colnames(year_table) <- c("Year Category", "Percentage")

# Print the table
print(year_table)
