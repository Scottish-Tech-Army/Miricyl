const mysql = require("mysql");
const express = require("express");
const app = express();
const dotenv = require('dotenv');
dotenv.config();

let development = process.env.NODE_ENV == "development";

if (development) {
  var pool = mysql.createPool({
    connectionLimit: 10,
    user: process.env.dbuser,
    password: process.env.dbpassword,
    database: "Miricyl",
    host: "localhost",
    port: "3306",
  });
} else {
  var pool = mysql.createPool({
    connectionLimit: 10,
    user: "__user__",
    password: "__password__",
    database: "__database__",
    host: "__host__",
    port: "3306",
    ssl: true
  });
}

let miricyldb = {};

miricyldb.needs = () => {
  return new Promise((resolve, reject) => {
    // pool.query(`SELECT * FROM Needs`, (err, results) => {
    pool.query(
      `SELECT distinct UserOption as Need FROM Needs where nullif(UserOption,'') is not null`,
      (err, results) => {
        if (err) {
          return reject(err);
        }

        return resolve(results);
      }
    );
  });
};

miricyldb.types = () => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT * FROM Type`, (err, results) => {
      if (err) {
        return reject(err);
      }

      return resolve(results);
    });
  });
};

miricyldb.personalisations = () => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT * FROM Personalisation`, (err, results) => {
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
  let splitTags = tags.split("£");
  splitTags.forEach((tag) => {
    finalTags.push(`${tag}`);
  });

  return new Promise((resolve, reject) => {
    pool.query(
      `SELECT * FROM ServiceDetails WHERE UserOption IN (?)`,
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
