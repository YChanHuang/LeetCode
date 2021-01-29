-- Join tables by using 
# Write your MySQL query statement below
SELECT
  p.project_id as project_id,
  ROUND((SUM(e.experience_years) / COUNT(e.Employee_id)), 2) AS average_years
FROM
  Project p
  JOIN Employee e using(Employee_id)
  GROUP BY p.project_id


-- join table with "=" method
  # Write your MySQL query statement below
SELECT
  p.project_id as project_id,
  ROUND((SUM(e.experience_years) / COUNT(e.Employee_id)), 2) AS average_years
FROM
  Project p
  JOIN Employee e on e.Employee_id = p.Employee_id
  GROUP BY p.project_id