CREATE TABLE EmployeeDemographics
(EmployeeID int, 
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int)

CREATE TABLE WareHouseEmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasly', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male'),
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

INSERT INTO EmployeeSalary VALUES
(NULL, 'Salesman', 43000),
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

INSERT INTO WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

DELETE TOP (20) 
FROM EmployeeDemographics;

DELETE TOP (50)
FROM EmployeeSalary;

DELETE TOP (50)
FROM WareHouseEmployeeDemographics;

SELECT *
FROM EmployeeSalary

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')

SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender

SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY CountGender DESC

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Right Outer Join SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC

SELECT JobTitle, AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP By JobTitle

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT *
FROM SQLTutorial.dbo.EmployeeSalary
ORDER BY EmployeeID

SELECT EmployeeID, FirstName, Age
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeSalary
ORDER BY EmployeeID

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
FULL Outer Join SQLTutorial.dbo.WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT JobTitle, COUNT(JobTitle)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1
	
SELECT JobTitle, AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics


UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'

DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1005

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID =1004

SELECT FirstName + ' ' + LastName AS FullName
FROM [SQLTutorial].[dbo].[EmployeeDemographics]

SELECT AVG(Age) AS AvgAge
FROM [SQLTutorial].dbo.[EmployeeDemographics]

SELECT Demo.EmployeeID, Sal.Salary
FROM [SQLTutorial].[dbo].[EmployeeDemographics] AS Demo
JOIN [SQLTutorial].[dbo].[EmployeeSalary] AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

SELECT Demo.EmployeeID, Demo.FirstName, Sal.JobTitle, Ware.Age
FROM[SQLTutorial].[dbo].EmployeeDemographics AS Demo
LEFT JOIN [SQLTutorial].[dbo].EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [SQLTutorial].[dbo].WareHouseEmployeeDemographics AS Ware
	ON Demo.EmployeeID = Ware.EmployeeID

SELECT *
FROM SQLTutorial..EmployeeDemographics

SELECT *
FROM SQLTutorial.EmployeeSalary

SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID

SELECT Gender, COUNT(Gender)
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender

WITH CTE_Employee AS 
(SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
, AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)
SELECT *
FROM CTE_Employee

CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

Select *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES (
'1001', 'HR', '45000'
)

INSERT #temp_Employee
SELECT *
FROM SQLTutorial..EmployeeSalary

DROP TABLE IF EXISTS #temp_Employee2
CREATE TABLE #temp_Employee2 (
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee2

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

INSERT INTO EmployeeErrors VALUES
('1000  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

SELECT *
FROM EmployeeErrors

SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT LastName, REPLACE(LastName, '- Fired', '') AS LastNameFixed
FROM EmployeeErrors

SELECT SUBSTRING(FirstName,3,3)
FROM EmployeeErrors

SELECT err.FirstName, dem.FirstName
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	ON err.FirstName = dem.FirstName

SELECT err.FirstName, SUBSTRING(err.FirstName,1,3), dem.FirstName, SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

--Gender
--LastName
--AGE
--DOB

SELECT FirstName, LOWER(FirstName)
FROM EmployeeErrors

SELECT FirstName, UPPER(FirstName)
FROM EmployeeErrors

CREATE PROCEDURE TEST
AS 
SELECT *
FROM EmployeeDemographics

EXEC TEST

CREATE PROCEDURE Temp_Employee
AS 
CREATE TABLE #temp_Employee (
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_Employee
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee

EXEC Temp_Employee @JobTitle = 'Salesman'

SELECT *
FROM EmployeeSalary

SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary

SELECT EmployeeID, Salary, AVG(Salary) AS AllAvgSalart
FROM EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER BY 1,2

SELECT a.EmployeeID, AllAvgSalary
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
	FROM EmployeeSalary) a

SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeID IN (
	SELECT EmployeeID
	FROM EmployeeDemographics
	WHERE Age > 30)

