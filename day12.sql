USE world;

SELECT Name
FROM country
WHERE Continent = 'Asia'
UNION
SELECT Name
FROM country
WHERE Continent = 'Europe';

SELECT Name
FROM country
WHERE Continent = 'Asia'
UNION ALL
SELECT Name
FROM country
WHERE Continent = 'Europe';

SELECT Name
FROM country
WHERE Continent = 'Asia'
UNION
SELECT Name
FROM country
WHERE Continent = 'Europe'
ORDER BY Name;

SELECT
    country.Name AS Country_Name,
    city.Name AS City_Name
FROM country
INNER JOIN city
    ON country.Code = city.CountryCode;

SELECT
    country.Name AS Country_Name,
    city.Name AS City_Name,
    city.Population
FROM country
INNER JOIN city
    ON country.Code = city.CountryCode
WHERE country.Name = 'India';

SELECT
    c.Name AS Country_Name,
    ci.Name AS City_Name,
    ci.Population
FROM country AS c
INNER JOIN city AS ci
    ON c.Code = ci.CountryCode
WHERE c.Continent = 'Asia'
ORDER BY ci.Population DESC;

SELECT
    c.Name AS Country_Name,
    COUNT(ci.ID) AS Total_Cities
FROM country AS c
INNER JOIN city AS ci
    ON c.Code = ci.CountryCode
GROUP BY c.Code, c.Name
ORDER BY Total_Cities DESC;

SELECT
    c.Name AS Country_Name,
    COUNT(ci.ID) AS Total_Cities
FROM country AS c
INNER JOIN city AS ci
    ON c.Code = ci.CountryCode
GROUP BY c.Code, c.Name
HAVING COUNT(ci.ID) > 5
ORDER BY Total_Cities DESC;
