
-- Select all employee's name and bonus whose bonus is < 1000.

select name, bonus
from employee e
left join bonus b
on e.empid = b.empid
where ifnull(b.bonus, 0) < 1000
