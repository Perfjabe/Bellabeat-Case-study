# Box plot for Calories Burned by Activity Level
ggplot(activity_calories_intensity, aes(x = ActivityLevel, y = Calories.x, fill = ActivityLevel)) +
  geom_boxplot() +
  labs(title = "Calories Burned Across Activity Levels", x = "Activity Level", y = "Calories Burned") +
  theme_minimal()

ggplot(activity_calories, aes(x = TotalSteps, y = Calories.y)) +
  geom_point(alpha = 0.5, color = "steelblue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(
    title = "Relationship Between Total Steps and Calories Burned",
    x = "Total Steps",
    y = "Calories Burned"
  ) +
  theme_minimal()

# Plot distribution of total steps
ggplot(daily_activity, aes(x = TotalSteps)) +
  geom_histogram(binwidth = 1000, fill = "steelblue", color = "white") +
  labs(title = "Distribution of Total Steps", x = "Total Steps", y = "Frequency") +
  theme_minimal()

# Plot Total Minutes Asleep distribution
ggplot(activity_sleep, aes(x = TotalMinutesAsleep)) +
  geom_histogram(binwidth = 30, fill = "steel blue", color = "white") +
  labs(title = "Distribution of Sleep Duration", x = "Minutes Asleep", y = "Frequency") +
  theme_minimal()

# Plot Sleep vs Steps
ggplot(activity_sleep, aes(x = TotalMinutesAsleep, y = TotalSteps)) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Correlation Between Sleep Duration and Total Steps",
       x = "Total Minutes Asleep",
       y = "Total Steps") +
  theme_minimal()

# Add ActivityLevel column
activity_calories_intensity <- activity_calories_intensity %>%
  mutate(ActivityLevel = case_when(
    TotalSteps < 5000 ~ "Low",
    TotalSteps >= 5000 & TotalSteps < 10000 ~ "Moderate",
    TotalSteps >= 10000 ~ "High"
  ))

# Plot distribution of activity levels
ggplot(activity_calories_intensity, aes(x = ActivityLevel, fill = ActivityLevel)) +
  geom_bar() +
  labs(title = "User Segmentation by Activity Levels",
       x = "Activity Level",
       y = "Count") +
  scale_fill_manual(values = c("Low" = "red", "Moderate" = "yellow", "High" = "green")) +
  theme_minimal()
