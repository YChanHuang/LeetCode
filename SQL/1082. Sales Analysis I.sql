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