--SUB QURIES
SELECT*
From [SQL Tutorial].dbo. EmployeeSalary

SELECT EmployeeID,Salary,(SELECT AVG(Salary) From [SQL Tutorial].dbo. EmployeeSalary) as AllAverageSalary
From [SQL Tutorial].dbo. EmployeeSalary

SELECT EmployeeID,Salary,AVG(Salary) over() as AllAverageSalary
From [SQL Tutorial].dbo. EmployeeSalary

SELECT EmployeeID,Salary,AVG(Salary) as AllAverageSalary
From [SQL Tutorial].dbo. EmployeeSalary
GROUP BY EmployeeID,Salary
ORDER BY 1,2

SELECT* a.EmployeeID,AllAverageSalary
FROM (SELECT EmployeeID,Salary,AVG(Salary) over () as AllAvgSalary
       From EmployeeSalary) a 

SELECT EmployeeID,JobTitle,Salary
From EmployeeSalary
Where EmployeeID in (
         Select EmployeeID  
         FROM [SQL Tutorial].dbo.EmployeeDemograhics
         WHERE Age > 30)




--TEMP TABLES

CREATE TABLE #temp_Employee(
EmployeeID int,
JobTitle varchar(50),
Salary int
)

SELECT*
From #temp_Employee

Insert into #temp_Employee VALUES (
'1001','HR','45000'
)

INSERT INTO #temp_Employee
Select * 
From [SQL Tutorial]..EmployeeSalary

DROP TABLE IF EXISTS #Temp_Employee2 
CREATE TABLE #TEMP_Employee2 (
JobTitle varchar(50),
EmloyeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #TEMP_Employee2
SELECT JobTitle,Count(JobTitle),Avg(Age),Avg(Salary)
From [SQL Tutorial]..EmployeeDemograhics emp
join  [SQL Tutorial]..EmployeeSalary sal
    ON emp.EmployeeID=sal.EmployeeID
GROUP BY JobTitle

Select *
From #TEMP_Employee2

----CTE's (Common Table Expressions)

WITH CTE_Employee as 
(SELECT FirstName,LastName,Gender,Salary
,Count(gender) Over (Partition BY Gender) as TotalGender
,AVG(Salary) OVER (Partition By Gender) as AvgSalary
FROM [SQL Tutorial]..EmployeeDemograhics emp
join [SQL Tutorial]..EmployeeSalary sal
    ON emp.EmployeeID =sal.EmployeeID
WHERE Salary >'45000'
)
Select FirstName,AvgSalary
From CTE_Employee