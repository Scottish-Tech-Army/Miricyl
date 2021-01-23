const express = require("express");
const apiRouter = require("./routes");
const cors = require("cors");
const app = express();
app.use(express.json());
app.disable("x-powered-by");

let development = process.env.NODE_ENV == "development";

var corsOptions = {}

if (development) {
  corsOptions = {
    origin: 'http://localhost:3001',
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
  }

} else {
  corsOptions = {
    origin: 'https://__env__.miricyl.org',
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
  }
}

console.log(corsOptions);
app.use(cors(corsOptions));
app.use("/api", apiRouter);


app.listen("3000", () => {
  console.log("server is running", process.env.NODE_ENV);
});