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
