SELECT
  seller_id
from
  sales
group by
  seller_id
having
  sum(price) >= all(
    SELECT
      sum(price)
    from
      sales
    group by
      seller_id
  )


  -- other solution

  SELECT seller_id
  FROM sales
  GROUP BY seller_id
  HAVING sum(price) >= all(select sum(price) from sales group by seller_id)