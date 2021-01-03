-- Write an SQL query to find all dates'id 
-- with higher temperature
-- compared to its previous dates (yesterday).
--
-- Return the result table in any order.
--

-- solution 1
select w1.id as Id
from weather w1
join weather w2
on DATEDIFF(w1.recordDate, w2.recordDate) = 1
where w1.temperature > w2.temperature


-- solution 2
select w1.id as Id
from weather w1, weather w2
where DATEDIFF(w1.recordDate, w2.recordDate) = 1 and w1.temperature > w2.temperature
