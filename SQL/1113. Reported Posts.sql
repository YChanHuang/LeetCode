SELECT 
    extra AS report_reason, 
    COUNT(distinct post_id) AS report_count
FROM 
    Actions
WHERE 
    datediff('2019-07-05', action_date) = 1 and 
    extra is NOT NULL and 
    action = 'report'
GROUP BY 
    report_reason