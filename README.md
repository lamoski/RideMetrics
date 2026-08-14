# RideMetrics
Optimizing Ride-Hailing Performance Across Uber &amp; Bolt
# RideMetrics — Ride-Hailing Performance Analytics

![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![Python](https://img.shields.io/badge/Python-3.13-blue)
![MSSQL](https://img.shields.io/badge/MSSQL-Medallion%20Architecture-red)
![Status](https://img.shields.io/badge/Status-Complete-green)

## 📌 Project Overview

RideMetrics is a personal end-to-end data analytics portfolio project built on over 16 months of real-world ride-hailing trip data collected while driving for **Uber** and **Bolt** in **Łódź, Poland**.

Motivated by the need to maximise earnings while balancing academic commitments, this project transforms raw trip data into actionable business insights using a full analytics pipeline — from raw data ingestion to an interactive Power BI dashboard and machine learning models.

> *"Can historical patterns predict when it is worth going online as a ride-hailing driver?"*

---

## 🎯 Objectives

- Identify the most profitable hours, days and seasons for driving
- Analyse trip demand patterns across both Uber and Bolt platforms
- Build machine learning models to predict High/Medium/Low demand and earning periods
- Develop an interactive Power BI dashboard to visualise all findings

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

## 🏗️ Architecture

This project follows the **Medallion Architecture** implemented in Microsoft SQL Server:

| Layer | Purpose | Tables |
|---|---|---|
| 🥉 Bronze | Raw CSV data loaded as-is | `Bronze.Uber_Trips`, `Bronze.Uber_Payments`, `Bronze.Bolt_Trips`, `Bronze.Bolt_Payments` |
| 🥈 Silver | Cleaned, standardized and merged data | `Silver.Uber`, `Silver.Bolt`, `Silver.Combined_Silver` |
| 🥇 Gold | Aggregated business-ready tables | 11 tables feeding Power BI and ML models |

---

## 🤖 Machine Learning Models

### Model 1: Demand Prediction
- **Algorithm:** XGBoost
- **Target:** Demand category (High / Medium / Low)
- **Features:** Hour, day of week, month, season, platform, distance, duration
- **Accuracy:** 96.4% — F1 Score: 96.1% — CV Mean F1: 94.9%

### Model 2: Earnings Prediction
- **Algorithm:** Random Forest
- **Target:** Earnings category (High / Medium / Low)
- **Features:** Hour, day of week, month, season, avg distance, avg duration, total trips, demand score
- **Accuracy:** 76.7% — F1 Score: 76.4% — CV Mean F1: 77.8%

### Combined Shift Recommendation

| Demand | Earnings | Recommendation |
|---|---|---|
| High | High | 🟢 Definitely Work |
| High | Low | 🟡 Work for Volume |
| Low | High | 🟡 Work for Quality |
| Low | Low | 🔴 Stay Home |

---

## 📁 Repository Structure
---

## 🔑 Key Findings

| Finding | Result |
|---|---|
| Most profitable hour | Hour 16 (4PM) — 22.4 PLN avg |
| Most profitable day | Friday — 21.5 PLN avg |
| Most profitable month | October — 10,011 PLN |
| Busiest hour | Hour 16 — 517 trips |
| Busiest day | Saturday — 1,146 trips |
| Busiest season | Autumn — 1,600 trips |
| Avg Uber deduction | 28.90% |
| Avg earnings per km | 3.10 PLN/km |
| Total revenue (16 months) | 79,310 PLN |
| Total net earnings | 57,140 PLN |

---

## 🛠️ Tools & Technologies

| Category | Tools |
|---|---|
| Programming | Python 3.13, pandas, matplotlib, seaborn |
| Machine Learning | scikit-learn, XGBoost |
| Database | Microsoft SQL Server (MSSQL) |
| Business Intelligence | Power BI |
| Data Exploration | Excel, SQL |
| Development | Jupyter Notebook, VS Code |
| Version Control | GitHub |
| Documentation | Notion |

---

## ⚠️ Data Limitations

- No location data — geographic analysis not possible
- Bolt payment data excluded from all financial analysis due to data quality issues
- Data reflects a single driver's experience in Łódź, Poland
- External factors such as weather and traffic not captured
- 48 cancelled trips excluded from ML training data

---

## 🚀 How to Run

1. Clone the repository
```bash
git clone https://github.com/lamoski/RideMetrics.git
```

2. Install dependencies
```bash
pip install pandas numpy matplotlib seaborn scikit-learn xgboost pyodbc sqlalchemy
```

3. Connect to MSSQL and run notebooks in order:
