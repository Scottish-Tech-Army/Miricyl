
const { query } = require("express");
const express = require("express");
const axios = require("axios")
const db = require("../db");
const dotenv = require('dotenv');
dotenv.config();

const router = express.Router();
// import GoogleServer from "../api/GoogleServer"
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

router.get("/googleratings/:id", async (req, res) => {
  let development = process.env.NODE_ENV == "development";
  let key = ""
  if (development) {
    key = process.env.googleapi
  } else {
    key = __googleapitoken__
  };
  try {
    let url = `https://maps.googleapis.com/maps/api/place/details/json?place_id=${req.params.id}&fields=rating&key=${key}`
    let results = await axios.get(url)
    res.json(results.data.result)
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }

})

module.exports = router;
