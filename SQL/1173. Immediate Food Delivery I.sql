-- solution 1 (recommended)
select
  round (
    sum(
      case
        when order_date = customer_pref_delivery_date then 1
        else 0
      end
    ) / count(*) * 100,
    2
  ) as immediate_percentage
from
  Delivery


-- solution2
SELECT
  ROUND(
    (
      SELECT
        COUNT(*)
      FROM
        delivery
      WHERE
        order_date = customer_pref_delivery_date
    ) / (
      SELECT
        COUNT(delivery_id)
      from
        delivery
    ) * 100,
    2
  ) as immediate_percentage


--   solution 3 (this is brilliant)

select
  round (
    sum(order_date = customer_pref_delivery_date) / count(*) * 100,
    2
  ) as immediate_percentage
from
  