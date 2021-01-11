WITH a AS(
  SELECT
    *
  FROM
    activity
  WHERE
    activity_type = 'start'
),
b as(
  SELECT
    *
  FROM
    activity
  WHERE
    activity_type = 'end'
)
SELECT
  a.machine_id,
  ROUND(AVG(b.timestamp - a.timestamp), 3) as processing_time
FROM
  a,
  b
WHERE
  a.machine_id = b.machine_id
  and a.process_id = b.process_id
GROUP BY
  a.machine_id
ORDER BY
  a.machine_id