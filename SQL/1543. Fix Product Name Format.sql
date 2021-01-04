


select
  LOWER(TRIM(product_name)) as product_name,
  LEFT(sale_date, 7) as sale_date,
  COUNT(*) as total
FROM
  sales
GROUP BY
  1,
  2
ORDER BY
  1,
  2