-- Select the cohort's name and the total duration the assistance requests.
-- Get the total duration of all assistance requests for each cohort.
-- Order by total_duration.
-- Look at the ERD to see how to join the tables.
SELECT cohorts.name as cohort, sum(assistance_requests.completed_at - assistance_requests.started_at) as total_duration
FROM cohorts
JOIN students
ON cohorts.id = students.cohort_id
JOIN assistance_requests
ON students.id = assistance_requests.student_id
GROUP BY cohorts.name
ORDER BY total_duration;