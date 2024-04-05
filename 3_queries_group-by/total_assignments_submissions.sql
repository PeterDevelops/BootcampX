-- Select the cohort name and total submissions.
-- Get the total number of assignment submissions for each cohort.
-- Order the results from greatest to least submissions.
SELECT cohorts.name as cohort_name, count(assignment_submissions.*) as total_submissions
FROM cohorts
JOIN students
ON cohorts.id = students.cohort_id
JOIN assignment_submissions
ON students.id = assignment_submissions.student_id
GROUP BY cohort_name
ORDER BY total_submissions DESC;