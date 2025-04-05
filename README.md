# 📊 Amazon Sales Analysis (SQL Capstone Project)

This project provides a comprehensive analysis of Amazon's sales data to identify patterns in sales performance, customer behavior, and product line effectiveness across multiple branches. The ultimate goal is to uncover insights that can help improve business performance and inform strategic decision-making.

---

## 🧾 Table of Contents

- [📂 Dataset Overview](#-dataset-overview)
- [📌 Project Objectives](#-project-objectives)
- [⚙️ Tools Used](#️-tools-used)
- [🔍 Analysis Breakdown](#-analysis-breakdown)
  - [🛒 Product Analysis](#-product-analysis)
  - [💰 Sales Analysis](#-sales-analysis)
  - [🧑‍🤝‍🧑 Customer Analysis](#-customer-analysis)
- [🧹 Data Wrangling & Feature Engineering](#-data-wrangling--feature-engineering)
- [📈 Key Insights](#-key-insights)
- [✅ Recommendations](#-recommendations)
- [👨‍💻 Author](#-author)

---

## 📂 Dataset Overview

- **Source:** Amazon Sales Data (sample)
- **Rows:** 1000  
- **Columns:** 17  
- **Database:** MySQL (`Amazon` database with `Amazon_Data` table)

---

## 📌 Project Objectives

- Evaluate product line performance.
- Understand sales trends by time, branch, and payment methods.
- Segment and analyze customer behavior.
- Recommend strategies to improve overall performance.

---

## ⚙️ Tools Used

- **Database:** MySQL (Workbench)
- **Language:** SQL
- **Editor:** MySQL Workbench, Command Line Interface
- **File Format:** CSV imported into SQL table

---

## 🔍 Analysis Breakdown

### 🛒 Product Analysis

- Evaluated performance of 6 product lines across 3 branches.
- Identified top-performing (Food & Beverages) and underperforming (Health & Beauty) categories.
- Assessed Value Added Tax and customer ratings per product line.

### 💰 Sales Analysis

- Tracked sales trends by month and time of day.
- Assessed revenue and customer footfall by city and branch.
- Evaluated payment method preferences.

### 🧑‍🤝‍🧑 Customer Analysis

- Segmented customers by type (Member vs. Normal) and gender.
- Identified product preferences and shopping habits.
- Analyzed store visits by gender and preferred branches.

---

## 🧹 Data Wrangling & Feature Engineering

### Data Wrangling

- Created `Amazon` database and imported the dataset into `Amazon_Data` table.
- Verified for `NULL` values using `IS NULL` check — no missing values were found.

### Feature Engineering

- **`timeofday`** column: Categorizes transactions by Morning, Afternoon, Evening.
- **`dayname`** column: Extracted weekday name from transaction date.
- **`monthname`** column: Extracted month name to study monthly trends.

---

## 📈 Key Insights

- **Food & Beverages** lead in sales and customer satisfaction.
- **Health & Beauty** underperforms across all branches.
- **Branch C (Naypyitaw)** generates the highest revenue; **Branch B (Mandalay)** the lowest.
- **E-Wallet** is the most preferred payment method.
- **Members** contribute more to revenue and VAT than **Normal** customers.
- **Female customers** dominate overall visits, especially in Branch C.
- **Afternoon** is the busiest shopping time.

---

## ✅ Recommendations

- Strengthen marketing for **Health & Beauty** product lines.
- Ensure **Food & Beverage** inventory levels meet demand.
- Improve **Home & Lifestyle** product quality to raise customer satisfaction.
- Launch exclusive promotions in **Branch B (Mandalay)**.
- Use customer feedback to guide **evening deals** and product promotions.
- Target **male customers** through focused advertising on their preferred product lines.
- Enhance engagement with **normal (non-member)** customers to increase their contribution.

---

## 👨‍💻 Author

**Sushree Deepa Jena**  
Mini Capstone Project (S7615)  
SQL & Data Analysis Enthusiast

---

## 📜 License

This project is for educational and analytical purposes only.
