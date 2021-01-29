SELECT
ad_id,
 IFNULL(SUM(action = 'Clicked') / 
 (SUM(action = 'Clicked') + SUM（action = 'Viewed')) * 100,0) AS CTR
FROM ads
GROUP BY ad_id
ORDER BY ad_id ,ctr DESC