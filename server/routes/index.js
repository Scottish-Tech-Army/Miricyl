const { query } = require("express");
const express = require("express");
const axios = require("axios");
const db = require("../db");
const dotenv = require("dotenv");

const createCharityObjects = require("../charityHelper");
dotenv.config();

const router = express.Router();
// import GoogleServer from "../api/GoogleServer"
router.get("/needs", async (req, res, next) => {
  try {
    let results = await db.needs();
    // let results = [{ Need: 'One' }, { Need: 'Two' }, { Need: 'Three' }];
    // console.log(results);
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

router.get("/v2/charities", async (req, res, next) => {
  try {
    let results = await db.charities();
    let organisations = await db.organisations();
    const objectsToReturn = createCharityObjects(results, organisations);
    res.json(objectsToReturn);
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

router.get("/googleratings/:id", async (req, res) => {
  let development = process.env.NODE_ENV == "development";
  let key = "";
  if (development) {
    key = process.env.googleapi;
  } else {
    key = __googleapitoken__;
  }
  try {
    let url = `https://maps.googleapis.com/maps/api/place/details/json?place_id=${req.params.id}&fields=rating&key=${key}`;
    let results = await axios.get(url);
    res.json(results.data.result);
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

router.get("/updates", async (req, res, next) => {

  try {
    var results = []
    let organisations = await db.organisationsTest();
    var updateDetails = []



    let update = organisations.map(async (org) => {
      key = process.env.googleapi

      if (org.PlaceID) {
        key = process.env.googleapi
        let url = `https://maps.googleapis.com/maps/api/place/details/json?place_id=${org.PlaceID}&fields=rating&key=${key}`;
        results = await axios.get(url).then((res) => {
          rating = res.data.result.rating;
          const tempUpdate = { id: org.OrgID, GoogleRating: rating }
          updateDetails.push(tempUpdate)
          console.log(updateDetails);
          return tempUpdate
        });
        // const tempUpdate = { id: org.OrgID, rating: results.rating }
        // updateDetails.push(tempUpdate)
        return null
      }
    })
    Promise.all(update).then((results) => {
      console.log('ud', updateDetails);
      console.log('res', results);
      res.json(updateDetails);
    })
    // res.json(updateDetails);
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

module.exports = router;
