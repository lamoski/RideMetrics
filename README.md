# 🚗 RideMetrics — Ride-Hailing Performance Analytics

![Python](https://img.shields.io/badge/Python-3.13-blue)
![MSSQL](https://img.shields.io/badge/MSSQL-Medallion%20Architecture-red)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![Machine Learning](https://img.shields.io/badge/ML-XGBoost%20%7C%20Random%20Forest-green)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

## 📌 Project Overview

RideMetrics is a personal end-to-end data analytics portfolio project built on over **16 months of real-world ride-hailing trip data** collected while driving for **Uber** and **Bolt** in **Łódź, Poland** (September 2024 — February 2026).

Motivated by the need to maximise earnings while balancing academic commitments, this project transforms raw personal trip data into actionable business insights using a complete analytics pipeline — from raw data ingestion through data engineering, exploratory data analysis, machine learning and an interactive Power BI dashboard.

> *"Can historical patterns predict when it is worth going online as a ride-hailing driver?"*

---

## 🎯 Business Objectives

- Identify the most profitable hours, days, months and seasons for driving
- Analyse trip demand patterns across both Uber and Bolt platforms
- Quantify Uber's platform deduction rate and its impact on net earnings
- Build machine learning models to predict High/Medium/Low demand and earning periods
- Develop an interactive Power BI dashboard to visualise all findings and support shift decisions

---

## 📊 Dashboard Preview

### Page 1: Revenue Overview
![Revenue Overview](screenshots/page1_revenue_overview.png)

### Page 2: Demand Patterns
![Demand Patterns](screenshots/page2_demand_patterns.png)

### Page 3: ML Insights
![ML Insights](screenshots/page3_ml_insights.png)

### Page 4: Trip Analysis
![Trip Analysis](screenshots/page4_trip_analysis.png)

---

## 🏗️ Data Architecture — Medallion Architecture

This project implements the **Medallion Architecture** in Microsoft SQL Server:

| Layer | Purpose | Tables |
|---|---|---|
| 🥉 **Bronze** | Raw CSV data loaded as-is from Uber and Bolt | `Bronze.Uber_Trips` `Bronze.Uber_Payments` `Bronze.Bolt_Trips` `Bronze.Bolt_Payments` |
| 🥈 **Silver** | Cleaned, standardized and merged trip data with engineered features | `Silver.Uber` `Silver.Bolt` `Silver.Combined_Silver` `Silver.Uber_Payments_Silver_pivoted` |
| 🥇 **Gold** | Aggregated business-ready tables feeding Power BI and ML models | `Gold.Daily_Revenue` `Gold.Hourly_Revenue` `Gold.Weekly_Revenue` `Gold.Monthly_Revenue` `Gold.Yearly_Monthly_Revenue` `Gold.Day_of_Week_Revenue` `Gold.Hourly_Demand` `Gold.Daily_Demand` `Gold.Seasonal_Demand` `Gold.ML_Demand` `Gold.ML_Earnings` |

---

## 📁 Repository Structure

<pre>
RideMetrics/
├── notebooks/
│   ├── 01_bronze_ingestion.ipynb
│   ├── 02_silver_cleaning.ipynb
│   ├── 03_gold_aggregation.ipynb
│   ├── 04_eda.ipynb
│   └── 05_machine_learning.ipynb
├── screenshots/
│   ├── page1_revenue_overview.png
│   ├── page2_demand_patterns.png
│   ├── page3_ml_insights.png
│   └── page4_trip_analysis.png
├── RideMetrics.pbix
├── .gitignore
└── README.md
</pre>

---

## 🔑 Key Findings

| Business Question | Finding |
|---|---|
| Most profitable hour | Hour 16 (4PM) — 22.4 PLN avg per trip |
| Most profitable day | Friday — 21.5 PLN avg per trip |
| Most profitable month | October — 10,011 PLN net earnings |
| Busiest hour | Hour 16 — 517 trips (Uber + Bolt) |
| Busiest day | Saturday — 1,146 trips |
| Busiest season | Autumn — 1,600 trips (48% above mean) |
| Avg Uber deduction | 28.90% (approximately normal distribution) |
| Avg earnings per km | 3.10 PLN/km |
| Total gross revenue | 79,310 PLN (16 months) |
| Total net earnings | 57,140 PLN (16 months) |
| Peak week earnings | 2,574 PLN (October 2024) |

---

## 🤖 Machine Learning Models

### Model 1: Demand Prediction

| Item | Detail |
|---|---|
| Algorithm | XGBoost |
| Dataset | Combined Silver (Uber + Bolt) — 4,287 records |
| Target | Demand category — High / Medium / Low |
| Features | Hour, day of week, month, season, platform, distance, duration |
| Accuracy | **96.4%** |
| F1 Score | **96.1%** |
| CV Mean F1 | **94.9%** (Std 3.6%) |

### Model 2: Earnings Prediction

| Item | Detail |
|---|---|
| Algorithm | Random Forest |
| Dataset | Uber Silver (hourly aggregated) — 1,561 records |
| Target | Earnings category — High / Medium / Low |
| Features | Hour, day of week, month, season, avg distance, avg duration, total trips, demand score |
| Accuracy | **76.7%** |
| F1 Score | **76.4%** |
| CV Mean F1 | **77.8%** (Std 1.3%) |

### Combined Shift Recommendation Engine

| Demand | Earnings | Recommendation |
|---|---|---|
| 🟢 High | 🟢 High | **Definitely Work** — peak period |
| 🟡 High | 🔴 Low | **Work for Volume** — busy but lower fares |
| 🟡 Low | 🟢 High | **Work for Quality** — fewer but higher value trips |
| 🔴 Low | 🔴 Low | **Stay Home** — not worth going online |

---

## 📈 EDA Business Questions Answered

| # | Business Question | Key Finding |
|---|---|---|
| 1 | Which hour generates highest earnings? | Hour 16 (4PM) — 22.4 PLN avg |
| 2 | Which day is most profitable? | Friday — 21.5 PLN avg |
| 3 | What are weekly and monthly earnings? | Peak week 2,574 PLN (Oct 2024) |
| 4 | What is average Uber deduction rate? | 28.90% — approximately normal |
| 5 | What is average earnings per km? | 3.10 PLN/km — right skewed |
| 6 | Which month is most profitable? | October — 10,011 PLN |
| 7 | How has revenue trended over 16 months? | Peak Oct-Nov 2024 then gradual decline |
| 8 | Which hours have highest trip demand? | Hours 15-17 — afternoon peak |
| 9 | Which day has highest trip volume? | Saturday — 1,146 trips |
| 10 | Which season has highest demand? | Autumn — 1,600 trips |
| 11 | Can patterns predict demand? | Yes — XGBoost 96.4% accuracy |
| 12 | Can patterns predict earnings? | Yes — Random Forest 76.7% accuracy |
| 13 | Platform comparison | Uber consistently higher volume than Bolt |

---

## ⚠️ Data Limitations

- No location data — geographic and route-level analysis not possible (GDPR compliance)
- Bolt payment data excluded from all financial analysis due to three independent data quality issues — discounted payments, inconsistent recording times and incorrect ride dates
- Data reflects a single driver's experience in Łódź, Poland and may not generalise to all drivers
- External factors such as weather, traffic and local events not captured in the dataset
- 48 cancelled trips with zero distance and duration excluded from ML training data — cancellation fees retained in revenue reporting tables
- 12 special event days identified as statistical outliers and flagged with binary event indicator in ML earnings features

---

## 🛠️ Tools & Technologies

| Category | Tools |
|---|---|
| Programming | Python 3.13 |
| Data Manipulation | pandas, numpy |
| Visualisation | matplotlib, seaborn |
| Machine Learning | scikit-learn, XGBoost |
| Database | Microsoft SQL Server (MSSQL) |
| Business Intelligence | Power BI (DAX, data modelling) |
| Data Exploration | Excel, SQL |
| Development | Jupyter Notebook, VS Code |
| Version Control | GitHub |
| Documentation | Notion |

---

## 🚀 How to Run

### Prerequisites
- Python 3.13+
- Microsoft SQL Server
- Power BI Desktop

### Installation

```bash
git clone https://github.com/lamoski/RideMetrics.git
pip install pandas numpy matplotlib seaborn scikit-learn xgboost pyodbc sqlalchemy
```

### Run Notebooks in Order

```
01_bronze_ingestion.ipynb   → Load raw CSV data into Bronze layer
02_silver_cleaning.ipynb    → Clean and merge data into Silver layer
03_gold_aggregation.ipynb   → Aggregate data into Gold layer
04_eda.ipynb                → Exploratory data analysis
05_machine_learning.ipynb   → Train and evaluate ML models
```

### Open Dashboard

1. Open `RideMetrics.pbix` in Power BI Desktop
2. Update MSSQL connection to your server
3. Refresh data

---

## 📋 Data Sources

| Platform | Data Type | Records | Period |
|---|---|---|---|
| Uber | Trip Details | 3,130 (Silver) | Sep 2024 — Jan 2026 |
| Uber | Payment Details | 3,130 (Silver) | Sep 2024 — Jan 2026 |
| Bolt | Trip Details | 1,586 (Silver) | Sep 2024 — Feb 2026 |
| Bolt | Payment Details | Excluded | — |

> Raw data not included in repository — personally collected through active driving in Łódź, Poland.

---

## 👤 Author

**Olamide Adebayo**
Data Analytics Student — Łódź, Poland
GitHub: [@lamoski](https://github.com/lamoski)

---

## 📄 Full Documentation

Complete project documentation including data description, methodology, EDA mapping and decision log available on Notion.

---

*RideMetrics — Transforming personal driving data into actionable business insights*
