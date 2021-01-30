SELECT 
    w.name AS warehouse_name,
    SUM(p.width * p.length * p.height * w.units)AS volume
FROM
    warehouse w
JOIN
    project p
using(product_id)
GROUP BY warehouse_name
