# Load necessary libraries
library(tidyverse)  # For data manipulation and visualization
library(lubridate)  # For date and time formatting
library(ggplot2)    # For data visualization

# Load datasets
daily_activity <- read_csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv")
daily_calories <- read_csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/dailyCalories_merged.csv")
daily_steps <- read_csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/dailySteps_merged.csv")
sleep_data <- read_csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv")
daily_intensities <- read_csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/dailyIntensities_merged.csv")

# Cleaning steps

# Remove duplicate rows
daily_activity <- daily_activity %>% distinct()
daily_calories <- daily_calories %>% distinct()
daily_steps <- daily_steps %>% distinct()
sleep_data <- sleep_data %>% distinct()
daily_intensities <- daily_intensities %>% distinct()

# Format date columns
daily_activity <- daily_activity %>%
  mutate(ActivityDate = mdy(ActivityDate))

daily_calories <- daily_calories %>%
  mutate(ActivityDay = mdy(ActivityDay))

daily_steps <- daily_steps %>%
  mutate(ActivityDay = mdy(ActivityDay))

sleep_data <- sleep_data %>%
  mutate(SleepDay = mdy_hms(SleepDay))

daily_intensities <- daily_intensities %>%
  mutate(ActivityDay = mdy(ActivityDay))

# Merge daily_activity and daily_calories
activity_calories <- daily_activity %>%
  inner_join(daily_calories, by = c("Id", "ActivityDate" = "ActivityDay"))

# Merge daily_activity and sleep_data
activity_sleep <- daily_activity %>%
  inner_join(sleep_data, by = c("Id", "ActivityDate" = "SleepDay"))

# Merge daily_activity, daily_calories, and daily_intensities
activity_calories_intensity <- activity_calories %>%
  inner_join(daily_intensities, by = c("Id", "ActivityDate" = "ActivityDay"))
