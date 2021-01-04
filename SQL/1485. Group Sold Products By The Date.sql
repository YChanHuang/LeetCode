
-- Important Syntax GROUP_CONCAT()
SELECT
  sell_date,
  COUNT(distinct product) as num_sold,
  GROUP_CONCAT(DISTINCT product) AS products
FROM
  Activities
GROUP BY
  sell_date
ORDER BY
  sell_date