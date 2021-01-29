-- 
-- Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.
-- Return the result table in any order.


SELECT o.customer_id as customer_id, c.name as name
FROM customers c
JOIN 
    orders o
ON c.customer_id = o.customer_id
JOIN
    product p 
ON p.product_id = o.product_id
GROUP BY o.customer_id, c.name
HAVING SUM(IF(order_date LIKE '2020-06%', o.quantiy * o.price, 0 )) >= 100
AND SUM(IF(order_date LIKE '2020-07%', o.quantiy * o.price, 0)) >= 100