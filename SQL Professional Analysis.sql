
-- Step 1: Viewing the Execution Plan for a Query with a Character Field 
SELECT * 
FROM Sales.SalesOrderDetail
WHERE SpecialOfferID = 1;

-- Step 2: Finding Missing Index Recommendations Using Execution Plan
SELECT * 
FROM Sales.SalesOrderDetail 
WHERE OrderQty = 2;

-- Step 3: Creating a Non-Clustered Index Based on the Missing Index Recommendation
CREATE NONCLUSTERED INDEX IX_SalesOrderDetail_OrderQty
ON Sales.SalesOrderDetail (OrderQty);

-- Step 4: Running the Optimized Query to Verify Improved Performance
SELECT * 
FROM Sales.SalesOrderDetail 
WHERE OrderQty = 2;