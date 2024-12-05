# Flight Delays Analysis

## Project Description

### Problem Statement

Airport arrival performance and other events are affected by weather, which may result in delays or capacity constraints. Almost half of all airport traffic delays are caused by adverse weather conditions. These uncertainties during airport operations can result in significant delays and inconvenience to passengers. Therefore, the airport authority wants to analyze the flights that are delayed and the effect of weather on the delays.

### Objective

To visualize the data using histograms, scatter plots, box plots, and pie charts to understand the effect of weather conditions and other factors on flight delays.

### Dataset

- **File:** `flightdelays.xlsx`

### Data Description

| Variable   | Description                                                                                 |
|------------|---------------------------------------------------------------------------------------------|
| `schedtime` | Scheduled time of departure                                                                |
| `Carrier`   | Airline codes                                                                              |
| `deptime`   | Actual time of departure                                                                   |
| `dest`      | Destination of flight                                                                      |
| `distance`  | Travel distance                                                                            |
| `date`      | Date of travel                                                                             |
| `flightnum` | Flight number                                                                              |
| `origin`    | Airport codes                                                                              |
| `weather`   | Weather condition coded as:<br>0 – On time<br>1 – Delayed                                  |
| `dayweek`   | Day of the week coded as:<br>1 – Sunday and Monday<br>0 – All other days                   |
| `daymonth`  | Day of the month                                                                           |
| `tailnu`    | Tail number of the flight                                                                  |
| `delay`     | Delay status                                                                               |

---

## Steps Performed

1. **Read the Dataset**
   - Loaded the `flightdelays.xlsx` file into R.

2. **Understand the Data**
   - Explored the dataset structure using `str()` and viewed the first few rows with `head()`.

3. **Check for Null Values**
   - Used `is.na()` and `sum()` functions to identify and quantify any missing values.

4. **Install Required Packages**
   - Installed necessary packages:

     ```R
     install.packages("ggplot2")
     install.packages("dplyr")
     install.packages("tidyr")
     ```

5. **Descriptive Statistics**
   - Generated summary statistics using `summary()` to understand data distribution.

6. **Plot Histograms**
   - Created histograms for variables like `schedtime`, `Carrier`, `dest`, `origin`, `weather`, and `dayweek` to visualize their distributions.

7. **Plot Scatter Plots**
   - Plotted scatter plots to analyze the relationship between scheduled departure times and actual departure times for on-time and delayed flights.

8. **Plot Box Plots**
   - Used box plots to observe the distribution of delays across different days of the month.

9. **Define Hours of Departure**
   - Categorized `deptime` into time slots (e.g., Morning, Afternoon, Evening, Night) for better analysis.

10. **Categorical Data Representation**
    - Created contingency tables using `table()` to represent categorical variables.

11. **Redefine Delay Variables**
    - Recoded the `delay` variable for clarity, converting numerical codes to descriptive labels.

12. **Summary of Major Variables**
    - Summarized key variables like `Carrier`, `origin`, and `dest` to identify patterns and trends.

13. **Plot Histograms of Major Variables**
    - Visualized distributions of major variables to detect any anomalies or significant observations.

14. **Plot Pie Chart**
    - Created a pie chart to represent the proportion of delayed vs. on-time flights.

---

## Results and Findings

- **Weather Impact on Delays**
  - A significant number of delays occurred during adverse weather conditions, confirming the impact of weather on flight schedules.

- **Carrier Performance**
  - Some airlines had consistently higher delay rates, suggesting possible operational inefficiencies.

- **Time of Departure**
  - Flights departing during certain time slots experienced more delays, indicating peak traffic periods.

- **Day of the Week**
  - Delays were more frequent on Sundays and Mondays, potentially due to increased travel demand at the start of the week.

## Conclusion

The analysis reveals that weather conditions significantly affect flight delays. Understanding these patterns can help the airport authority implement strategies to minimize delays, optimize scheduling, and improve passenger satisfaction.

---
