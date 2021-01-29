SELECT
  actor_id,
  director_id
FROM
  ActorDirector
GROUP BY
  actor_id,
  director_id
HAVING
  COUNT(*) >= 3; 

-- There is a stupid mistake that I used WHERE with group by...