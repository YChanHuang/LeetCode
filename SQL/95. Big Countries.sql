/*
A country is big if it has an area of bigger than 3 million square km or a population of more than 25 million.

Write a SQL solution to output big countries' name, population and area.

For example, according to the above table, we should output:

 */


-- solution1

select name, population, area
from world
where population > 25000000  or area > 3000000


-- solution2


select name, population, area
from world
where population > 25000000
UNION
select name, population, area
from world
where area > 3000000
