SELECT buyer_id 
from
    (SELECT buyer_id,
    CASE WHEN p.product_name = 'S8' then 1 else 0 end s8,
    CASE WHEN p.product_name = 'iPhone' then 1 else 0 end IPh
    from Sales s LEFT JOIN Product p on s.product_id = p.product_id) a 
GROUP BY buyer_id
HAVING SUM(s8) >0 and sum(IPh) = 0\

-- solution 2 GROUP_CONCAT

SELECT
    s.buyer_id
FROM
    sales s
    JOIN product p on s.product_id = p.product_id
    AND p.product_name IN ('S8', 'iPhone')

GROUP BY 
    s.buyer_id
HAVING 
    GROUP_CONCAT(DISTINCT p.product_name) = 'S8';

-- solution 3 COUNT + IF

SELECT
  S.buyer_id
FROM
  Sales S
  JOIN Product P ON S.product_id = P.product_id
GROUP BY
  S.buyer_id
HAVING
  COUNT(IF(P.product_name = 'S8', TRUE, NULL)) >= 1
  AND COUNT(IF(P.product_name = 'iPhone', TRUE, NULL)) = 0 
