# Employee Retention & Workforce Analytics System

An end-to-end data analytics project focused on understanding employee attrition, identifying workforce trends, and generating actionable HR insights using **Python, SQL, MySQL, and Power BI**.

## Project Overview

Employee attrition can affect organizational performance, productivity, and workforce stability. This project analyzes employee data to identify patterns associated with employee turnover and retention.

The solution combines Python-based data cleaning, SQL analysis, exploratory data analysis, and an interactive Power BI dashboard to support data-driven HR decisions.

## Objectives

- Analyze employee attrition and retention patterns.
- Identify workforce trends across departments, job roles, age groups, and salary bands.
- Understand the relationship between overtime, job satisfaction, and employee attrition.
- Develop an interactive dashboard to present key HR metrics and insights.

## Tools & Technologies

| Technology | Purpose |
|---|---|
| Python | Data cleaning and exploratory analysis |
| Pandas | Data manipulation and preprocessing |
| SQL / MySQL | Database management and workforce analysis |
| Power BI | Interactive dashboard and visualizations |
| DAX | KPI calculations and measures |
| Power Query | Data transformation |

## Project Workflow

1. **Data Loading:** Imported and inspected the employee dataset.
2. **Data Cleaning:** Processed employee data using Python and Pandas.
3. **Exploratory Data Analysis:** Analyzed workforce patterns and created visualizations.
4. **SQL Analysis:** Queried employee data to identify attrition trends.
5. **Dashboard Development:** Created an interactive Power BI dashboard.
6. **Insights:** Interpreted workforce trends to highlight potential attrition factors.

## Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Employees | 1,470 |
| Active Employees | 1,233 |
| Employees Left | 237 |
| Attrition Rate | 16.12% |
| Retention Rate | 83.88% |

## Key Business Insights

- Employees working overtime show a higher attrition rate.
- The Sales department has comparatively higher attrition than other departments.
- Employees in younger age groups show comparatively higher attrition.
- Lower salary bands experience higher attrition.

## Power BI Dashboard

The interactive dashboard includes KPI cards, slicers, and visualizations covering:

- Attrition by Overtime
- Attrition by Tenure Group
- Attrition by Job Satisfaction
- Attrition by Gender
- Attrition by Work-Life Balance
- Attrition by Job Role
- Attrition by Age Group
- Employees Left by Department
- Attrition by Salary Band

## Project Structure

```text
Employee-Retention-Workforce-Analytics/
│
├── data/
│   ├── data.csv
│   └── cleaned_employee_data.csv
│
├── powerbi/
│   └── Employee_Retention_Dashboard.pbix
│
├── python/
│   ├── analysis.py
│   ├── data_cleaning.py
│   └── exploratory_analysis.py
│
├── screenshots/
│   ├── Dashboard and analysis screenshots
│
├── sql/
│   └── analysis_queries.sql
│
├── .gitignore
├── README.md
└── requirements.txt
```

## How to Run the Project

1. Clone this repository:

   ```bash
   git clone https://github.com/akshitabachhav/Employee-Retention-Workforce-Analytics.git
   ```

2. Navigate to the project folder:

   ```bash
   cd Employee-Retention-Workforce-Analytics
   ```

3. Install the required Python libraries:

   ```bash
   pip install -r requirements.txt
   ```

4. Run the Python scripts from the project folder.

5. Open the SQL file in MySQL Workbench to explore the analysis queries.

6. Open the Power BI file to explore the interactive dashboard.

## Skills Demonstrated

Python | Pandas | SQL | MySQL | Power BI | Excel | Data Cleaning | Exploratory Data Analysis | Data Visualization | DAX | Power Query

## Conclusion

This project demonstrates practical data analytics skills through employee data preprocessing, exploratory analysis, SQL querying, KPI development, and interactive dashboard creation. It highlights how data analytics can help organizations understand workforce trends and employee attrition patterns.
