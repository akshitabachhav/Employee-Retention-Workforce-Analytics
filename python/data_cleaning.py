import pandas as pd

# Load raw employee dataset
df = pd.read_csv("data/data.csv")

print("Original Dataset Shape:", df.shape)
print("\nFirst Five Records:")
print(df.head())

# Check dataset quality
print("\nMissing Values:")
print(df.isnull().sum())

print("\nDuplicate Records:", df.duplicated().sum())

print("\nConstant Columns:")
print(df.columns[df.nunique() == 1].tolist())

# Remove unnecessary constant columns
df.drop(columns=["EmployeeCount", "Over18", "StandardHours"], inplace=True)

# Create Age Groups
df["AgeGroup"] = pd.cut(
    df["Age"], bins=[0, 25, 35, 45, 60], labels=["Under 25", "25-35", "36-45", "46-60"]
)

# Create Salary Bands
df["SalaryBand"] = pd.cut(
    df["MonthlyIncome"],
    bins=[0, 3000, 7000, 15000, float("inf")],
    labels=["Low", "Medium", "High", "Very High"],
)

# Create Tenure Groups
df["TenureGroup"] = pd.cut(
    df["YearsAtCompany"],
    bins=[-1, 2, 5, 10, float("inf")],
    labels=["0-2 Years", "3-5 Years", "6-10 Years", "10+ Years"],
)

# Save cleaned dataset
df.to_csv("data/cleaned_employee_data.csv", index=False)

print("\nFinal Dataset Shape:", df.shape)
print("Cleaned dataset saved successfully!")
