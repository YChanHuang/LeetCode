-- 570.Managers with at Least 5 Direct Reports
SELECT 
    name
FROM
    employee as e1 JOIN 
select 
    managerID
FROM
    employee
GROUP BY managerID
HAVIGN COUNT(ManagerID) >= 5 as e2
on e1.ID = e2.managerID;
