

-- How will you calculate the Daily Active Users over last 3 months.It is defined as count of unique users that start at least one session in the app on any given day


SELECT
  activity_date as day,
  COUNT(DISTINCT user_id) as daily_active_users
FROM
  sessions
GROUP BY
  activity_date
HAVING
  activity_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
ORDER BY 
  activity_date

-- monthly activity users in the last 6 month
SELECT
  DATE_FORMAT(activity_date, '%Y-%m') as month,
  COUNT(DISTINCT user_id) as monthly_active_users
FROM
  sessions
GROUP BY
  month
HAVING
  activity_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
ORDER BY 
  activity_date

-- new joiner last month

SELECT COUNT(user_id) as total_new_players
FROM sessions s1, sessions s2
where s2.user_id <> s1.user_id
GROUP BY DATE_FORMAT(activity_date, '%Y-%m')
HAVING activity_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
ORDER BY 
  activity_date
-- average sessions per daily active user

WITH dau AS(
    SELECT 
     activity_date, 
     session_id,
     count(user_id) as da_users
    FROM sessions
    GROUP BY activity_date
)

SELECT COUNT(sessions_id) / da_users as avg_sessions
from dau

-- avg time spend on app
WITH dau AS(
  SELECT
    activity_date,
    sessoion_lenth_seconds,
    count(user_id) as da_users
  FROM
    sessions
  GROUP BY
    activity_date
)

SELECT 
    SUM(sessoion_lenth_seconds) / da_users AS avg_time_spent
FROM 
    dau
WHERE 
    activity_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)

--
WITH dau AS(
  SELECT
    activity_date,
    sessoion_lenth_seconds,
    count(DISTINCT user_id) as da_users
  FROM sessions
  GROUP BY activity_date
  ),

 rev AS(
  SELECT 
   user_id,
   activity_date,
   SUM(puchase_value) as revenue
  FROM inapp_purchase
  GROUP BY activity_date
 )

select 
    dau.activity_date,
    rev.revenue / dau.da_users
FROM dau
JOIN rev using (activity_date)
HAVING dau.activity_date > DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
-- monthly revenue


---
SELECT 
  activity_date,
  SUM(purchase_revenue) / COUNT(distinct user_id) as arppu
from
  inapp_purchase
GROUP BY 
  activity_date
HAVING activity_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)

--
SELECT
  activity_date,
  SUM(purchase_revenue) / COUNT(distinct user_id) as arppu
from
  inapp_purchase
GROUP BY
  activity_date
HAVING
  activity_date > DATE_SUB(CURDATE(), INTERVAL 1 YEAR)

--

SELECT
  activity_date,
  SUM(purchase_revenue) / COUNT(user_id) as conversion_rate
from
  inapp_purchase
GROUP BY
  activity_date
ORDER BY
  activity_date



  select
  date(g1.created_at) as dt,
  round(
    100 * count(distinct g2.user_id) / count(distinct g1.user_id)
  ) as retention
from
  gameplays as g1
  left join gameplays as g2 on g1.user_id = g2.user_id
  and date(g1.created_at) = date(datetime(g2.created_at, '-1 day'))
group by
  1
order by
  1
limit
  100;

  --
SELECT
  FIRST_week,
  SUM(CASE WHEN week_number = 0 THEN 1 ELSE 0 END) AS day_0,
  SUM(CASE WHEN week_number = 1 THEN 1 ELSE 0 END) AS day_1,
  SUM(CASE WHEN week_number = 2 THEN 1 ELSE 0 END) AS day_2,
  SUM(CASE WHEN week_number = 3 THEN 1 ELSE 0 END) AS day_3,
  SUM(CASE WHEN week_number = 4 THEN 1 ELSE 0 END) AS day_4,
  SUM(CASE WHEN week_number = 5 THEN 1 ELSE 0 END) AS day_5,
  SUM(CASE WHEN week_number = 6 THEN 1 ELSE 0 END) AS day_6,
  SUM(CASE WHEN week_number = 7 THEN 1 ELSE 0 END) AS day_7
FROM
  (
    WITH a AS(
      SELECT
        user_id,
        DAY(activity_date) as login_day
      from
        sessions
      GROUP BY
        user_id,
        day(acitivity_date)
    ),
    b as(
      SELECT
        user_id,
        MIN(DAY(activity_date)) as first_day
      from
        sessions
      GROUP BY
        user_id
    )
    SELECT
      a.user_id,
      a.login_day,
      b.first_day as first_day,
      a.login_day - first_day = day_num
    from
      a,
      b
    where
      a.user_id = b.user_id
  ) as wth_num
GROUP BY
  first_day
ORDER BY
  first_day;



-- 


