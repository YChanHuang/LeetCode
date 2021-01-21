SELECT
  *
FROM
  cinema
WHERE
  id % 2 <> 0
  and description NOT LIKE '%boring%'
ORDER BY
  rating desc