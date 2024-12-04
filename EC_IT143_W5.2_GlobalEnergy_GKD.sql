-- EC_IT143_W5.2_GlobalEnergy_GKD.sql
-- Author: Godwin Kwesi Dzameshie
-- Description: SQL queries for the Global Energy Generation and Capacity dataset
-- Date: 12/3/2024

-- Question 1: List all the countries with their total energy generation in the most recent year available
SELECT Country, SUM(EnergyGeneration) AS TotalEnergyGeneration
FROM GlobalEnergy
WHERE Year = (SELECT MAX(Year) FROM GlobalEnergy)
GROUP BY Country
ORDER BY TotalEnergyGeneration DESC;

-- Question 2: Calculate the total installed capacity across all countries for renewable energy sources
SELECT SUM(InstalledCapacity) AS TotalRenewableCapacity
FROM GlobalEnergy
WHERE EnergySource IN ('Solar', 'Wind', 'Hydropower', 'Geothermal', 'Biomass');

-- Question 3: Retrieve the top 5 countries with the highest energy generation from solar energy
SELECT TOP 5 Country, SUM(EnergyGeneration) AS SolarEnergyGeneration
FROM GlobalEnergy
WHERE EnergySource = 'Solar'
GROUP BY Country
ORDER BY SolarEnergyGeneration DESC;

-- Question 4: Show the average energy generation per year for each energy source
SELECT EnergySource, AVG(EnergyGeneration) AS AvgEnergyGeneration
FROM GlobalEnergy
GROUP BY EnergySource
ORDER BY AvgEnergyGeneration DESC;