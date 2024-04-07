-- Select the cohort's name and the average assistance request time.
-- Get the average duration of assistance requests for each cohort.
-- Order the results from shortest average to longest.
SELECT cohorts.name as name, avg(assistance_requests.completed_at - assistance_requests.started_at) as average_assistance_time
FROM cohorts
JOIN students
ON cohorts.id = students.cohort_id
JOIN assistance_requests
ON students.id = assistance_requests.student_id
GROUP BY cohorts.name
ORDER BY average_assistance_time ASC;