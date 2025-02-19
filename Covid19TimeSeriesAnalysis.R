---
title: "Time Series Analysis of COVID-19 Trends"
author: "Your Name"
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# 1. Installing the missing packages

```{r}
packages <- c("tidyverse", "lubridate", "forecast", "prophet", "usethis")
```

# 2. Installing the missing packages

```{r}
install.packages(setdiff(packages, rownames(installed.packages())), dependencies = TRUE)
```

# 3. Loading the packages

```{r}
lapply(packages, library, character.only = TRUE)
```

# 4. Loading the Dataset from the Local Storage

```{r}
covid_data <- read_csv("C:/Users/DELL/Downloads/Covid-Data.csv")
```

# 5. Printing first few rows of the dataset

```{r}
head(covid_data)
```

# 6. Checking the structure of the Data

```{r}
glimpse(covid_data)
```

# 7. Filtering Data for Kenya

```{r}
kenya_data <- covid_data %>%
  filter(location == "Kenya") %>%
  select(date, new_cases) %>%
  mutate(date = as_date(date)) %>%
  filter(!is.na(new_cases))
```

# 8. Displaying the first few rows of Kenyan Data

```{r}
head(kenya_data)
```

# 9. Exploratory Data Analysis

## 9.1 Plot daily new cases

```{r}
ggplot(kenya_data, aes(x = date, y = new_cases)) +
  geom_line(color = "blue") +
  labs(title = "Daily New COVID-19 Cases in Kenya",
       x = "Date",
       y = "New Cases") +
  theme_minimal()
```

# 10. Time Series Decomposition

## 10.1 Converting to Time Series Object

```{r}
ts_data <- ts(kenya_data$new_cases, start = c(year(min(kenya_data$date)), yday(min(kenya_data$date))), frequency = 365)
```

## 10.2 Decomposing the Time Series

```{r}
decomposed <- stl(ts_data, s.window = "periodic")
```

## 10.3 Plotting Decomposed components

```{r}
plot(decomposed)
```

# 11. ARIMA MODEL

## 11.1 Fit ARIMA Model

```{r}
fit_arima <- auto.arima(ts_data)
```

## 11.2 Forecasting the next 30 days

```{r}
forecast_arima <- forecast(fit_arima, h = 30)
```

## 11.3 Plotting the Forecast

```{r}
autoplot(forecast_arima) +
  labs(title = "ARIMA Forecast of Daily New COVID-19 Cases",
       x = "Date",
       y = "New Cases") +
  theme_minimal()
```

# 12. PROPHET MODEL

## 12.1 Preparing Data for Prophet Model

```{r}
prophet_data <- kenya_data %>%
  rename(ds = date, y = new_cases)
```

## 12.2 Initializing and Fitting the Model with Daily, Weekly, and Yearly Seasonality

```{r}
model_prophet <- prophet(prophet_data, daily.seasonality = TRUE, weekly.seasonality = TRUE, yearly.seasonality = TRUE)
```

## 12.3 Creating a data frame for future Dates

```{r}
future_dates <- make_future_dataframe(model_prophet, periods = 30)
```

## 12.4 Forecasting

```{r}
forecast_prophet <- predict(model_prophet, future_dates)
```

## 12.5 Plotting the Forecast

```{r}
plot(model_prophet, forecast_prophet) +
  labs(title = "Prophet Forecast of Daily New COVID-19 Cases",
       x = "Date",
       y = "New Cases") +
  theme_minimal()
```
