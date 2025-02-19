# **COVID-19 Time Series Analysis - Kenya**  

## **Project Overview**  
This project analyzes the trends of **COVID-19 cases in Kenya** using **Time Series Forecasting** techniques such as:  
- **ARIMA (AutoRegressive Integrated Moving Average)**  
- **Prophet (developed by Facebook)**  

The goal is to **forecast future daily new cases** and gain insights into the disease trends.  

---

## **Dataset**  
- **Source:** The dataset used in this analysis is downloaded from a local file:  
  👌 `C:/Users/DELL/Downloads/Covid-Data.csv`  
- **Variables Used:**  
  - `date`: Date of recorded cases  
  - `new_cases`: Daily new COVID-19 cases  

---

## **Methodology**  

### **1️⃣ Data Preprocessing**  
- Read the dataset using **`read_csv()`**  
- Filter records for **Kenya**  
- Handle **missing values**  
- Convert the date column to `Date` format  

### **2️⃣ Exploratory Data Analysis (EDA)**  
- **Visualizing daily new cases** using `ggplot2`  

### **3️⃣ Time Series Decomposition**  
- Convert `new_cases` into a **time series object (`ts`)**  
- Decompose the time series to analyze **trend, seasonality, and residuals**  

### **4️⃣ ARIMA Model**  
- Fit an **ARIMA model** to predict the next **30 days**  
- Use `auto.arima()` to automatically select the best model  
- Plot the forecast results  

### **5️⃣ Prophet Model**  
- Prepare the dataset for Prophet (`ds = date, y = new_cases`)  
- Fit the Prophet model with **daily, weekly, and yearly seasonality**  
- Predict the next **30 days**  
- Visualize the forecast  

---

## **Installation & Setup**  

### **Required Packages**  
Run the following command in **RStudio** to install necessary packages:  
```r
install.packages(c("tidyverse", "lubridate", "forecast", "prophet"))
```

### **Running the Script**  
- Ensure that the dataset is located at **`C:/Users/DELL/Downloads/Covid-Data.csv`**  
- Open `RStudio` and run the script **line by line**  

---

## **Results & Insights**  
- The **ARIMA model** captures underlying trends and autocorrelations  
- The **Prophet model** includes **seasonality** (daily, weekly, yearly) to improve forecasts  
- Visualization shows **fluctuations and trends** in daily COVID-19 cases in Kenya  

---

## **Repository Structure**  
```
📂 Covid_19_Time_Series_Analysis-Kenya_Data
│── 🐝 README.md       # Project documentation
│── 🐝 covid_analysis.R # R script for analysis
│── 📈 Covid-Data.csv  # Dataset (Not included in GitHub)
```

---

## **Contributing**  
Feel free to fork this repository and contribute by:  
- Improving the **forecasting models**  
- Adding more **visualizations**  
- Expanding to **other countries**  

---

## **License**  
🐝 **MIT License** - You are free to use, modify, and distribute this code.  
"""

# Write README file
writeLines(readme_content, "README.md")
