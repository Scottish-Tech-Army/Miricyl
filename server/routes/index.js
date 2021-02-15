const { query } = require("express");
const express = require("express");
const axios = require("axios");
const db = require("../db");
const dotenv = require("dotenv");
const { Parser } = require('json2csv');
fs = require('fs');

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
        try {
          let url = `https://maps.googleapis.com/maps/api/place/details/json?place_id=${org.PlaceID}&fields=rating&key=${key}`;
          results = await axios.get(url).then((res) => {
            rating = res.data.result.rating;
            // console.log(org.OrgID, rating);
            if (rating) {
              const tempUpdate = { id: org.OrgID, GoogleRating: rating }
              updateDetails.push(tempUpdate)

              // const tempUpdate = { id: org.OrgID, GoogleRating: rating }
              // updateDetails.push(tempUpdate)
              // console.log('rating', rating);
            }
            return null
          });
          return null
        } catch (e) {
          console.log(e);
          console.log(org.OrgID);
          console.log(res.data.result.rating);
          res.sendStatus(500);
        }

      }
    })
    Promise.all(update).then((results) => {
      const json2csvParser = new Parser();
      const csv = json2csvParser.parse(updateDetails);
      fs.writeFile('ratings.csv', csv, function (err) {
        if (err) throw err;
        console.log('file saved');
        res.attachment('ratings.csv').send(csv)
      });
    })
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

module.exports = router;
