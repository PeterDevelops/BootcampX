-- Select the teacher's name, student's name, assignment's name if it has one, and the duration of each assistance request.
-- Get important data about each assistance request.
-- Subtract completed_at by started_at to find the duration.
-- Order by the duration of the request.
SELECT teachers.name as teacher, students.name as student,
assignments.name as assignment, (completed_at - started_at) as duration
FROM assistance_requests
JOIN teachers
ON assistance_requests.teacher_id = teachers.id
JOIN students
ON assistance_requests.student_id = students.id
JOIN assignments
ON assistance_requests.assignment_id = assignments.id
ORDER BY duration;