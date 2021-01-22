# Write your MySQL query statement below
select
  p.product_id as product_id,
  SUM(quantity) as total_quantity
from
  sales s
  join product p on s.product_id = p.product_id
GROUP BY
  p.product_id