
USE world;

SELECT Name, UPPER(Name) AS Upper_Name
FROM country;

SELECT Name, LOWER(Name) AS Lower_Name
FROM country;

SELECT Name, LENGTH(Name) AS Name_Length
FROM country;

SELECT Name, CHAR_LENGTH(Name) AS Character_Count
FROM country;

SELECT Name, LEFT(Name, 3) AS First_Three_Characters
FROM country;

SELECT Name, RIGHT(Name, 3) AS Last_Three_Characters
FROM country;

SELECT Name, SUBSTRING(Name, 1, 5) AS First_Five_Characters
FROM country;

SELECT Name, CONCAT(Name, ' - ', Continent) AS Country_Details
FROM country;

SELECT Name, REPLACE(Name, 'a', '@') AS Modified_Name
FROM country;

SELECT Name, TRIM(Name) AS Trimmed_Name
FROM country;

SELECT Name, LOCATE('a', Name) AS Position_Of_A
FROM country;

SELECT Name, REVERSE(Name) AS Reversed_Name
FROM country;

SELECT Name, LCASE(Name) AS Lowercase_Name
FROM country
LIMIT 20;

SELECT Name, UCASE(Name) AS Uppercase_Name
FROM country
LIMIT 20;
