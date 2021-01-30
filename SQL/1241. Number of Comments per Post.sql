
-- 
SELECT 
s1.sub_id as post_id
IFNULL(COUNT(DISTINCT s2.sub_id),0) AS number_of_comments
FROM submissions s1
LEFT JOIN session s2 
on s1.sub_id = s2.parent_id
WHERE s1.parent_id is null
GROUP BY s1.sub_id
ORDER BY s1.sub_id
