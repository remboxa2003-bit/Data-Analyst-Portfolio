-- ===============================================================
-- Project: HR Analytics Dashboard
-- Author: Volodymyr
-- Tools: MySQL 8.0 + Power BI
-- Database: portfolio
-- Description:
-- SQL queries used for HR Analytics Dashboard.
-- ===============================================================
CREATE DATABASE portfolio;
USE portfolio;

-- ===============================================================
-- 1.What is the total number of employees, average age, and average monthly salary? 
-- ===============================================================
SELECT
COUNT(*) AS Total_Employees,
round(AVG(Age), 2) AS Average_Age,
round(AVG(MonthlySalary), 2) AS Average_Monthly_Salary
FROM employees;

-- ===============================================================
-- 2. How many employees work in each departament?
-- ===============================================================
SELECT
Department, COUNT(*) AS Total_Employees
FROM employees
GROUP BY Department
ORDER BY Total_Employees DESC;

-- ===============================================================
-- 3. What is the average monthly salary in each department 
-- ===============================================================
SELECT
Department, round(AVG(MonthlySalary), 2) AS Average_Monthly_Salary
FROM employees
GROUP BY Department
ORDER BY Average_Monthly_Salary DESC;

-- ===============================================================
-- 4. What is the employee arttrition rate?
-- ===============================================================
SELECT Attrition, COUNT(*) AS Total_Employees,
round(COUNT(*)*100.0/(SELECT COUNT(*) FROM employees), 2) AS Attrition_Rate
FROM employees
GROUP BY Attrition;

-- ===============================================================
-- Project: HR Analytics Dashboard Views used in Power BI
-- 5. Create a department summary view for Power BI 
-- ===============================================================
CREATE OR REPLACE VIEW vw_department_summary AS
SELECT 
Department, COUNT(*) AS Total_Employees,
round(AVG(MonthlySalary), 2) AS Average_Salary,
round(AVG(Age), 2) AS Average_Age,
sum(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employees
GROUP BY Department;

-- ===============================================================
-- 6. Create a department summary view for Power BI 
-- ===============================================================
CREATE OR REPLACE VIEW vw_jobrole_summary AS

SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    ROUND(AVG(MonthlySalary), 2) AS Average_Salary,
    ROUND(AVG(JobSatisfaction), 2) AS Average_Job_Satisfaction,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employees
GROUP BY JobRole;

-- ===============================================================
-- 7. Create an overtime analysis view for Power BI
-- ===============================================================
CREATE OR REPLACE VIEW vw_overtime_analysis AS

SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    ROUND(AVG(MonthlySalary), 2) AS Average_Salary,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employees
GROUP BY OverTime;
-- ===============================================================
-- 8. Create a gender analysis view for Power BI
-- ===============================================================
CREATE OR REPLACE VIEW vw_gender_analysis AS

SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    ROUND(AVG(MonthlySalary), 2) AS Average_Salary,
    ROUND(AVG(Age), 2) AS Average_Age,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employees
GROUP BY Gender;

-- ===============================================================
-- End of File
-- ===============================================================

