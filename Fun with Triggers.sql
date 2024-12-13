-- Trigger 1: Log Deleted Records from Customers Table
CREATE TRIGGER trg_LogCustomerDeletion
ON Customers
AFTER DELETE
AS
BEGIN
    INSERT INTO DeletedCustomersLog (CustomerID, CompanyName, DeletedDate)
    SELECT CustomerID, CompanyName, GETDATE()
    FROM DELETED;
END;
GO

-- Test Trigger 1
DELETE FROM Customers WHERE CustomerID = 'ALFKI';
SELECT * FROM DeletedCustomersLog;
GO

-- Trigger 2: Prevent Negative Stock Quantities
CREATE TRIGGER trg_PreventNegativeStock
ON Products
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM Products
        WHERE UnitsInStock < 0
    )
    BEGIN
        RAISERROR ('Stock quantity cannot be negative.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- Test Trigger 2 (Valid Update: Set UnitsInStock to 30)
UPDATE Products
SET UnitsInStock = 30
WHERE ProductID = 1; -- Valid, should update without error.
GO

-- Test Trigger 2 (Invalid Update: Set UnitsInStock to -5)
BEGIN TRY
    UPDATE Products
    SET UnitsInStock = -5
    WHERE ProductID = 2; -- Invalid, should trigger an error.
END TRY
BEGIN CATCH
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH;
GO
