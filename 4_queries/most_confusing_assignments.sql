-- Select the assignment's id, day, chapter, name and the total assistances.
-- List each assignment with the total number of assistance requests with it.
-- Order by total assistances in order of most to least.
SELECT assignments.id AS id, assignments.name AS name,
assignments.day AS day, assignments.chapter AS chapter, COUNT(*) AS total_requests
FROM assistance_requests
JOIN assignments
ON assistance_requests.assignment_id = assignments.id
GROUP BY assignments.id, assignments.name, assignments.day, assignments.chapter
ORDER BY total_requests DESC;