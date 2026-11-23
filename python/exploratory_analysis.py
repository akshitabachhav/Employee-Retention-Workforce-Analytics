import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

# Set project paths
BASE_DIR = Path(__file__).resolve().parent.parent
DATA_PATH = BASE_DIR / "data" / "cleaned_employee_data.csv"
OUTPUT_DIR = BASE_DIR / "screenshots"

# Create screenshots folder if it does not exist
OUTPUT_DIR.mkdir(exist_ok=True)

# Load cleaned dataset
df = pd.read_csv(DATA_PATH)

print("Dataset Shape:", df.shape)
print("Total Employees:", len(df))

# Overall employee attrition
attrition_counts = df["Attrition"].value_counts()

attrition_rate = (df["Attrition"] == "Yes").mean() * 100

print("\nOverall Attrition Distribution:")
print(attrition_counts)

print("\nOverall Attrition Rate:", round(attrition_rate, 2), "%")

# Department-wise attrition rate
department_rate = df.groupby("Department")["Attrition"].apply(
    lambda x: (x == "Yes").mean() * 100
)

print("\nDepartment-wise Attrition Rate:")
print(department_rate.round(2))

# Overtime-wise attrition rate
overtime_rate = df.groupby("OverTime")["Attrition"].apply(
    lambda x: (x == "Yes").mean() * 100
)

print("\nOvertime-wise Attrition Rate:")
print(overtime_rate.round(2))


# Function to create and save charts
def create_chart(data, title, xlabel, ylabel, filename, rotation=0):

    plt.figure(figsize=(9, 5))

    plt.bar(data.index.astype(str), data.values)

    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)

    plt.xticks(rotation=rotation, ha="right")

    plt.tight_layout()

    plt.savefig(OUTPUT_DIR / filename)
    plt.show()
    plt.close()


# Filter employees who left
left_employees = df[df["Attrition"] == "Yes"]


# 1. Overall Employee Attrition Distribution
create_chart(
    attrition_counts,
    "Employee Attrition Distribution",
    "Attrition",
    "Number of Employees",
    "attrition_distribution.png",
)


# 2. Department-wise Attrition
department_data = left_employees.groupby("Department").size()

create_chart(
    department_data,
    "Employee Attrition by Department",
    "Department",
    "Employees Left",
    "department_attrition.png",
)


# 3. Attrition by Overtime
overtime_data = left_employees.groupby("OverTime").size()

create_chart(
    overtime_data,
    "Employee Attrition by Overtime",
    "Overtime",
    "Employees Left",
    "overtime_attrition.png",
)


# 4. Attrition by Age Group
age_data = left_employees.groupby("AgeGroup", observed=False).size()

create_chart(
    age_data,
    "Employee Attrition by Age Group",
    "Age Group",
    "Employees Left",
    "age_group_attrition.png",
)


# 5. Attrition by Job Role
jobrole_data = left_employees.groupby("JobRole").size()

create_chart(
    jobrole_data,
    "Employee Attrition by Job Role",
    "Job Role",
    "Employees Left",
    "jobrole_attrition.png",
    rotation=45,
)


# 6. Attrition by Salary Band
salary_data = left_employees.groupby("SalaryBand", observed=False).size()

create_chart(
    salary_data,
    "Employee Attrition by Salary Band",
    "Salary Band",
    "Employees Left",
    "salary_band_attrition.png",
)


# 7. Attrition by Tenure Group
tenure_data = left_employees.groupby("TenureGroup", observed=False).size()

create_chart(
    tenure_data,
    "Employee Attrition by Tenure Group",
    "Tenure Group",
    "Employees Left",
    "tenure_group_attrition.png",
)


# 8. Attrition by Job Satisfaction
satisfaction_data = left_employees.groupby("JobSatisfaction").size()

create_chart(
    satisfaction_data,
    "Employee Attrition by Job Satisfaction",
    "Job Satisfaction Level",
    "Employees Left",
    "job_satisfaction_attrition.png",
)


# 9. Attrition by Work-Life Balance
worklife_data = left_employees.groupby("WorkLifeBalance").size()

create_chart(
    worklife_data,
    "Employee Attrition by Work-Life Balance",
    "Work-Life Balance",
    "Employees Left",
    "worklife_balance_attrition.png",
)


# 10. Attrition by Gender
gender_data = left_employees.groupby("Gender").size()

create_chart(
    gender_data,
    "Employee Attrition by Gender",
    "Gender",
    "Employees Left",
    "gender_attrition.png",
)


print("\nEDA completed successfully!")
print("All 10 charts saved in the screenshots folder.")
