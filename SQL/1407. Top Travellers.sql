SELECT
  u.name,
  IFNULL(SUM(r.distance), 0) as travelled_distance
FROM
  users as u
  LEFT JOIN Rides AS r on u.id = r.user_id
GROUP BY
  user_id
ORDER BY
  travelled_distance DESC,
  u.name asc