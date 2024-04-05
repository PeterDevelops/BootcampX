-- Select the student's name and the total assistance requests.
-- Get the total number of assistance_requests for a student.
-- Since this query needs to work with any specific student name, use 'Elliot Dickinson' for the student's name here.
SELECT count(assistance_requests.*) as total_assistances, students.name as name
FROM students
JOIN assistance_requests
ON students.id = assistance_requests.student_id -- connects student id(PK) to assistance request(FK)
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;