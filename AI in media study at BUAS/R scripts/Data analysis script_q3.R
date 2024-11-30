# Load the necessary libraries
library(tidyverse)
library(dplyr)
library(tidyr)
library(ggplot2)
library(GGally)

# Read and view the processed data CSV file
data_3 <- read.csv("C:/Users/neilr/Documents/BUAS year 2/Block A/Data/output/processed_data_25.csv") %>%
  filter(demo_role %in% c("Student", "Educator")) %>%
  mutate(year = case_when(
    demo_role == "Student" ~ demo_year_study,
    demo_role == "Educator" ~ "Educator"
  ))

head(data3)

#Plotting------------------------------------------------------------------------------------------#
# Calculate the acceptance mean
data_3$acceptance <- rowMeans(data_3[, c("acc_1", "acc_2", "acc_3", "acc_4",
                                         "acc_5", "acc_6")], na.rm = TRUE)

ggplot(data_3, aes(x = demo_experience, y = acceptance)) +
  geom_boxplot() +
  labs(x = "Demo Experience", y = "Acceptance (Mean of acc_1 to acc_6)")

# Plotting scatter plot
ggplot(data_3, aes(x = demo_experience, y = acceptance)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") + 
  labs(x = "Demo Experience", y = "Acceptance (Mean)") +
  theme_minimal()

# Define custom labels
custom_labels <- c("Strongly Disagree", "Somewhat Disagree", "Neither Disagree nor Agree",
                   "Somewhat Agree", "Strongly Agree")

# Create a bar plot with custom y-axis labels
ggplot(data_3, aes(x = demo_experience, y = acceptance)) +
  geom_bar(stat = "summary", fun = "mean", fill = "blue") +
  labs(x = "Demo Experience", y = "Mean Acceptance") +
  scale_y_continuous(breaks = 1:5, labels = custom_labels) +
  theme_minimal()
#Trying to reorder demo_experience to ascending order----------------------------------------------#
data_3$acceptance <- rowMeans(data_3[, c("acc_1", "acc_2", "acc_3", "acc_4", "acc_5", "acc_6")],
                              na.rm = TRUE)

# Define custom labels
custom_labels <- c("Strongly Disagree", "Somewhat Disagree", "Neither Disagree nor Agree",
                   "Somewhat Agree", "Strongly Agree")

# Reorder demo_experience in ascending order
data_3$demo_experience <- factor(data_3$demo_experience, levels = c(
  "Less than 1 year", "1 - 2 years", "3 - 4 years", "5 - 10 years", "10 - 20 years", "20 + years"
))

# Create a bar plot with custom y-axis labels
ggplot(data_3, aes(x = demo_experience, y = acceptance)) +
  geom_bar(stat = "summary", fun = "mean", fill = "blue") +
  labs(x = "Demo Experience", y = "Mean Acceptance") +
  scale_y_continuous(breaks = 1:5, labels = custom_labels) +
  theme_minimal()
#--------------------------------------------------------------------------------------------------#
#(LinearRegression.ipynb)Plotting data
plot <- data_3 %>%
  mutate(
    acceptance = (acc_1 + acc_2 + acc_3 + acc_4 + acc_5 + acc_6) / 6
  ) %>%
  ggplot(aes(x = demo_experience, y = acceptance)) + 
  geom_point()

print(plot)
#--------------------------------------------------------------------------------------------------#
#Selecting relevant columns from the data to start
data_filt <- data_3 %>%
  dplyr::mutate(acceptance = acc_1 + acc_2 + acc_3 + acc_4 + acc_5 + acc_6) %>%
  dplyr::select(acceptance, demo_experience) %>%
  dplyr::rename(acc_1 = acceptance) %>%
  dplyr::select(acc_1, demo_experience)

dim(data_filt)
head(data_filt)

#Looking at the missing values in the dataframe
data_filt %>% summarise_all(~ sum(is.na(.)))

#Omitting observations to clean dataframe
data_withoutNA <- na.omit(data_filt)
data_withoutNA %>% summarise_all(~ sum(is.na(.)))

detect_outlier <- function(x) {
  Q1 <- quantile(x, probs=.25)
  Q3 <- quantile(x, probs=.75)
  # calculate inter quartile range
  IQR = Q3 - Q1
  # return true or false
  x > Q3 + (IQR*1.5) | x < Q1 - (IQR*1.5)
}

# Number of the outliers
sum(detect_outlier(data_withoutNA$acc_1))

data_cl <- subset(data_withoutNA, !detect_outlier(data_withoutNA$acc_1))
dim(gss_cl)

#Computation of correlation
ggplot(data_cl, aes(x=demo_experience, y=acc_1)) + geom_point() + 
  stat_smooth(method = "lm", se = FALSE)

# Linear Regression model
lm1 <- lm(data=data_cl, formula =  acc_1 ~  demo_experience )
summary(lm1)

#Plotting residuals
ggplot(data = lm1, aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  xlab("Fitted values") +
  ylab("Residuals")

#histogram of residuals
ggplot(data = lm1, aes(x = .resid)) +
  geom_histogram(bins=20) +
  xlab("Residuals")

#Normal probability plot of residuals
ggplot(data = lm1, aes(sample = .resid))  +
  stat_qq() + stat_qq_line(col='#016b99', lty="longdash", linewidth=1) +
  xlab("Theoretical") + ylab("Sample")

#Box-Cox transformation----------------------------------------------------------------------------#
#estimating the transformation perimeter using maximum likelihood estimation
require(MASS)
b <- boxcox(lm1)

lambda <- b$x[which.max(b$y)]
lambda

gss_cl <- data_cl %>%
  mutate(coninc_trans=(acc_1 ^ lambda - 1) / lambda)
head(gss_cl)

lm2 <- lm(gss_cl,formula = acc_1 ~  demo_experience )

ggplot(data = lm2, aes(sample = .resid))  +
  stat_qq() + stat_qq_line(col='blue', lty="longdash", size=1) +
  xlab("Theoretical") + ylab("Sample")

#plot histogram of residuals
ggplot(data = lm2, aes(x = .resid)) +
  geom_histogram(bins=20) +
  xlab("Residuals")

#Plotting residuals
ggplot(data = lm2, aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  xlab("Fitted values") +
  ylab("Residuals")

summary(lm2)