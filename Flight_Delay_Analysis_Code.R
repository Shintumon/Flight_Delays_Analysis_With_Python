# Step: Install and load the `readxl` package
# install.packages("readxl")
library(readxl)

# Step: Determine the current working directory
# current_dir <- getwd()
# print(paste("Current working directory:", current_dir))

# Step: change the working directory
# setwd("path/to/your/directory")

# Step 1: Load the dataset
flights <- read_excel("flightdelays.xlsx")

# Step 2: Attach descriptions using attributes
attributes(flights)$variable.description <- list(
  schedtime = "Scheduled time",
  Carrier = "Airline codes",
  deptime = "Time of departure",
  dest = "Destination of flight",
  distance = "Traveling distance",
  date = "Date of travel",
  flightnum = "Flight number",
  origin = "Airport codes",
  weather = "0 – on time, 1 - delayed",
  dayweek = "1 - Sunday and Monday, 0 - for all other days",
  daymonth = "Number of days in month",
  tailnu = "Tail number of flight",
  delay = "Delay status"
)

# Function to print the variable descriptions
print_variable_descriptions <- function(df) {
  cat("Variable Descriptions:\n")
  for (var in names(attributes(df)$variable.description)) {
    cat(var, ":", attributes(df)$variable.description[[var]], "\n")
  }
}

# Print the variable descriptions
print_variable_descriptions(flights)

# Step 3. Understand the data
str(flights)
summary(flights)

# Step 4. Find out the null values
colSums(is.na(flights))

# Step 5. Install the required packages
install.packages(c("ggplot2", "dplyr"))
library(ggplot2)
library(dplyr)

# Step 6. Understand the summary of descriptive statistics
summary(flights)

# Step 7. Plot the histograms
# Histogram for scheduled time
ggplot(flights, aes(x = schedtime)) + 
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Histogram of Scheduled Time", x = "Scheduled Time", y = "Frequency")

# Histogram for carrier
ggplot(flights, aes(x = carrier)) + 
  geom_bar(fill = "green", color = "black") +
  labs(title = "Histogram of Carrier", x = "Carrier", y = "Frequency")

# Histogram for destination
ggplot(flights, aes(x = dest)) + 
  geom_bar(fill = "purple", color = "black") +
  labs(title = "Histogram of Destination", x = "Destination", y = "Frequency")

# Histogram for origin
ggplot(flights, aes(x = origin)) + 
  geom_bar(fill = "orange", color = "black") +
  labs(title = "Histogram of Origin", x = "Origin", y = "Frequency")

# Histogram for weather
ggplot(flights, aes(x = factor(weather))) + 
  geom_bar(fill = "red", color = "black") +
  labs(title = "Histogram of Weather", x = "Weather", y = "Frequency")

# Histogram for day of the week
ggplot(flights, aes(x = factor(dayweek))) + 
  geom_bar(fill = "cyan", color = "black") +
  labs(title = "Histogram of Day of the Week", x = "Day of the Week", y = "Frequency")

# Step 8. Plot the scatter plot for flights on time and delayed
ggplot(flights, aes(x = schedtime, y = deptime, color = factor(weather))) +
  geom_point() +
  labs(title = "Scatter Plot of Flights (On time vs Delayed)", x = "Scheduled Time", y = "Departure Time")

# Step 9. Plot the box plot to understand how many days in a month flights are delayed by what time
ggplot(flights, aes(x = factor(daymonth), y = deptime, fill = factor(weather))) +
  geom_boxplot() +
  labs(title = "Box Plot of Departure Time by Day of the Month", x = "Day of the Month", y = "Departure Time")

# Step 10. Define the hours of departure
flights$hour_of_departure <- as.integer(flights$deptime / 100)

# Step 11. Create a categorical representation of data using a table
table(flights$weather, flights$dayweek)

# Step 12. Redefine the delay variables
flights$delay_status <- ifelse(flights$delay == 1, "Delayed", "Ontime")

# Step 13. Understand the summary of major variables
summary(flights[c("schedtime", "deptime", "distance", "hour_of_departure", "weather")])

# Step 14. Plot histograms of major variables
# Histogram for departure time
ggplot(flights, aes(x = deptime)) + 
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Histogram of Departure Time", x = "Departure Time", y = "Frequency")

# Histogram for distance
ggplot(flights, aes(x = distance)) + 
  geom_histogram(binwidth = 50, fill = "blue", color = "black") +
  labs(title = "Histogram of Distance", x = "Distance", y = "Frequency")

# Histogram for hour of departure
ggplot(flights, aes(x = hour_of_departure)) + 
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Histogram of Hour of Departure", x = "Hour of Departure", y = "Frequency")

# Step 15. Plot a pie chart to see how many flights were delayed
# Count the number of delayed flights
delayed_flights <- table(flights$delay)

# Pie chart of delayed flights
pie(delayed_flights, 
    labels = paste(names(delayed_flights), "(", delayed_flights, " flights)", sep = " "),
    main = "Pie Chart of Flight Delays")
