# 🚲 NYC Bike Ridership Analysis

## 📌 Overview
In this case study, we'll work for a fictional cyclist company to bring up a strategy to increase their ridership subscribers.
This project analyzes **bike ridership data** in New York City using **SQL (BigQuery) & Python (Seaborn, Matplotlib, Pandas)**.  
We explore trends by **user type, gender, age group, time of day, and seasonality** to derive actionable insights.

## 📊 Dataset Details
- **Source**: [NYC Citi Bike data](https://divvy-tripdata.s3.amazonaws.com/index.html)
- **Time Period**: 2019
- **Features**:
  - `start_time`, `end_time`
  - `user_type` (Subscriber/Casual)
  - `gender`, `birthyear`
  - `ride_length`, `day_of_week`, `hour_of_day`

## 🎯 Objectives
- Identify **peak riding hours** and **weekly trends**.
- Compare **ride duration by gender, age, and user type**.
- Analyze **monthly ridership trends**.
- Understand **which user groups ride the most**.

## 📂 Project Structure
├── README.md
├── SQL_queries/
│   ├── merge_and_clean.sql
│   ├── monthly_trends.sql
│   ├── weekly_trends.sql
│   ├── hourly_trends.sql
│   ├── gender_analysis.sql
│   └── age_group_analysis.sql
├── python_visualizations/
│   ├── notebook.ipynb
│   └── requirements.txt
└── data/

## 🛠️ Methods & Queries
- **SQL (BigQuery) Queries:**
  - Monthly, Weekly, and Hourly ridership trends.
  - Ride length statistics by gender, age, user type.
  - Most popular riding times.
- **Python Analysis (Seaborn & Matplotlib):**
  - Line charts for monthly trends.
  - Bar plots for gender & age comparisons.
  - Heatmaps for hourly and weekly patterns.

## 📊 Key Visualizations
![Monthly Trends](images/monthly_trends.png)  
**Figure 1:** Monthly bike usage trends for different user types.

![Hourly Heatmap](images/hourly_heatmap.png)  
**Figure 2:** Heatmap showing peak hours for ridership.

## 🔧 How to Use This Repo
1. Clone the repository:
   ```sh
   git clone [https://github.com/yourusername/NYC-Bike-Ridership-Analysis.git](https://github.com/Pushyashree/Bike_Ridership.git)
2. Run the SQL queries in BigQuery:
    Open .sql files
    Execute the queries in Google BigQuery Console
    Export the results as CSV files (if needed for Python analysis)
3. Install dependencies: pip install -r requirements.txt
4. Place the exported CSV files in the data/ folder or copy query relevant "Job ID's" to python console in BigQuery
5. Open bike_ridership.ipynb and run the analysis

## 📌 Results & Insights
Subscribers ride more consistently throughout the year, while casual riders peak in summer.
Weekends have higher ride durations, especially for casual riders.
Morning & evening peak hours indicate commuter usage.
Millennials & Gen Z ride the most, while older groups take longer rides on average.

## ✍️ Author
👤 Pushya Shree Konasale Jayaramu
📧 pushyashree.kj.2000@gmail.com
🔗 https://www.linkedin.com/in/pushya-shree-konasale-jayaramu-6a61881a8/
