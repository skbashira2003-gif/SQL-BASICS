#numerical functions

#round()- rounds a number to the specified no.of decimal places
#round(number,decimal places)
select round(12767.82678,3);
select name,gnp,round(gnp,1) as rounded_gnp
from country;
use world;

#mod()-returns the remainder, if 0-->its completely divisible
#mod(number,divisor)
select name,population,mod(population,7) as remainder
from country;

#ceil()- always rounds down
select ceil(22.44);

#floor()- always rownds down
select floor(22.44);

#truncate- removes decimal places without rounding the values
select truncate(12767.82678,3);

#abs- absolute value returns the absolute(+ve) value of a number.alter
select abs(20-50);

#pow()-exponentiation
select power(25,7);

#sign()-returns -1 for negative, 1 for positive, 0 for no change
select sign(20-60);
select sign(80-30);
select sign(50=50);

#sqrt()
select sqrt(1500000);

USE world;

SELECT actor_name
FROM actors_db.actors
ORDER BY RAND()
LIMIT 1;

#greatest()- compare values the highest values among the two values
select greatest(1122321,745464565655555,544564577676887);
select name,gnp,gnpold, greatest(gnp,gnpold) as highest_value
from country;

#least()- compares the least values among the given two values
select least(3989999,455968687,557889,6545609609);

select sin(radians(20));
select cot(45);

SELECT Name, Population,
       MOD(Population, 2) AS Population_Remainder
FROM country
LIMIT 10;
