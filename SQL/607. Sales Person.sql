

select s.name
    from salesperson s
    left join orders o
    on s.sales_id = o.sales_id
    left join company c
    on o.com_id = c.com_id
GROUP BY
    name
HAVING
    sum(if(c.name = 'RED', 1, 0)) = 0
ORDER BY
    S.sales_id




来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。


-- solution 2
SELECT s.name
from salesperson s
where s.sales_id not in
    (select o.sales_id
    from orders o
    LEFT JOIN company c
    on o.com_id = c.com_id
    where c.name = 'RED' )
