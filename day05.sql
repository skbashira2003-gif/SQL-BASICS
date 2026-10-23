
USE world;

SELECT
    country.Name AS Country_Name,
    country.Continent,
    city.Name AS City_Name,
    city.Population AS City_Population
FROM country
INNER JOIN city
ON country.Code = city.CountryCode;

SELECT
    country.Name AS Country_Name,
    city.Name AS City_Name
FROM country
LEFT JOIN city
ON country.Code = city.CountryCode;

SELECT
    country.Name AS Country_Name,
    city.Name AS City_Name
FROM country
RIGHT JOIN city
ON country.Code = city.CountryCode;

SELECT
    country.Name AS Country_Name,
    COUNT(city.ID) AS Total_Cities
FROM country
LEFT JOIN city
ON country.Code = city.CountryCode
GROUP BY country.Code, country.Name
ORDER BY Total_Cities DESC;

SELECT
    country.Name AS Country_Name,
    city.Name AS City_Name
FROM country
CROSS JOIN city
LIMIT 20;

SELECT
    c1.Name AS Country1,
    c2.Name AS Country2,
    c1.Continent
FROM country c1
JOIN country c2
ON c1.Continent = c2.Continent
AND c1.Code < c2.Code
LIMIT 20;

