
USE world;

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

SELECT Continent, SUM(Population) AS Total_Population
FROM country
GROUP BY Continent
HAVING SUM(Population) >= 1000000000;

SELECT Continent, COUNT(*) AS Total_Countries
FROM country
GROUP BY Continent
HAVING COUNT(*) > 20
ORDER BY Total_Countries DESC;
