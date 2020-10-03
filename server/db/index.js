const mysql = require("mysql");

const pool = mysql.createPool({
  connectionLimit: 10,
  user: "root",
  password: "example",
  database: "Miricyl",
  host: "localhost",
  port: "3306",
});

let miricyldb = {};

miricyldb.needs = () => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT * FROM Needs`, (err, results) => {
      if (err) {
        return reject(err);
      }

      return resolve(results);
    });
  });
};

miricyldb.charities = () => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT * FROM ServiceDetails`, (err, results) => {
      if (err) {
        return reject(err);
      }

      return resolve(results);
    });
  });
};

miricyldb.charitySelect = (tags) => {
  let finalResults = [];
  let finalTags = [];
  let splitTags = tags.split(",");
  splitTags.forEach((tag) => {
    finalTags.push(tag);
  });

  return new Promise((resolve, reject) => {
    pool.query(
      `SELECT * FROM ServiceDetails WHERE Needs IN (?)`,
      [finalTags],
      (err, results) => {
        if (err) {
          return reject(err);
        }

        return resolve(results);
      }
    );
  });
};

module.exports = miricyldb;
