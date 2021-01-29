-- This can't work...

SELECT product_id, ROUND(SUM(sales) / SUM(units), 2) as average_price
FROM
    (SELECT p.product_id as product_id,
    p.price * u.units as sales,
    u.units as units,
    FROM Prices AS p 
    JOIN UnitsSold AS u 
    ON p.product_id = u.product_id 
    WHERE UnitsSold.purchase_date
    BETWEEN P.start_date AND P.end_date) A
    GROUP BY product_id


-- Solution (this works)
SELECT product_id,
ROUND(SUM(price* units) / SUM(units))AS average_price

FROM prices p
JOIN UnitsSold units
on p.product_id = u.product_id
WHERE u.purchase_date BETWEEN p.start_date and p.end_date
GROUP BY product_id
