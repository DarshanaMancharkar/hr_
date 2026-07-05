USE hr_attrition;

CREATE TABLE employees(
    Age	INT,
    Attrition VARCHAR(10),
	BusinessTravel VARCHAR(50),	
    DailyRate INT,
	Department VARCHAR(50),	
    DistanceFromHome INT,
	Education INT,
    EducationField VARCHAR(50),
	EmployeeCount INT,
	EmployeeNumber INT PRIMARY KEY,
	EnvironmentSatisfaction INT,	
    Gender VARCHAR(10),
	HourlyRate INT,
	JobInvolvement INT,
	JobLevel INT,
	JobRole VARCHAR(50),
	JobSatisfaction INT,
	MaritalStatus VARCHAR(50),
	MonthlyIncome INT,
	MonthlyRate	INT,
    NumCompaniesWorked INT,
	Over18	VARCHAR(10), 
    OverTime VARCHAR(10),
	PercentSalaryHike INT,
	PerformanceRating INT,
	RelationshipSatisfaction INT,
	StandardHours INT,
	StockOptionLevel INT,
	TotalWorkingYears INT,
	TrainingTimesLastYear INT,
	WorkLifeBalance INT,
	YearsAtCompany INT,
	YearsInCurrentRole INT,
	YearsSinceLastPromotion INT,
	YearsWithCurrManager INT
);

SELECT COUNT(*) AS total_employees 
FROM employees;

SELECT * 
FROM employees
LIMIT 10 ;

SHOW COLUMNS 
FROM employees;

DESCRIBE employees;