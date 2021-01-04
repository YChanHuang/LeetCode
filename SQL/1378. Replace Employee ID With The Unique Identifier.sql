SELECT
  unique_id,
  name
FROM
  employees a
  LEFT join EmployeeUNI b on a.id = b.id