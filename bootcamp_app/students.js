const { query } = require("express");
const { Pool } = require("pg");

const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx",
});

const queryString = `
SELECT students.name AS student_name, students.id AS student_id, cohorts.name AS cohort_name
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2
`;

const cohortName = process.argv[2];
const limit = process.argv[3];
const values = [`%${cohortName}%`, limit];

pool.query(queryString, values)
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(
        `${user.student_name} has an id of ${user.student_id} and was in the ${user.cohort_name} cohort`
      );
    });
  })
  .catch((err) => console.error("query error", err.stack));