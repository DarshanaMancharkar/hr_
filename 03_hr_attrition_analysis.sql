/*******************************************************************************
HR EMPLOYEE ATTRITION ANALYSIS
Author: [Darshana Mangesh Mancharkar]
Tools Used: SQL (MySQL)
Description: A 20-query deep dive into key drivers of employee turnover.
*******************************************************************************/

-- =============================================================================
-- 1. DATASET OVERVIEW
-- =============================================================================
-- 1.1: Total number of employees
SELECT 
    COUNT(*) AS number_of_employees
FROM
    employees;

-- 1.2: Overall attrition rate
SELECT 
    ROUND(SUM((CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END)) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employees;
    
-- 1.3: Employee distribution by department
SELECT 
    Department, COUNT(*) AS number_of_employees
FROM
    employees
GROUP BY Department;

-- 1.4: Employee distribution by job role
SELECT 
    JobRole, COUNT(*) AS number_of_employees
FROM
    employees
GROUP BY JobRole;


-- =============================================================================
-- 2. Department Analysis
-- =============================================================================
-- 2.1: Attrition rate by department
SELECT 
    Department,
    ROUND(SUM(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employees
GROUP BY Department;

-- 2.2: Average monthly income by department
SELECT 
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM
    employees
GROUP BY Department;

-- 2.3: Average years at company by department
SELECT 
    Department,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years_at_company
FROM
    employees
GROUP BY Department;

-- 2.4: Department with the highest attrition rate
SELECT 
    Department,
    ROUND(SUM(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employees
GROUP BY Department
ORDER BY attrition_rate DESC
LIMIT 1;


-- =============================================================================
-- 3. JobRole Analysis
-- =============================================================================
-- 3.1: Attrition rate by job role
SELECT 
    JobRole,
    ROUND(SUM((CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END)) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employees
GROUP BY JobRole;

-- 3.2: Average monthly income by job role
SELECT 
    JobRole, ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM
    employees
GROUP BY JobRole;

-- 3.3: Highest paying job role
SELECT 
    JobRole, ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM
    employees
GROUP BY JobRole
ORDER BY avg_monthly_income DESC
LIMIT 1;

-- 3.4: Job role with the highest attrition rate
SELECT 
    JobRole,
    ROUND(SUM((CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END)) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employees
GROUP BY JobRole
ORDER BY attrition_rate DESC
LIMIT 1;


-- =============================================================================
-- 4. Overtime Analysis
-- =============================================================================
-- 4.1: Calculate the attrition rate for employees who work overtime and those who do not.
SELECT 
    Overtime,
    ROUND(SUM((CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END)) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employees
GROUP BY OverTime;

-- 4.2: Find the average monthly income by overtime status.
SELECT 
    Overtime,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM
    employees
GROUP BY Overtime;

-- 4.3: Find the average work-life balance by overtime status.
SELECT 
    Overtime,
    ROUND(AVG(WorkLifeBalance), 2) AS avg_work_life_balance
FROM
    employees
GROUP BY Overtime;


-- =============================================================================
-- 5. Age Analysis
-- =============================================================================
-- 5.1: Employee distribution by age group.
SELECT 
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS number_of_employees
FROM
    employees
GROUP BY age_group
ORDER BY MIN(Age);


-- 5.2: Attrition rate by age group.
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY age_group
ORDER BY MIN(Age);

-- 5.3: Average monthly income by age group.
SELECT 
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM
    employees
GROUP BY age_group
ORDER BY MIN(Age);


-- =============================================================================
-- 6. Business_Travel_Analysis
-- =============================================================================
-- 6.1: Attrition rate by business travel.
SELECT 
    BusinessTravel,
    ROUND(SUM((CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END)) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employees
GROUP BY BusinessTravel;

-- 6.2: Average monthly income by business travel.
SELECT 
    BusinessTravel,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM
    employees
GROUP BY BusinessTravel;

-- 6.3: Average years at company by business travel
SELECT
    BusinessTravel,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years_at_company
FROM employees
GROUP BY BusinessTravel;


-- =============================================================================
-- 7. Advanced Queries
-- =============================================================================
-- 7.1: Employees earning above the company average salary
SELECT 
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM employees
WHERE MonthlyIncome > (SELECT AVG(MonthlyIncome) FROM employees)
ORDER BY MonthlyIncome DESC;

-- 7.2: Average profile comparison — employees who left vs stayed
SELECT 
    Attrition,
    ROUND(AVG(Age), 1) AS avg_age,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    ROUND(AVG(YearsAtCompany), 1) AS avg_tenure,
    ROUND(AVG(JobSatisfaction), 2) AS avg_satisfaction,
    ROUND(AVG(WorkLifeBalance), 2) AS avg_work_life_balance
FROM employees
GROUP BY Attrition;

