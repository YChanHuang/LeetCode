-- solved by ALL 
SELECT project_id
FROM project
GROUP BY project_id
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*) AS amount
    FROM Project
    GROUP BY project_id
    )


-- 
SELECT project_id
FROM project
GROUP BY project_id
HAVING COUNT(*) = (
    SELECT COUNT(*) AS amount
    FROM Project
    GROUP BY project_id
    ORDER BY amount DESC
    LIMIT 1 
    )