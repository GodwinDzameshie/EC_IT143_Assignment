-- Step 1: Creation of the database
CREATE DATABASE SportsClub;
GO

-- Step 2: Using of the database
USE SportsClub;
GO

-- Step 3: Creation of the tables
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    JoinDate DATE
);
GO

CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName NVARCHAR(100),
    EventDate DATE
);
GO

-- Step 4: Insertion of the datas
INSERT INTO Members (MemberID, FirstName, LastName, JoinDate)
VALUES (1, 'Alice', 'Smith', '2024-01-01'),
       (2, 'Bob', 'Johnson', '2024-02-01');
GO

INSERT INTO Events (EventID, EventName, EventDate)
VALUES (1, 'Community Cleanup', '2024-04-01'),
       (2, 'Food Drive', '2024-05-01');
GO

-- Step 5: Updating of the datas
UPDATE Members
SET LastName = 'Williams'
WHERE MemberID = 1;
GO

-- Step 6: Deletion of the data
DELETE FROM Events
WHERE EventID = 2;
GO

-- Step 7: Quering of the data
SELECT * FROM Members;
SELECT * FROM Events;
GO


-- Step 8: Drop the database
-- USE master;
-- GO
-- DROP DATABASE HelloWorldDB;
-- GO