-- Get all cohorts with 18 or more students.
-- Select the cohort name and the total students.
-- Order by total students from smallest to greatest.
SELECT cohorts.name AS cohorts_name, COUNT(students.*) AS student_count
FROM cohorts
JOIN students
ON students.cohort_id = cohorts.id
GROUP BY cohorts_name
HAVING COUNT(students.*) >= 18
ORDER BY student_count ASC;