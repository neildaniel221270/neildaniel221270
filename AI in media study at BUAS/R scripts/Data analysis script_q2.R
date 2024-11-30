# Load the necessary library
library(tidyverse)
library(dplyr)
library(statsr)
library(ggplot2)
library(tidyr)

# Read and view the processed data CSV file
data_2 <- read.csv("C:/Users/neilr/Documents/BUAS year 2/Block A/Data/output/processed_data_25.csv") %>%
  filter(demo_role %in% c("Student", "Educator")) %>%
  mutate(year = case_when(
    demo_role == "Student" ~ demo_year_study,
    demo_role == "Educator" ~ "Educator"
  ))
head(data_2)

#Plotting------------------------------------------------------------------------------------------#
# Calculate the mean values for students
mean_values_students <- data_2 %>%
  filter(demo_role == "Student") %>%
  summarise(
    mean_knowledge_3 = mean(media_knowledge_3, na.rm = TRUE),
    mean_knowledge_4 = mean(media_knowledge_4, na.rm = TRUE),
    mean_knowledge_5 = mean(media_knowledge_5, na.rm = TRUE)
  )

# Calculate the mean values for educators
mean_values_educators <- data_2 %>%
  filter(demo_role == "Educator") %>%
  summarise(
    mean_knowledge_3 = mean(media_knowledge_3, na.rm = TRUE),
    mean_knowledge_4 = mean(media_knowledge_4, na.rm = TRUE),
    mean_knowledge_5 = mean(media_knowledge_5, na.rm = TRUE)
  )

# Combine the mean values
mean_values_combined <- rbind(
  mutate(mean_values_students, demo_role = "Student"),
  mutate(mean_values_educators, demo_role = "Educator")
)

# Reshape the data for plotting
mean_df <- mean_values_combined %>%
  pivot_longer(cols = starts_with("mean_"), 
               names_to = "knowledge_level", 
               values_to = "mean_value") %>%
  mutate(knowledge_level = factor(knowledge_level, levels = c("mean_knowledge_3",
                                                              "mean_knowledge_4",
                                                              "mean_knowledge_5")))

# Custom labels for x and y axes
x_labels <- c(
  "mean_knowledge_3" = "In comparison to my colleagues in my domain, I have more knowledge on
  the topic.",
  "mean_knowledge_4" = "I am aware of a wide variety of AI applications.",
  "mean_knowledge_5" = "I have a good knowledge of AI"
)

# Calculate percentages
total_responses <- nrow(data_2)

mean_df <- mean_df %>%
  group_by(knowledge_level, demo_role) %>%
  mutate(percentage = (mean_value / 5) * 100)

# Create the grouped bar chart with percentages
bar_chart_mean <- ggplot(mean_df, aes(x = knowledge_level, y = mean_value, fill = demo_role)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.6) +
  geom_text(aes(label = paste(round(percentage), "%")), position = position_dodge(width = 0.8),
            vjust = -0.5, size = 3, color = "black") + # Add percentages
  labs(title = "Mean Media Knowledge",
       x = "Media Knowledge Level",
       y = "Mean Value",
       fill = "Demo Role") +
  scale_fill_manual(values = c("blue", "green")) +
  scale_x_discrete(labels = x_labels) +
  scale_y_continuous(breaks = seq(1, 5, by = 1), labels = c(
    "1" = "Strongly Disagree",
    "2" = "Somewhat Disagree",
    "3" = "Neither Disagree nor Agree",
    "4" = "Somewhat Agree",
    "5" = "Strongly Agree"
  )) +
  theme_minimal()

# Display the grouped bar chart with percentages
print(bar_chart_mean)
#Inferential----------------------------------------------------------------------------------------#
plot <- data_2 %>%
  mutate(
    awareness = (media_knowledge_3 + media_knowledge_4 + media_knowledge_5) / 3
  ) %>%
  ggplot(aes(x = demo_role, y = awareness)) +
  geom_boxplot() + ylab("Role") + 
  ggtitle("Awareness per role")

print(plot)

#average media_knowledge, number of saples
data_2 %>% group_by(demo_role) %>% 
  summarize(Average.media_knowledge = round(mean(media_knowledge_3, na.rm=TRUE)), no.Samples=n())

#Confidence interval--------------------------------------------------------------------------------#
#confidence interval for average interval for students
awar_stud <- data_2 %>% filter(demo_role =="Student")

statsr::inference(y=media_knowledge_3, data=data2, type="ci", statistic="mean", 
          conf_level=0.95, method="theoretical")

#confidence interval for average interval for educators
awar_stud <- data_2 %>% filter(demo_role =="Educator")

statsr::inference(y=media_knowledge_3, data= data2, type= "ci", statistic= "mean", 
          conf_level=0.95, method="theoretical")


#Confidence interval for the difference between the average awareness for Students and Educators
df_withoutNA <- data_2 %>% drop_na(media_knowledge_3)

statsr::inference(data=df_withoutNA, y=media_knowledge_3, x=demo_role, type="ci", statistic="mean", 
          method="theoretical", sig_level=0.95)
#So we are 95% certain that educators are between -,05572 and 2.7023 more aware about AI

#Hypothesis testing---------------------------------------------------------------------------------#
data_2 %>% drop_na(media_knowledge_3) %>% group_by(demo_role) %>%
  summarize(Mean=mean(media_knowledge_3), SE=sd(media_knowledge_3), No.Samples=n()) 

data2_withoutNA <- data_2 %>%
  drop_na(media_knowledge_3)

statsr::inference(data=data2_withoutNA, y=media_knowledge_3, x=demo_role, type="ht",
                  statistic="mean",
                  method="theoretical", alternative="greater", sig_level=0.95)