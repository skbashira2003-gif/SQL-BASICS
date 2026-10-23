
USE world;

SELECT Name, Population
FROM country
WHERE Population > (
    SELECT AVG(Population)
    FROM country
);

SELECT Name, Population
FROM country
WHERE Population = (
    SELECT MAX(Population)
    FROM country
);

SELECT Name, Population
FROM country
WHERE Population = (
    SELECT MIN(Population)
    FROM country
);

SELECT Name, Continent, Population
FROM country
WHERE Population > (
    SELECT AVG(Population)
    FROM country
)
ORDER BY Population DESC;

SELECT Name, Continent, Population
FROM country
WHERE Continent IN (
    SELECT Continent
    FROM country
    GROUP BY Continent
    HAVING COUNT(*) > 30
);

SELECT Name, Population
FROM country
WHERE Population > ANY (
    SELECT Population
    FROM country
    WHERE Continent = 'Europe'
);

SELECT Name, Population
FROM country
WHERE Population > ALL (
    SELECT Population
    FROM country
    WHERE Continent = 'Oceania'
);

SELECT Name
FROM country
WHERE Code IN (
    SELECT CountryCode
    FROM city
    GROUP BY CountryCode
    HAVING COUNT(*) > 10
);

SELECT Name
FROM country c
WHERE EXISTS (
    SELECT 1
    FROM city ci
    WHERE ci.CountryCode = c.Code
);

SELECT Name
FROM country c
WHERE NOT EXISTS (
    SELECT 1
    FROM city ci
    WHERE ci.CountryCode = c.Code
);
