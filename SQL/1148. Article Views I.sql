SELECT
  author_id as Id
FROM
  views
WHERE
  author_id = viewer_id
ORDER BY
  author_id