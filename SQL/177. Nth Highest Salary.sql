-- solution 1
CREATE FUNCTION getNthHighestSALARY(N INT) RETURNS INT
BEGIN 
    SET N := N-1;
RETURN (
    SELECT
        salary
    FROM
        Employee
    GROUP BY
        salary
    ORDER BY
        salary DESC
    LIMIT N, 1
)
END
-- solution 2
SELECT 
    e1.salary
FROM 
    employee e1, employee e2
WHERE e1.salary <= e2.salary
GROUP BY e1.salary
HAVING COUNT(DISTINCT e2.salary) = N
-- window function

;

-- solution2 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
        SELECT 
            DISTINCT salary
        FROM 
            (SELECT 
                salary, dense_rank() over(ORDER BY salary DESC) AS rnk
             FROM 
                employee) tmp
        WHERE rnk = @N
  );
END
