# Calculate correlation between Total Steps and Calories Burned (from Calories.x)
steps_calories_correlation <- cor(activity_calories$TotalSteps, activity_calories$Calories.x, use = "complete.obs")
print(paste("Correlation between Total Steps and Calories Burned:", round(steps_calories_correlation, 2)))

# Calculate correlation between Total Steps and Sedentary Minutes
steps_sedentary_correlation <- cor(daily_activity$TotalSteps, daily_activity$SedentaryMinutes, use = "complete.obs")
print(paste("Correlation between Total Steps and Sedentary Minutes:", round(steps_sedentary_correlation, 2)))

# Calculate correlation between Total Calories and Very Active Minutes
calories_active_correlation <- cor(activity_calories_intensity$Calories.x, activity_calories_intensity$VeryActiveMinutes.x, use = "complete.obs")
print(paste("Correlation between Calories and Very Active Minutes:", round(calories_active_correlation, 2)))

# Add ActivityLevel column
activity_calories_intensity <- activity_calories_intensity %>%
  mutate(ActivityLevel = case_when(
    TotalSteps < 5000 ~ "Low",
    TotalSteps >= 5000 & TotalSteps < 10000 ~ "Moderate",
    TotalSteps >= 10000 ~ "High"
  ))

# Calculate the percentage of each ActivityLevel
activity_level_percentage <- activity_calories_intensity %>%
  group_by(ActivityLevel) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# View the results
print(activity_level_percentage)
