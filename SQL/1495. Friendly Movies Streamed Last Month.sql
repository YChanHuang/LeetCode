# Write your MySQL query statement below
SELECT
  distinct title
FROM
  content c
  join TVprogram t on c.content_id = t.content_id
where
  c.kids_content = 1
  and c.content_type = 'Movies'
  and YEAR(t.program_date) = 2020
  and MONTH(t.program_date) = 6