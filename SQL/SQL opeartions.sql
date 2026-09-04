use hr;

-- Checking data
SELECT 
    COUNT(*)
FROM
    employee;  
SELECT * FROM employee LIMIT 10;

-- Changing col_name
ALTER TABLE employee
RENAME COLUMN ï»¿Age TO Age;

-- checking for missing values
SELECT 
    COUNT(*) - COUNT(Age) AS missing_age,
    COUNT(*) - COUNT(Attrition) AS missing_attrition,
    COUNT(*) - COUNT(BusinessTravel) AS missing_travel,
    COUNT(*) - COUNT(DailyRate) AS missing_dailyrate,
    COUNT(*) - COUNT(Department) AS missing_dept,
    COUNT(*) - COUNT(DistanceFromHome) AS missing_distance,
    COUNT(*) - COUNT(Education) AS missing_education,
    COUNT(*) - COUNT(EducationField) AS missing_edufield,
    COUNT(*) - COUNT(EmployeeNumber) AS missing_empnum,
    COUNT(*) - COUNT(EnvironmentSatisfaction) AS missing_envsat,
    COUNT(*) - COUNT(Gender) AS missing_gender,
    COUNT(*) - COUNT(HourlyRate) AS missing_hourlyrate,
    COUNT(*) - COUNT(JobInvolvement) AS missing_jobinv,
    COUNT(*) - COUNT(JobLevel) AS missing_joblevel,
    COUNT(*) - COUNT(JobRole) AS missing_jobrole,
    COUNT(*) - COUNT(JobSatisfaction) AS missing_jobsat,
    COUNT(*) - COUNT(MaritalStatus) AS missing_marital,
    COUNT(*) - COUNT(MonthlyIncome) AS missing_income,
    COUNT(*) - COUNT(MonthlyRate) AS missing_monthlyrate,
    COUNT(*) - COUNT(NumCompaniesWorked) AS missing_numcompanies,
    COUNT(*) - COUNT(OverTime) AS missing_overtime,
    COUNT(*) - COUNT(PercentSalaryHike) AS missing_hike,
    COUNT(*) - COUNT(PerformanceRating) AS missing_perfrating,
    COUNT(*) - COUNT(RelationshipSatisfaction) AS missing_relsat,
    COUNT(*) - COUNT(StockOptionLevel) AS missing_stockopt,
    COUNT(*) - COUNT(TotalWorkingYears) AS missing_totalyears,
    COUNT(*) - COUNT(TrainingTimesLastYear) AS missing_training,
    COUNT(*) - COUNT(WorkLifeBalance) AS missing_wlb,
    COUNT(*) - COUNT(YearsAtCompany) AS missing_tenure,
    COUNT(*) - COUNT(YearsInCurrentRole) AS missing_yearsrole,
    COUNT(*) - COUNT(YearsSinceLastPromotion) AS missing_yearspromo,
    COUNT(*) - COUNT(YearsWithCurrManager) AS missing_yearsmgr
FROM
    employee;

-- checking duplicates
SELECT COUNT(*) AS total_rows, COUNT(DISTINCT EmployeeNumber) AS unique_ids
FROM employee;

-- constant column check
SELECT DISTINCT
    EmployeeCount
FROM
    employee;
SELECT DISTINCT
    Over18
FROM
    employee;
SELECT DISTINCT
    StandardHours
FROM
    employee;

-- Categorical consistency check

SELECT DISTINCT Attrition FROM employee;
SELECT DISTINCT OverTime FROM employee;
SELECT DISTINCT Department FROM employee;
SELECT DISTINCT BusinessTravel FROM employee;
SELECT DISTINCT Gender FROM employee;
SELECT DISTINCT MaritalStatus FROM employee;
SELECT DISTINCT EducationField FROM employee;
SELECT DISTINCT JobRole FROM employee;

-- Logical consistency check
SELECT COUNT(*) FROM employee WHERE YearsAtCompany > Age;
SELECT COUNT(*) FROM employee WHERE YearsInCurrentRole > YearsAtCompany;

-- 1. What is the overall employee attrition rate?    Attrition:the percentage of employees or customers who leave a business over a specific time period
                                                       -- (Number of Departures ÷ Average Headcount) × 100   so  (237/1470)*100
SELECT 
    COUNT(CASE
        WHEN Attrition = 'Yes' THEN 1
    END) AS Attrition_Count,
    COUNT(*) AS Total_Employees,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100 / COUNT(*),
            2) AS Attribute_Rate
FROM
    employee;


-- 2. Which department has the highest attrition rate?
 
 SELECT 
    Department,
    COUNT(CASE
        WHEN Attrition = 'Yes' THEN 1
    END) AS Attrition_count,
    COUNT(*) AS total_Employee,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100 / COUNT(*),
            2) AS Attrition_rate
FROM
    employee
GROUP BY Department
ORDER BY Attrition_rate DESC;


-- 3. Which job role has the highest attrition rate?

SELECT 
    JobRole,
    COUNT(CASE
        WHEN Attrition = 'Yes' THEN 1
    END) AS Attrition_count,
    COUNT(*) AS Total_employee,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100 / COUNT(*),
            2) AS Attrition_rate
FROM
    employee
GROUP BY JobRole
ORDER BY Attrition_rate DESC;


-- 4. Does working overtime affect attrition, and by how much?
SELECT 
    OverTime,
    COUNT(*) AS total_employees,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employee
GROUP BY OverTime
ORDER BY attrition_rate DESC;


-- 5. Which age group is most likely to leave?
SELECT 
    CASE
        WHEN Age < 25 THEN '<25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_group,
    COUNT(*) AS total_emp,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100 / COUNT(*),
            2) AS Attrition_rate
FROM
    employee
GROUP BY Age_group
ORDER BY Age_group;


-- 6. Does tenure (years at company) affect attrition are newer employees more likely to leave than long-tenured ones?

SELECT 
    CASE
        WHEN YearsAtCompany < 2 THEN '0-2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 5 THEN '2-5 years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 years'
        WHEN YearsAtCompany BETWEEN 11 AND 15 THEN '11-15 years'
        ELSE '15+ years'
    END AS Tenure_range,
    COUNT(*) AS total_employee,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100 / COUNT(*),
            2) AS Attribute_Rate
FROM
    employee
GROUP BY Tenure_range
ORDER BY Tenure_range DESC;


-- 7. Does income level affect attrition — do lower-paid employees leave more?

SELECT 
    CASE
        WHEN MonthlyIncome < 3000 THEN '0-3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 5999 THEN '3000-5999'
        WHEN MonthlyIncome BETWEEN 6000 AND 9999 THEN '6000-9999'
        ELSE '10000+'
    END AS salary_range,
    COUNT(*) AS total_employee,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100 / COUNT(*),
            2) AS Attrition_Rate
FROM
    employee
GROUP BY salary_range
ORDER BY salary_range DESC;    


-- 8. Is overtime-driven attrition concentrated in specific departments or is it a company-wide pattern?

SELECT 
    Department,
    Overtime,
    COUNT(*) AS total_employee,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100 / COUNT(*),
            2) AS Attrition_Rate
FROM
    employee
GROUP BY Department , Overtime
ORDER BY Attrition_Rate DESC;


-- 9. Which specific role + overtime combination has the highest attrition risk? (i.e., what's the single riskiest employee segment?)

SELECT 
    JobRole,
    Overtime,
    COUNT(*) AS total_employee,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100 / COUNT(*),
            2) AS Attrition_Rate
FROM
    employee
GROUP BY JobRole , Overtime
HAVING COUNT(*) >= 10
ORDER BY Attrition_Rate DESC
LIMIT 10;


-- 10. Does employee satisfaction (job satisfaction and work-life balance) correlate with attrition independent of pay and overtime?

SELECT 
    JobSatisfaction,
    COUNT(*) AS total_employees,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employee
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


SELECT 
    WorkLifeBalance,
    COUNT(*) AS total_employees,
    ROUND(COUNT(CASE
                WHEN Attrition = 'Yes' THEN 1
            END) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employee
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

