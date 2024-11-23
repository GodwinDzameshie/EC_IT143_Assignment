-- Question 1: List all products and their associated subcategories
SELECT p.ProductID, p.Name AS ProductName, ps.Name AS SubcategoryName
FROM Production.Product p
LEFT JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID;

-- Question 2: Retrieve the total number of customers in the database
SELECT COUNT(*) AS TotalCustomers
FROM Sales.Customer;

-- Question 3: Find all sales orders with a total due greater than $10,000, including the order date, customer, and total due
SELECT soh.SalesOrderID, soh.OrderDate, c.CustomerID, soh.TotalDue
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
WHERE soh.TotalDue > 10000;

-- Question 4: Retrieve the average product list price for each subcategory
SELECT ps.Name AS SubcategoryName, AVG(p.ListPrice) AS AverageListPrice
FROM Production.Product p
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.Name;

-- Question 5: Find the top 5 customers who placed the most orders, including their total order count
SELECT c.CustomerID, COUNT(soh.SalesOrderID) AS TotalOrders
FROM Sales.Customer c
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalOrders DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- Question 6: Calculate the total sales amount per year
SELECT YEAR(soh.OrderDate) AS SalesYear, SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
GROUP BY YEAR(soh.OrderDate)
ORDER BY SalesYear;

-- Question 7: List all tables and their schemas in the database
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- Question 8: Find all columns in a specific table, including their data types and maximum lengths
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Product';
