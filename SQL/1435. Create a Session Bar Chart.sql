-- Bin chart in SQL

/* 
step 1: Categorising each group in a table
step 2: Create the bins table
stpe 3: Union or join these two tables

** IN this case, I use CTE to create two tables
*/
WITH  category AS(
    SELECT session_id, duration,
    CASE WHEN duration / 60 < 5 THEN '[0-5>'
         WHEN duration / 60 >= 5 and duration / 60 < 10 THEN '[5-10>'
         WHEN duration / 60 >= 10 and duration / 60 < 15 THEN '[10-15>'
         ELSE '15 or more'
    END AS bin
    FROM sessions
),

bins as (
    SELECT '[0-5>' AS BIN
    UNION 
    SELECT '[5-10>' AS BIN
    UNION
    SELECT '[10-15>' AS BIN
    UNION
    SELECT '15 or more' AS BIN
)

SELECT b.bin, IFNULL(COUNT(cate.session_id), 0) AS TOTAL
FROM 
    bins as b
LEFT JOIN category cate on cate.bin = b.bin
GROUP BY b.bin;
 

--  Others' solution
select
  a.bin,
  count(b.bin) as total
from
  (
    select
      '[0-5>' as bin
    union
    select
      '[5-10>' as bin
    union
    select
      '[10-15>' as bin
    union
    select
      '15 or more' as bin
  ) a
  left join (
    select
      case
        when duration < 300 then '[0-5>'
        when duration >= 300
        and duration < 600 then '[5-10>'
        when duration >= 600
        and duration < 900 then '[10-15>'
        else '15 or more'
      end bin
    from
      Sessions
  ) b on a.bin = b.bin
group by
  
--   a.bin 作 者 ： nei - zang - mei - liao 链 接 ： https: / / leetcode - cn.com / problems / create - a - session - bar - chart / solution / meng - xin - jie - fa - unionjian - li - xin - biao - ran - hou - left / 来 源 ： 力 扣 （ LeetCode ） 著 作 权 归 作 者 所 有 。 商 业 转 载 请 联 系 作 者 获 得 授 权 ， 非 商 业 转 载 请 注 明 出 处 。