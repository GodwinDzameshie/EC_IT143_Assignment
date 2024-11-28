-- Step 1: Creation of the database
CREATE DATABASE BookClub;
GO

-- Step 2: Using of  the database
USE BookClub;
GO

-- Step 3: Creation of the table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    JoinDate DATE NOT NULL DEFAULT GETDATE()
);
GO

-- Step 4: Insertion of the data into the table
INSERT INTO Members (FullName, Email)
VALUES 
    ('Alice Johnson', 'alice@example.com'),
    ('Bob Smith', 'bob@example.com'),
    ('Charlie Brown', 'charlie@example.com'),
    ('Dana White', 'dana@example.com');
GO

-- Step 5: Selecting the data from the table
SELECT * FROM Members;
GO

-- Step 6: Updating a row in the table
UPDATE Members
SET Email = 'bob.newemail@example.com'
WHERE MemberID = 2;
GO

-- Step 7: Deletion of a row from the table
DELETE FROM Members
WHERE MemberID = 3;
GO

-- Step 8: Droping the database
-- USE master;
-- GO
-- DROP DATABASE BookClub;
-- GO
