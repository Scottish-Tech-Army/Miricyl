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

router.get("/charities", async (req, res, next) => {
  var tags = req.query.tags;
  if (!req.query.tags) {
    console.log("no tags", tags);
    try {
      let results = await db.charities();
      res.json(results);
    } catch (e) {
      console.log(e);
      res.sendStatus(500);
    }
  } else {
    console.log("got tags", tags);
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
