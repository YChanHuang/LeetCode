SELECT 
    MAX(num) as num
FROM 
(SELECT num
FROM my_numbers 
GROUP BY num
HAVING COUNT(num) = 1) as t ;


--1. subquery is to find num only appear only once
--2. find the max num from the subquery table.