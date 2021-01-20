const axios = require("axios");
const { charities } = require("./db");

const updateObjects = (charities) => {
    const location = getLocation(charities)
    const googleRatings = getGoogleRatings(charities)
    const facebookRatings = getfacebookRatings(charities)

}

const getLocation = (cahrities) => {
    let locations = []
    charities.map((charity) => {
        const postcode = charity.postcode
        const id = charity.OrgID
        const url = `https://api.postcodes.io/postcodes/${postcode}`;
        const results = axios.get(url);
        console.log('results', results);
    })
}

module.exports = updateObjects;