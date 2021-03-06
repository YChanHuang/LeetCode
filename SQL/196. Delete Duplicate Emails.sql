-- 196. Delete Duplicate Emails

DELETE *
FROM
    Person p1,Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id
;


-- solution 2
DELETE *
from person
where ID not in (
SELECT MIN(id) as id
FROM  person
GROUP BY Email )
