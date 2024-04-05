-- Select the name of the student, their average completion time, and the average suggested completion time.
-- Only get currently enrolled students.
-- Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.
-- Order by average completion time from smallest to largest.
-- This will require data from students, assignment_submissions, and assignments.
SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students -- start at students table
JOIN assignment_submissions -- JOIN students table to assignment_submissions
ON students.id = assignment_submissions.student_id -- the common denominator to connect the tables
JOIN assignments -- joins assignments to assignment_submissions
ON assignment_submissions.assignment_id = assignments.id -- connects through the assignment ids
WHERE students.end_date IS NULL -- only selects students whos end date is null (not graduated yet)
GROUP BY students.name -- group the averages by the students
HAVING avg(assignment_submissions.duration) < avg(assignments.duration) -- only selects students whos average submission is less than the given duration
ORDER BY avg(assignment_submissions.duration) ASC; -- order the completion assignments by smallest to largest