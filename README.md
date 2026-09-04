#  Employee Attrition Analysis – SQL & Power BI

## 📌 Project Overview

This project analyzes employee attrition using **MySQL and Power BI** to understand the factors that influence employees leaving an organization.

The project involves data cleaning, data validation, SQL-based analysis, and an interactive Power BI dashboard.

The analysis focuses on factors such as **department, job role, overtime, age, income, tenure, job satisfaction, work-life balance, and gender**.

---

## 🎯 Objectives

The main objectives of this project are:

- Calculate the overall employee attrition rate
- Identify departments with higher attrition
- Analyze attrition across different job roles
- Understand the impact of overtime on attrition
- Analyze attrition across different age groups
- Study the relationship between tenure and attrition
- Analyze the effect of income level on attrition
- Identify high-risk job role and overtime combinations
- Analyze job satisfaction and work-life balance in relation to attrition

---

## 🛠️ Tools & Technologies

- **MySQL Workbench** – Data cleaning, validation and SQL analysis
- **Power BI** – Interactive dashboard and visualization
- **SQL** – Data analysis and business queries
- **DAX** – Power BI calculations
- **Excel** – Employee dataset

---

## 🔄 Project Workflow
```text
Employee Dataset
       ↓
MySQL Workbench
       ↓
Data Cleaning & Validation
       ↓
SQL Analysis
       ↓
Power BI
       ↓
Interactive Dashboard
       ↓
Employee Attrition Insights
```
---
## 🧹 Data Cleaning & Validation

Before performing the analysis, the dataset was checked for data quality issues.
The following checks were performed:

Total number of employees
Missing values
Duplicate employee IDs
Constant columns
Categorical consistency
Logical consistency

Missing values were checked across important employee attributes


## 🔍 SQL Analysis

SQL queries were created to answer important business questions related to employee attrition.

Questions Analyzed
1. What is the overall employee attrition rate?
2. Which department has the highest attrition rate?
3. Which job role has the highest attrition rate?
4. Does working overtime affect attrition?
5. Which age group is most likely to leave?
6. Does tenure affect employee attrition?
7. Does income level affect attrition?
8. Is overtime-driven attrition concentrated in specific departments?
9. Which job role + overtime combination has the highest attrition risk?
10. Does job satisfaction and work-life balance relate to attrition?
---

## 📊 Power BI Dashboard

The SQL analysis was transformed into an interactive Employee Attrition Insights Dashboard using Power BI.
![Employee Attrition Dashboard](Dashboard.png)

Key Metrics

1. Total Employees	1,470
2. Attrition Count	237
3. Attrition Rate	16.12%
4. Average Years at Company	7.01
5. Average Monthly Income	6.50K


## 📈 Dashboard Visualizations

The dashboard includes:

1. Attrition Rate by Job Role
Identifies job roles with higher employee attrition.

2. Attrition Rate by Income
Shows how attrition varies across different income ranges.

3. Attrition Rate by Tenure
Analyzes employee attrition based on years spent at the company.

4. Attrition Rate by Overtime
Compares attrition between employees who work overtime and those who do not.

5. Attrition Rate by Department
Compares attrition across:
Sales
Human Resources
Research & Development

6. Attrition Rate by Gender
Compares employee attrition across genders.

7. Attrition Rate by Age Group
Analyzes attrition across different age groups.


## 💡 Key Insights

The analysis provides insights into employee turnover patterns by examining:

Job roles with relatively higher attrition
The relationship between overtime and employee turnover
Attrition patterns among newer and experienced employees
Differences in attrition across income levels
Department-level attrition patterns
Age groups with higher attrition rates
The relationship between job satisfaction, work-life balance and attrition

These insights can help organizations identify employee groups that may require greater attention from HR teams.


## 📂 Project Structure

```text
Employee-Attrition-Analysis-SQL-PowerBI/
│
├── 📄 SQL_operations.sql
├── 📊 Employee_Attrition_Dashboard.pbix
├── 📁 employee_dataset.csv
├── 🖼️ dashboard.png
└── 📖 README.md
```


## 🧠 Skills Demonstrated
SQL
MySQL Workbench
Data Cleaning
Data Validation
Exploratory Data Analysis
Power BI
Data Visualization
Dashboard Design
DAX
KPI Creation
Business Analytics
HR Analytics


## 🚀 Conclusion

This project demonstrates the complete process of transforming employee data into meaningful business insights.
MySQL was used for data cleaning, validation and analysis, while Power BI was used to create an interactive dashboard for visualizing employee attrition patterns.
The project helped identify how factors such as job role, overtime, income, age, tenure, department, satisfaction and work-life balance can be analyzed to better understand employee attrition.


## 👩‍💻 Author

Disha Singh


⭐ If you found this project useful, feel free to explore the SQL queries and Power BI dashboard.
