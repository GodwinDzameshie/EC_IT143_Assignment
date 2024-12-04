-- EC_IT143_W5.2_BookClub_GKD.sql
-- Author: Godwin Kwesi Dzameshie
-- Description: SQL queries for the  Book Club dataset
-- Date: 12/3/2024

-- Question 1: List all members who joined the club in the last two years.
SELECT MemberID, MemberName, JoinDate
FROM BookClub
WHERE JoinDate >= DATEADD(YEAR, -2, GETDATE());

-- Question 2: Calculate the total revenue generated from all book purchases.
SELECT SUM(PurchaseAmount) AS TotalRevenue
FROM BookClub
WHERE PurchaseAmount IS NOT NULL;

-- Question 3: Show the names of books and their authors that were purchased by members.
SELECT DISTINCT BookTitle, Author
FROM BookClub
WHERE PurchaseID IS NOT NULL;

-- Question 4: Find the number of books purchased by each member.
SELECT MemberID, MemberName, COUNT(BookID) AS NumberOfBooksPurchased
FROM BookClub
WHERE PurchaseID IS NOT NULL
GROUP BY MemberID, MemberName;