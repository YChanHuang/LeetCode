SELECT a.student_id, a.student_name, b.subject_name, count(e.subject_name) as attended_exams
FROM students a CROSS JOIN subjects b
    LEFT JOIN Examinations e on e.student_id = a.student_id
    AND b.subject_name = e.subject_name
GROUP BY a.student_id, b.subject_name
ORDER BY a.student_id, b.subject_name