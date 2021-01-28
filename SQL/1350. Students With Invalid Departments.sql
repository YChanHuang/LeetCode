SELECT
  s.id,
  s.name
FROM
  Students s
  LEFT JOIN departments d ON s.department_id = d.id
WHERE
  d.id IS NULL
  


--   SOLUTION 2 NOT EXISTS
  SELECT
  id,
  `name`
FROM
  Students AS s
WHERE
  NOT EXISTS(
    SELECT
      1
    FROM
      Departments
    WHERE
      id = s.department_id
  );
