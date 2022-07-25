const mysql = require("mysql2");

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "Jcaimen93.",
  database: "gymdb",
});

module.exports = pool.promise();
