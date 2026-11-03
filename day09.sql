USE world;

-- 1. ROUND() - rounds to the specified decimal places
SELECT ROUND(12767.82678, 3);

SELECT name, gnp, ROUND(gnp, 1) AS rounded_gnp
FROM country;


-- 2. MOD() - returns the remainder
SELECT name, population, MOD(population, 7) AS remainder
FROM country;


-- 3. CEIL() - rounds up to the next integer
SELECT CEIL(22.44);  -- Output: 23


-- 4. FLOOR() - rounds down to the previous integer
SELECT FLOOR(22.44); -- Output: 22


-- 5. TRUNCATE() - removes decimal places without rounding
SELECT TRUNCATE(12767.82678, 3);


-- 6. ABS() - returns the absolute value
SELECT ABS(20 - 50); -- Output: 30


-- 7. POWER() - returns the number raised to a power
SELECT POWER(25, 7);


-- 8. SIGN() - returns -1, 0, or 1
SELECT SIGN(20 - 60); -- Output: -1
SELECT SIGN(80 - 30); -- Output: 1
SELECT SIGN(50 - 50); -- Output: 0


-- 9. SQRT() - returns the square root
SELECT SQRT(1500000);


-- 10. RAND() - returns a random number
-- Selects one random country
SELECT name
FROM country
ORDER BY RAND()
LIMIT 1;


-- 11. GREATEST() - returns the highest value
SELECT GREATEST(1122321, 745464565655555, 544564577676887);

SELECT name, gnp, gnpold,
       GREATEST(gnp, gnpold) AS highest_value
FROM country;


-- 12. LEAST() - returns the lowest value
SELECT LEAST(3989999, 455968687, 557889, 6545609609);


-- 13. SIN() - sine of an angle in radians
SELECT SIN(RADIANS(20));


-- 14. COT() - cotangent of an angle in radians
SELECT COT(RADIANS(45));


-- 15. MOD() - check whether population is even or odd
SELECT name, population,
       MOD(population, 2) AS population_remainder
FROM country
LIMIT 10;
