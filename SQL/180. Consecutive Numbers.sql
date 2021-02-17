
SELECT DISTINCT NUM as `ContinueNumber` FROM (
SELECT num, COUNT(1) as serialCOUNT FROM
    (SELECT ID, num,
    ROW_NUMBER() OVER(ORDER BY id) -
    ROW_NUMBER() OVER(partition by id ORDER BY id) as SerialNumberGROUP
    FROM logs) as sub
GROUP BY NUM, SerialNumberGROUP 
HAVING COUNT(1) >= 3) as result


-- window function

SELECT distinct num as ContinueNumber 
FROM 
(
    select num, lead(num, 1) OVER() as num1, lead(num, 2) OVER() AS num2
    FROM logs
) as t
Where t.num = t.num1 and t.num1 = t.num2