

/*retieving data from Customers table*/

SELECT CustomerName FROM dbo.Customers;

SELECT CustomerName , Notes 
FROM dbo.Customers;

-- aliasing in sql usig the AS keyword
SELECT CustomerName AS  [Customer Name] 
FROM dbo.Customers;

-- Distict keyword helps get unique values
SELECT DISTINCT CustomerName, Notes
FROM dbo.Customers;

--*(Asterisk) is used to select all columns without naming them individually

SELECT *
FROM dbo.Customers;

-- Select all columns from Orders
SELECT *
FROM dbo.Orders;

-- Select Top

SELECT TOP 10 CustomerName, Notes
FROM dbo.Customers;

-- commenting

SELECT TOP 10 OrderID, CustomerID, OrderDate
FROM dbo.Orders
ORDER BY OrderDate DESC;

/*
  This is a multi-line comment.

*/
SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM dbo.Customers c
INNER JOIN dbo.Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName;

-- NOT EQUAL

SELECT CustomerName, Notes
FROM dbo.Customers
WHERE CustomerName <> 'John';



--OR

SELECT CustomerName, Notes
FROM dbo.Customers
WHERE (State = 'WA' OR State = 'NY') ;

--AND 

SELECT CustomerName, Notes
FROM dbo.Customers
WHERE (CustomerName = 'John' OR CustomerName = 'Mary') AND Notes IS NOT NULL;

--IN

SELECT CustomerName, Notes
FROM dbo.Customers
WHERE State IN ('WA','NY','UT'); 

SELECT OrderID, CustomerID, OrderDate
FROM dbo.Orders
WHERE CustomerID IN (1, 5, 10);

-- NOT IN
SELECT CustomerName, Notes
FROM dbo.Customers
WHERE State NOT IN ('WA','NY','UT'); 



-- AND with OR

SELECT * 
FROM dbo.Customers
WHERE CustomerName = 'Tres Delicious' AND (Country = 'United States' OR 
Country = 'France');

--LIKE

SELECT CustomerName
FROM dbo.Customers
WHERE CustomerName LIKE '%Delicious%';

--Find customers ending with "s":
SELECT CustomerName
FROM dbo.Customers
WHERE CustomerName LIKE '%s';

--Find products with exactly one characters before "Chocolate"

select * from Product;
SELECT CookieName
FROM dbo.Product
WHERE CookieName LIKE '_Chocolate';

--NOT like negates LIKE
SELECT CustomerName
FROM dbo.Customers
WHERE CustomerName NOT LIKE 'A%';

/*Filter NumericalValues*/
SELECT TOP(5) OrderID, CustomerID, OrderDate,OrderTotal
FROM Orders;
-- WHERE 
-- Used to filtered based on criterion given
--BETWEEN filters values within a range (inclusive on both ends)
SELECT OrderID, CustomerID, OrderDate,OrderTotal
FROM dbo.Orders
WHERE OrderTotal BETWEEN 1000 AND 2000;

SELECT *
FROM dbo.Customers
WHERE CustomerID BETWEEN 5 AND 15;

-- NOT BETWEEN

SELECT CustomerName, State
FROM dbo.Customers
WHERE State NOT BETWEEN 'A' AND 'M';  -- Exclude states A-M alphabetically


-- JOINS

SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM dbo.Customers AS c
INNER JOIN dbo.Orders AS o
  ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName;

--lEFT JOIN

SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM dbo.Customers AS c
LEFT JOIN dbo.Orders AS o
  ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName;

--RIGHT JOIN
	
SELECT OrderID, OrderDate,OrderTotal, CustomerName, Phone
FROM Orders o RIGHT JOIN Customers c 
ON o.CustomerID = c.CustomerID;

-- FULL JOIN

SELECT * 
FROM Orders o
FULL OUTER JOIN Customers c
ON o.CustomerID = c.CustomerID
ORDER BY OrderDate;

/*Functions in SQL*/

--DATEADD()

SELECT * FROM Orders
SELECT count(*) as Number_Of_Orders 
FROM Orders
WHERE OrderDate >= DATEADD(MONTH,-1,GETDATE());

SELECT SUM(OrderTotal) AS Sum_Of_Total_Orders 
FROM dbo.Orders
WHERE OrderDate >= DATEADD(MONTH, -1, GETDATE());

SELECT ISNULL(SUM(OrderTotal), 0) AS Sum_Of_Total_Orders 
FROM dbo.Orders
WHERE OrderDate >= DATEADD(YEAR, -5, GETDATE());



/*Group By and Order BY
GROUP BY groups rows and collapses them into summary rows.
ORDER BY sorts the results.
*/
SELECT *, COUNT(*) AS NumberOfOrders
FROM dbo.Orders
GROUP BY CustomerID
ORDER BY NumberOfOrders DESC;

--Monthly sales with filtering
SELECT YEAR(OrderDate) AS Year,
       MONTH(OrderDate) AS Month,
       SUM(OrderTotal) AS MonthlySales
FROM dbo.Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING SUM(OrderTotal) > 4000  
ORDER BY Year DESC, Month DESC;

