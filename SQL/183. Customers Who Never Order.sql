-- solution1

select
  c.name as Customers
from
  Customers as c
where
  c.id not in (
    select
      customerid
    from
      orders
  )


--   Solution2

select 
    c.name as Customers
from
    Customers c 
LEFT JOIN orders o
    on c.ID = o.customerID
where o.customerID is null