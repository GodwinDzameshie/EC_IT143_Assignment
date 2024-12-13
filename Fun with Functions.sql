-- Function 1: Calculate Total Sales for a Product
CREATE FUNCTION CalculateTotalSales(@ProductID INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalSales MONEY;
    SELECT @TotalSales = SUM(OrderDetails.Quantity * OrderDetails.UnitPrice)
    FROM OrderDetails
    WHERE OrderDetails.ProductID = @ProductID;
    RETURN @TotalSales;
END;
GO

-- Test Function 1
SELECT dbo.CalculateTotalSales(1) AS TotalSalesForProduct1;
GO

-- Function 2: Return Full Name of an Employee
CREATE FUNCTION GetEmployeeFullName(@EmployeeID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @FullName NVARCHAR(100);
    SELECT @FullName = CONCAT(FirstName, ' ', LastName)
    FROM Employees
    WHERE EmployeeID = @EmployeeID;
    RETURN @FullName;
END;
GO

-- Test Function 2
SELECT dbo.GetEmployeeFullName(1) AS EmployeeFullName;
GO