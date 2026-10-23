
USE world;

SELECT COUNT(*) AS Total_Countries
FROM country;

SELECT SUM(Population) AS Total_World_Population
FROM country;

SELECT AVG(Population) AS Average_Country_Population
FROM country;

SELECT MAX(Population) AS Highest_Population
FROM country;

SELECT MIN(Population) AS Lowest_Population
FROM country;

SELECT Continent, COUNT(*) AS Total_Countries
FROM country
GROUP BY Continent;

SELECT Continent, SUM(Population) AS Total_Population
FROM country
GROUP BY Continent;

SELECT Continent, AVG(Population) AS Average_Population
FROM country
GROUP BY Continent;

SELECT Continent, MAX(Population) AS Highest_Population
FROM country
GROUP BY Continent;

SELECT Continent, MIN(Population) AS Lowest_Population
FROM country
GROUP BY Continent;

SELECT Continent, COUNT(*) AS Total_Countries
FROM country
GROUP BY Continent
HAVING COUNT(*) > 20;

SELECT Continent, SUM(Population) AS Total_Population
FROM country
GROUP BY Continent
HAVING SUM(Population) > 1000000000;

SELECT Continent, AVG(Population) AS Average_Population
FROM country
GROUP BY Continent
ORDER BY Average_Population DESC;

SELECT Continent, COUNT(*) AS Total_Countries
FROM country
GROUP BY Continent
ORDER BY Total_Countries DESC;

SELECT COUNT(IndepYear) AS Countries_With_Independence_Year
FROM country;
