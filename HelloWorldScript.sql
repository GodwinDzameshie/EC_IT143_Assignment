-- Step 1: Creating of a new database
CREATE DATABASE HelloWorldDB;
GO

-- Step 2: Using of the new database
USE HelloWorldDB;
GO

-- Step 3: Creating of the table
CREATE TABLE HelloWorldTable (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Message NVARCHAR(50) NOT NULL
);
GO

-- Step 4: Insertion of the data into the table
INSERT INTO HelloWorldTable (Message)
VALUES 
    ('Hello, World!'),
    ('Welcome to T-SQL!'),
    ('This is a test message.');
GO

-- Step 5: Quering the table
SELECT * FROM HelloWorldTable;
GO

-- Step 6: Updating the data in the table
UPDATE HelloWorldTable
SET Message = 'Hello, SQL World!'
WHERE ID = 1;
GO

-- Step 7: Deleting a row from the table
DELETE FROM HelloWorldTable
WHERE ID = 3;
GO

-- Step 8: Quering the table again to see the changes
SELECT * FROM HelloWorldTable;
GO

-- Step 9: Droping of the table (This place is optional so I decided not to query it) 
-- Uncomment the lines below if you want to clean up the database
-- DROP TABLE HelloWorldTable;
-- DROP DATABASE HelloWorldDB;
