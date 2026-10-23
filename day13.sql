USE world;

CREATE OR REPLACE VIEW asian_countries AS
SELECT Code, Name, Continent, Population
FROM country
WHERE Continent = 'Asia';

SELECT * FROM asian_countries;

CREATE OR REPLACE VIEW country_details AS
SELECT Name, Continent, Region, Population
FROM country;

SELECT * FROM country_details;

CREATE OR REPLACE VIEW asian_country_details AS
SELECT Code, Name, Population
FROM country
WHERE Continent = 'Asia'
WITH CHECK OPTION;

SELECT * FROM asian_country_details;

UPDATE asian_country_details
SET Population = Population + 1000
WHERE Code = 'IND';

SELECT * FROM asian_country_details;

SELECT Code, Name, Population
FROM country
WHERE Code = 'IND';

START TRANSACTION;

UPDATE country
SET Population = Population + 1000
WHERE Code = 'IND';

COMMIT;

SELECT Code, Name, Population
FROM country
WHERE Code = 'IND';

START TRANSACTION;

UPDATE country
SET Population = Population + 5000
WHERE Code = 'IND';

ROLLBACK;

SELECT Code, Name, Population
FROM country
WHERE Code = 'IND';

START TRANSACTION;

UPDATE country
SET Population = Population + 100
WHERE Code = 'IND';

SAVEPOINT sp1;

UPDATE country
SET Population = Population + 200
WHERE Code = 'IND';

ROLLBACK TO SAVEPOINT sp1;

COMMIT;

SELECT Code, Name, Population
FROM country
WHERE Code = 'IND';

START TRANSACTION;

UPDATE country
SET Population = Population + 50
WHERE Code = 'IND';

SAVEPOINT sp2;

UPDATE country
SET Population = Population + 75
WHERE Code = 'IND';

ROLLBACK TO SAVEPOINT sp2;

RELEASE SAVEPOINT sp2;

COMMIT;

SELECT Code, Name, Population
FROM country
WHERE Code = 'IND';

DROP VIEW IF EXISTS asian_country_details;
DROP VIEW IF EXISTS asian_countries;
DROP VIEW IF EXISTS country_details;
