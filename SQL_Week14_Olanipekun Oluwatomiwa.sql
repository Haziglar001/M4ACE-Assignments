SELECT *
FROM [SQL Tutorial].dbo. WareHouseEmployeeDemographics

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemograhics

SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary

SELECT*
FROM [SQL Tutorial].dbo.EmployeeDemograhics
FULL OUTER JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics
 on EmployeeDemograhics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

 SELECT*
FROM [SQL Tutorial].dbo.EmployeeDemograhics
inner JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics
 on EmployeeDemograhics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

 SELECT*
FROM [SQL Tutorial].dbo.EmployeeDemograhics
left OUTER JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics
 on EmployeeDemograhics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

 SELECT*
FROM [SQL Tutorial].dbo.EmployeeDemograhics
RIGHT OUTER JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics
 on EmployeeDemograhics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

 SELECT EmployeeDemograhics.EmployeeID,EmployeeDemograhics.FirstName,EmployeeDemograhics.Lastname,EmployeeDemograhics.gender
FROM [SQL Tutorial].dbo.EmployeeDemograhics
FULL OUTER JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics
 on EmployeeDemograhics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

 

SELECT FirstName, LastName, Age,
CASE
     WHEN Age > 30 THEN 'Old' 
     WHEN Age BETWEEN 27 AND 30 THEN 'Young' 
     ELSE 'Baby'
END 
FROM [SQL Tutorial].dbo.EmployeeDemograhics
WHERE Age IS NOT NULL
ORDER BY Age

SELECT FirstName,LastName,JobTitle,Salary,
CASE
    WHEN JobTitle='Salesman' THEN Salary + (Salary * .10)
    WHEN JobTitle='Accountant' THEN Salary +(Salary * .05)
    WHEN JobTitle='HR' THEN Salary + (Salary * .000001)
    ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM [SQL Tutorial].dbo.EmployeeDemograhics
JOIN [SQL Tutorial].dbo.EmployeeSalary
     ON EmployeeDemograhics.EmployeeID =EmployeeSalary.EmployeeID

     SELECT*
FROM [SQL Tutorial].dbo.EmployeeDemograhics
union
SELECT*
FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics

SELECT*
FROM [SQL Tutorial].dbo.EmployeeDemograhics
union all
SELECT*
FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics

SELECT JobTitle,AVG  (Salary)
FROM [SQL Tutorial].dbo.EmployeeDemograhics
inner JOIN [SQL Tutorial].dbo.EmployeeSalary
 on EmployeeDemograhics.EmployeeID = EmployeeSalary.EmployeeID
 where JobTitle = 'Salesman'
 group by JobTitle

  SELECT EmployeeDemograhics.EmployeeID,FirstName,LastName,Salary
FROM [SQL Tutorial].dbo.EmployeeDemograhics
full outer JOIN [SQL Tutorial].dbo.EmployeeSalary
 on EmployeeDemograhics.EmployeeID = EmployeeSalary.EmployeeID
 where firstname <> 'Michael'
 ORDER BY 4 DESC

Select *
FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics


UPDATE [SQL Tutorial].dbo.WareHouseEmployeeDemographics
SET Age = 30
WHERE FirstName = 'Darryl' and LastName = 'Philbin'