-- Get the total amount of time that a student has spent on all assignments.
-- This should work for any student but use 'Ibrahim Schimmel' for now.
-- Select only the total amount of time as a single column.
SELECT SUM(duration) AS total_duration
FROM students -- selects our students table
JOIN assignment_submissions ON student_id = students.id
WHERE students.name = 'Ibrahim Schimmel';
