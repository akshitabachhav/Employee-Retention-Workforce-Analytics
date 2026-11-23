import pandas as pd

# Load employee dataset
df = pd.read_csv("data/data.csv")

# Display first five rows
print(df.head())

print("Dataset Shape:", df.shape)
print("Total Employees:", len(df))
print("Column Names:", df.columns.tolist())
print("Missing Values:\n", df.isnull().sum())
print("Duplicate Records:", df.duplicated().sum())
print("Unique Values:\n", df.nunique())
print("Constant Columns:", df.columns[df.nunique() == 1].tolist())
# Remove constant columns
df.drop(columns=["EmployeeCount", "Over18", "StandardHours"], inplace=True)

print("Updated Dataset Shape:", df.shape)
print("Attrition Distribution:")
print(df["Attrition"].value_counts())
# Calculate attrition rate
attrition_rate = (df["Attrition"].value_counts(normalize=True)["Yes"]) * 100

print("Attrition Rate:", round(attrition_rate, 2), "%")
# Attrition by department
department_attrition = df.groupby("Department")["Attrition"].value_counts()

print("Attrition by Department:")
print(department_attrition)
print("Department Names:", df["Department"].unique())
# Department-wise employee attrition
department_table = pd.crosstab(df["Department"], df["Attrition"])

print("Department-wise Attrition:")
print(department_table)
# Calculate department-wise attrition rate
department_rate = df.groupby("Department").apply(
    lambda x: (x["Attrition"] == "Yes").mean() * 100
)

print("Department-wise Attrition Rate:")
print(department_rate.round(2))
# Attrition by overtime
overtime_attrition = df.groupby("OverTime").apply(
    lambda x: (x["Attrition"] == "Yes").mean() * 100
)

print("Attrition by Overtime:")
print(overtime_attrition.round(2))
# Attrition by job role
jobrole_attrition = df.groupby("JobRole").apply(
    lambda x: (x["Attrition"] == "Yes").mean() * 100
)

print("Attrition by Job Role:")
print(jobrole_attrition.round(2))
# Create age groups
df["AgeGroup"] = pd.cut(
    df["Age"], bins=[0, 25, 35, 45, 60], labels=["Under 25", "25-35", "36-45", "46-60"]
)

# Attrition by age group
age_attrition = df.groupby("AgeGroup", observed=False).apply(
    lambda x: (x["Attrition"] == "Yes").mean() * 100
)

print("Attrition by Age Group:")
print(age_attrition.round(2))
# Create salary groups
df["SalaryBand"] = pd.cut(
    df["MonthlyIncome"],
    bins=[0, 3000, 7000, 15000, float("inf")],
    labels=["Low", "Medium", "High", "Very High"],
)

# Attrition by salary group
salary_attrition = df.groupby("SalaryBand", observed=False).apply(
    lambda x: (x["Attrition"] == "Yes").mean() * 100
)

print("Attrition by Salary Band:")
print(salary_attrition.round(2))
# Attrition by job satisfaction
satisfaction_attrition = df.groupby("JobSatisfaction").apply(
    lambda x: (x["Attrition"] == "Yes").mean() * 100
)

print("Attrition by Job Satisfaction:")
print(satisfaction_attrition.round(2))
# Attrition by work-life balance
worklife_attrition = df.groupby("WorkLifeBalance").apply(
    lambda x: (x["Attrition"] == "Yes").mean() * 100
)

print("Attrition by Work-Life Balance:")
print(worklife_attrition.round(2))
# Attrition by years at company
tenure_attrition = df.groupby("YearsAtCompany").apply(
    lambda x: (x["Attrition"] == "Yes").mean() * 100
)

print("Attrition by Years at Company:")
print(tenure_attrition.round(2))
# Create tenure groups
df["TenureGroup"] = pd.cut(
    df["YearsAtCompany"],
    bins=[-1, 2, 5, 10, float("inf")],
    labels=["0-2 Years", "3-5 Years", "6-10 Years", "10+ Years"],
)

# Attrition by tenure group
tenure_group_attrition = df.groupby("TenureGroup", observed=False).apply(
    lambda x: (x["Attrition"] == "Yes").mean() * 100
)

print("Attrition by Tenure Group:")
print(tenure_group_attrition.round(2))
# Save cleaned dataset
df.to_csv("data/cleaned_employee_data.csv", index=False)

print("Cleaned dataset saved successfully!")


# Employee Attrition Distribution Chart

import matplotlib.pyplot as plt

attrition_counts = df["Attrition"].value_counts()

plt.figure(figsize=(7, 5))
plt.bar(attrition_counts.index, attrition_counts.values)

plt.title("Employee Attrition Distribution")
plt.xlabel("Attrition")
plt.ylabel("Number of Employees")

plt.savefig("screenshots/attrition_distribution.png")
plt.show()

# Department-wise Attrition Chart

department_attrition = df[df["Attrition"] == "Yes"].groupby("Department").size()

plt.figure(figsize=(8, 5))
plt.bar(department_attrition.index, department_attrition.values)

plt.title("Employee Attrition by Department")
plt.xlabel("Department")
plt.ylabel("Number of Employees Left")
plt.xticks(rotation=15)

plt.savefig("screenshots/department_attrition.png")
plt.show()

# Attrition by Overtime Chart

overtime_attrition = df[df["Attrition"] == "Yes"].groupby("OverTime").size()

plt.figure(figsize=(7, 5))
plt.bar(overtime_attrition.index, overtime_attrition.values)

plt.title("Employee Attrition by Overtime")
plt.xlabel("Overtime")
plt.ylabel("Number of Employees Left")

plt.savefig("screenshots/overtime_attrition.png")
plt.show()

# Employee Attrition by Age Group Chart

age_attrition = df[df["Attrition"] == "Yes"].groupby("AgeGroup").size()

plt.figure(figsize=(7, 5))
plt.bar(age_attrition.index, age_attrition.values)

plt.title("Employee Attrition by Age Group")
plt.xlabel("Age Group")
plt.ylabel("Number of Employees Left")

plt.savefig("screenshots/age_group_attrition.png")
plt.show()
# Employee Attrition by Job Role Chart

jobrole_attrition = df[df["Attrition"] == "Yes"].groupby("JobRole").size()

plt.figure(figsize=(10, 6))
plt.bar(jobrole_attrition.index, jobrole_attrition.values)

plt.title("Employee Attrition by Job Role")
plt.xlabel("Job Role")
plt.ylabel("Number of Employees Left")
plt.xticks(rotation=45, ha="right")

plt.tight_layout()
plt.savefig("screenshots/jobrole_attrition.png")
plt.show()
# Employee Attrition by Salary Band Chart

salary_attrition = (
    df[df["Attrition"] == "Yes"].groupby("SalaryBand", observed=False).size()
)

plt.figure(figsize=(8, 5))
plt.bar(salary_attrition.index.astype(str), salary_attrition.values)

plt.title("Employee Attrition by Salary Band")
plt.xlabel("Salary Band")
plt.ylabel("Number of Employees Left")

plt.savefig("screenshots/salary_band_attrition.png")
plt.show()
# Employee Attrition by Tenure Group Chart

tenure_attrition = (
    df[df["Attrition"] == "Yes"].groupby("TenureGroup", observed=False).size()
)

plt.figure(figsize=(8, 5))
plt.bar(tenure_attrition.index.astype(str), tenure_attrition.values)

plt.title("Employee Attrition by Tenure Group")
plt.xlabel("Years at Company")
plt.ylabel("Number of Employees Left")

plt.savefig("screenshots/tenure_group_attrition.png")
plt.show()
# Employee Attrition by Job Satisfaction Chart

satisfaction_attrition = df[df["Attrition"] == "Yes"].groupby("JobSatisfaction").size()

plt.figure(figsize=(7, 5))
plt.bar(satisfaction_attrition.index.astype(str), satisfaction_attrition.values)

plt.title("Employee Attrition by Job Satisfaction")
plt.xlabel("Job Satisfaction Level")
plt.ylabel("Number of Employees Left")

plt.savefig("screenshots/job_satisfaction_attrition.png")
plt.show()
# Employee Attrition by Work-Life Balance Chart

worklife_attrition = df[df["Attrition"] == "Yes"].groupby("WorkLifeBalance").size()

plt.figure(figsize=(7, 5))
plt.bar(worklife_attrition.index.astype(str), worklife_attrition.values)

plt.title("Employee Attrition by Work-Life Balance")
plt.xlabel("Work-Life Balance Level")
plt.ylabel("Number of Employees Left")

plt.savefig("screenshots/worklife_balance_attrition.png")
plt.show()
# Employee Attrition by Gender Chart

gender_attrition = df[df["Attrition"] == "Yes"].groupby("Gender").size()

plt.figure(figsize=(7, 5))
plt.bar(gender_attrition.index, gender_attrition.values)

plt.title("Employee Attrition by Gender")
plt.xlabel("Gender")
plt.ylabel("Number of Employees Left")

plt.savefig("screenshots/gender_attrition.png")
plt.show()
