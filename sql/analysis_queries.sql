-- ============================================================
-- PROJECT: Employee Retention & Workforce Analytics
-- DATABASE: retention_analytics
-- TABLE: employee_data
-- SQL DIALECT: MySQL
-- PURPOSE: Explore employee attrition, workforce trends and
          factors associated with employee turnover.

USE retention_analytics;

-- ============================================================
-- SECTION 1: OVERALL ATTRITION AND WORKFORCE PROFILE
-- ============================================================

-- QUERY 01: Overall employee attrition
SELECT
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data;

-- QUERY 02: Attrition by department
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    Department
ORDER BY attrition_rate DESC;

-- QUERY 03: Attrition by overtime
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    OverTime
ORDER BY attrition_rate DESC;

-- QUERY 04: Attrition by job role
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    JobRole
ORDER BY attrition_rate DESC;

-- QUERY 05: Attrition by salary band
SELECT
    SalaryBand,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    SalaryBand
ORDER BY attrition_rate DESC;

-- QUERY 06: Attrition by age group
SELECT
    AgeGroup,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    AgeGroup
ORDER BY attrition_rate DESC;

-- QUERY 07: Attrition by job satisfaction
SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    JobSatisfaction
ORDER BY JobSatisfaction;

-- QUERY 08: Attrition by work-life balance
SELECT
    WorkLifeBalance,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    WorkLifeBalance
ORDER BY WorkLifeBalance;

-- QUERY 09: Attrition by tenure group
SELECT
    TenureGroup,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    TenureGroup
ORDER BY
    CASE TenureGroup
        WHEN '0-2 Years' THEN 1
        WHEN '3-5 Years' THEN 2
        WHEN '6-10 Years' THEN 3
        WHEN '10+ Years' THEN 4
    END;

-- QUERY 10: Attrition by business travel
SELECT
    BusinessTravel,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    BusinessTravel
ORDER BY attrition_rate DESC;

-- ============================================================
-- SECTION 2: EMPLOYEE DEMOGRAPHICS AND JOB CHARACTERISTICS
-- ============================================================

-- QUERY 11: Attrition by gender
SELECT
    Gender,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    Gender
ORDER BY attrition_rate DESC;

-- QUERY 12: Attrition by marital status
SELECT
    MaritalStatus,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    MaritalStatus
ORDER BY attrition_rate DESC;

-- QUERY 13: Attrition by education field
SELECT
    EducationField,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    EducationField
ORDER BY attrition_rate DESC;

-- QUERY 14: Top 5 job roles by average monthly income
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income
FROM employee_data
GROUP BY
    JobRole
ORDER BY average_monthly_income DESC
LIMIT 5;

-- QUERY 15: Average salary and tenure by attrition status
SELECT
    Attrition,
    COUNT(*) AS total_employees,
    ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income,
    ROUND(AVG(YearsAtCompany), 2) AS average_years_at_company
FROM employee_data
GROUP BY
    Attrition
ORDER BY Attrition;

-- QUERY 16: Departments with attrition above the company average
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    Department
HAVING
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) * 1.0 / COUNT(*) > (
        SELECT SUM(
                CASE
                    WHEN Attrition = 'Yes' THEN 1
                    ELSE 0
                END
            ) * 1.0 / COUNT(*)
        FROM employee_data
    )
ORDER BY attrition_rate DESC;

-- QUERY 17: Top 5 job roles by attrition rate (minimum 50 employees)
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    JobRole
HAVING
    COUNT(*) >= 50
ORDER BY attrition_rate DESC
LIMIT 5;

-- QUERY 18: Average professional experience and company tenure by department
SELECT
    Department,
    COUNT(*) AS total_employees,
    ROUND(AVG(TotalWorkingYears), 2) AS average_total_working_years,
    ROUND(AVG(YearsAtCompany), 2) AS average_years_at_company
FROM employee_data
GROUP BY
    Department
ORDER BY average_total_working_years DESC;

-- QUERY 19: Attrition by total professional experience group
SELECT
    CASE
        WHEN TotalWorkingYears <= 2 THEN '0-2 Years'
        WHEN TotalWorkingYears <= 5 THEN '3-5 Years'
        WHEN TotalWorkingYears <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS experience_group,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    experience_group
ORDER BY
    CASE experience_group
        WHEN '0-2 Years' THEN 1
        WHEN '3-5 Years' THEN 2
        WHEN '6-10 Years' THEN 3
        WHEN '10+ Years' THEN 4
    END;

-- QUERY 20: Attrition by job level
SELECT
    JobLevel,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    JobLevel
ORDER BY JobLevel;

-- ============================================================
-- SECTION 3: WORKFORCE EXPERIENCE, SATISFACTION AND CAREER
-- ============================================================

-- QUERY 21: Attrition by distance from home
SELECT
    CASE
        WHEN DistanceFromHome <= 5 THEN '0-5 KM'
        WHEN DistanceFromHome <= 10 THEN '6-10 KM'
        WHEN DistanceFromHome <= 20 THEN '11-20 KM'
        ELSE '20+ KM'
    END AS distance_group,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    distance_group
ORDER BY
    CASE distance_group
        WHEN '0-5 KM' THEN 1
        WHEN '6-10 KM' THEN 2
        WHEN '11-20 KM' THEN 3
        WHEN '20+ KM' THEN 4
    END;

-- QUERY 22: Attrition by years since last promotion (grouped)
SELECT
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN '0 Years'
        WHEN YearsSinceLastPromotion <= 2 THEN '1-2 Years'
        WHEN YearsSinceLastPromotion <= 5 THEN '3-5 Years'
        ELSE '6+ Years'
    END AS promotion_gap_group,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    promotion_gap_group
ORDER BY
    CASE promotion_gap_group
        WHEN '0 Years' THEN 1
        WHEN '1-2 Years' THEN 2
        WHEN '3-5 Years' THEN 3
        WHEN '6+ Years' THEN 4
    END;

-- QUERY 23: Attrition by training times last year
SELECT
    TrainingTimesLastYear,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    TrainingTimesLastYear
ORDER BY TrainingTimesLastYear;

-- QUERY 24: Attrition by environment satisfaction
SELECT
    EnvironmentSatisfaction,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

-- QUERY 25: Attrition by relationship satisfaction
SELECT
    RelationshipSatisfaction,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    RelationshipSatisfaction
ORDER BY RelationshipSatisfaction;

-- QUERY 26: Attrition by job involvement
SELECT
    JobInvolvement,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    JobInvolvement
ORDER BY JobInvolvement;

-- QUERY 27: Attrition by performance rating
SELECT
    PerformanceRating,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    PerformanceRating
ORDER BY PerformanceRating;

-- QUERY 28: Top 10 highest-paid employees
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    JobLevel,
    MonthlyIncome,
    YearsAtCompany
FROM employee_data
ORDER BY MonthlyIncome DESC
LIMIT 10;

-- QUERY 29: Average monthly income by department and attrition status
SELECT
    Department,
    Attrition,
    COUNT(*) AS total_employees,
    ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income
FROM employee_data
GROUP BY
    Department,
    Attrition
ORDER BY Department, Attrition;

-- QUERY 30: Attrition by department and overtime
SELECT
    Department,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    Department,
    OverTime
ORDER BY Department, OverTime;

-- ============================================================
-- SECTION 4: COMBINED-FACTOR ANALYSIS
-- ============================================================

-- QUERY 31: Attrition by age group and salary band
SELECT
    AgeGroup,
    SalaryBand,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    AgeGroup,
    SalaryBand
HAVING
    COUNT(*) >= 10
ORDER BY AgeGroup, SalaryBand;

-- QUERY 32: Attrition by age group and overtime
SELECT
    AgeGroup,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    AgeGroup,
    OverTime
ORDER BY AgeGroup, OverTime;

-- QUERY 33: Attrition by job satisfaction and overtime
SELECT
    JobSatisfaction,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    JobSatisfaction,
    OverTime
ORDER BY JobSatisfaction, OverTime;

-- QUERY 34: Attrition by salary band and overtime
SELECT
    SalaryBand,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    SalaryBand,
    OverTime
ORDER BY
    CASE SalaryBand
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END,
    OverTime;

-- QUERY 35: Attrition by age group and job satisfaction
SELECT
    AgeGroup,
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    AgeGroup,
    JobSatisfaction
HAVING
    COUNT(*) >= 10
ORDER BY AgeGroup, JobSatisfaction;

-- QUERY 36: Attrition by department and salary band
SELECT
    Department,
    SalaryBand,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    Department,
    SalaryBand
ORDER BY Department, SalaryBand;

-- QUERY 37: Attrition by department and job satisfaction
SELECT
    Department,
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    Department,
    JobSatisfaction
ORDER BY Department, JobSatisfaction;

-- QUERY 38: Attrition by job role and job level
SELECT
    JobRole,
    JobLevel,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    JobRole,
    JobLevel
ORDER BY JobRole, JobLevel;

-- QUERY 39: Attrition by marital status and overtime
SELECT
    MaritalStatus,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    MaritalStatus,
    OverTime
ORDER BY MaritalStatus, OverTime;

-- QUERY 40: Attrition by work-life balance and overtime
SELECT
    WorkLifeBalance,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    WorkLifeBalance,
    OverTime
ORDER BY WorkLifeBalance, OverTime;

-- QUERY 41: Attrition by tenure group and overtime
SELECT
    TenureGroup,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    TenureGroup,
    OverTime
ORDER BY
    CASE TenureGroup
        WHEN '0-2 Years' THEN 1
        WHEN '3-5 Years' THEN 2
        WHEN '6-10 Years' THEN 3
        WHEN '10+ Years' THEN 4
    END,
    OverTime;

-- QUERY 42: Attrition by job role and overtime
SELECT
    JobRole,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    JobRole,
    OverTime
ORDER BY JobRole, OverTime;

-- QUERY 43: Attrition by salary band and overtime
SELECT
    SalaryBand,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    SalaryBand,
    OverTime
ORDER BY
    CASE SalaryBand
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END,
    OverTime;

-- QUERY 44: Attrition by age group, salary band and overtime
SELECT
    AgeGroup,
    SalaryBand,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    AgeGroup,
    SalaryBand,
    OverTime
HAVING
    COUNT(*) >= 10
ORDER BY AgeGroup, SalaryBand, OverTime;

-- QUERY 45: Attrition by salary band and job satisfaction
SELECT
    SalaryBand,
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    SalaryBand,
    JobSatisfaction
ORDER BY
    CASE SalaryBand
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END,
    JobSatisfaction;

-- ============================================================
-- SECTION 5: BENEFITS, CAREER HISTORY AND FINAL KPIs
-- ============================================================

-- QUERY 46: Attrition by stock option level
SELECT
    StockOptionLevel,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    StockOptionLevel
ORDER BY StockOptionLevel;

-- QUERY 47: Attrition by number of companies previously worked
SELECT
    NumCompaniesWorked,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    NumCompaniesWorked
ORDER BY NumCompaniesWorked;

-- QUERY 48: Attrition by exact years since last promotion
SELECT
    YearsSinceLastPromotion,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;

-- QUERY 49: Attrition by department and job level
SELECT
    Department,
    JobLevel,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_data
GROUP BY
    Department,
    JobLevel
ORDER BY Department, JobLevel;

-- QUERY 50: Final overall workforce and retention summary
SELECT
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    SUM(
        CASE
            WHEN Attrition = 'No' THEN 1
            ELSE 0
        END
    ) AS active_employees,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'No' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS retention_rate,
    ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income,
    ROUND(AVG(YearsAtCompany), 2) AS average_company_tenure
FROM employee_data;

-- ============================================================
-- END OF SQL ANALYSIS SCRIPT
-- ============================================================
