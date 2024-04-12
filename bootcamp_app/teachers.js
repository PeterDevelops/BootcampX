const { Pool } = require("pg");

const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx",
});

const queryString = `
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
JOIN teachers
ON assistance_requests.teacher_id = teachers.id
JOIN students
ON assistance_requests.student_id = students.id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher;
`;

const cohortName = process.argv[2];
const values = [`%${cohortName}%`];

pool.query(queryString, values)
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(
        `${user.cohort}: ${user.teacher}`
      );
    });
  })
  .catch((err) => console.error("query error", err.stack));