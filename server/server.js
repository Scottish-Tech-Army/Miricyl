const express = require("express");
const apiRouter = require("./routes");
const cors = require("cors");
const app = express();
app.use(express.json());
app.disable("x-powered-by");

let development = process.env.NODE_ENV == "development";

var corsOptions = {}
// test
if (development) {
  corsOptions = {
    origin: 'http://localhost',
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
  }

} else {
  corsOptions = {
    origin: "__env__",
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
  }
}


console.log(corsOptions);
app.use(cors());
// app.use(cors(corsOptions));
app.use("/api", apiRouter);


app.listen("3000", () => {
  console.log("server is running", process.env.NODE_ENV);
});