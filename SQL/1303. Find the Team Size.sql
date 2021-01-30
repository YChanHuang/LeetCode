

SELECT 
e1.employee_id ,COUNT(*) as team_size
FROM employee e1 join employee e2 
USING(team_id)
GROUP BY e1.employee_id
ORDER BY e1.employee_id;

-- # Window Function
SELECT
    employee_id,
    COUNT(employee_id) OVER(PARTITION BY team_id) AS team_size
FROM Employee
ORDER BY employee_id;

