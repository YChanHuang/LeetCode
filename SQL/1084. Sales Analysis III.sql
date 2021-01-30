SELECT DISTINCT s.product_id AS product_id, p.product_name AS product_name
FROM sales s
JOIN product p
USING(PRODUCT_id)
WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31' AND s.Product_id NOT IN
(select product_id
from sales 
where sale_date not between '2019-01-01' and '2019-03-31')

-- solution 2
SELECT p.product_id, product_name FROM sales s,product p 
WHERE s.product_id=p.product_id
GROUP BY p.product_id
HAVING SUM(sale_date < '2019-01-01')=0
AND SUM(sale_date>'2019-03-31')=0;
