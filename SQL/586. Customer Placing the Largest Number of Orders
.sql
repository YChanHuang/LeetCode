SELECT customer_number
FROM orders
GROUP BY customer_number -- group by customer to count how many orders has placed.
ORDER BY COUNT(*) DESC -- order by its number of orders
LIMIT 1 -- keep the first selected data
