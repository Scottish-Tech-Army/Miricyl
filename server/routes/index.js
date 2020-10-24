const { query } = require("express");
const express = require("express");
const db = require("../db");

const router = express.Router();

router.get("/needs", async (req, res, next) => {
  try {
    let results = await db.needs();
    res.json(results);
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

router.get("/types", async (req, res, next) => {
  try {
    let results = await db.types();
    res.json(results);
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

router.get("/personalisations", async (req, res, next) => {
  try {
    let results = await db.personalisations();
    res.json(results);
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

router.get("/charities", async (req, res, next) => {
  var tags = req.query.tags;
  if (!req.query.tags) {
    try {
      let results = await db.charities();
      res.json(results);
    } catch (e) {
      console.log(e);
      res.sendStatus(500);
    }
  } else {
    try {
      let results = await db.charitySelect(tags);
      res.json(results);
    } catch (e) {
      console.log(e);
      res.sendStatus(500);
    }
  }
});

module.exports = router;
