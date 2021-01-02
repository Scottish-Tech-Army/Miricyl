const express = require("express");
const apiRouter = require("./routes");
const cors = require("cors");
const app = express();

app.use(express.json());
app.disable("x-powered-by");

// var allowedDomains = ['np-miricyl.azure-api.net', 'https://dev.miricyl.org/', 'http://localhost:3001', 'https://dem.miricyl.org/', 'https://np-miricyl.azure-api.net/dev/needs', 'https://np-miricyl.azure-api.net/dev/charities', 'https://np-miricyl.azure-api.net/dev/types', 'https://np-miricyl.azure-api.net/dev/personalisations'];
// app.use(cors({
//   origin: function (origin, callback) {
//     // bypass the requests with no origin (like curl requests, mobile apps, etc )
//     if (!origin) return callback(null, true);

//     if (allowedDomains.indexOf(origin) === -1) {
//       var msg = `This site ${origin} does not have an access. Only specific domains are allowed to access it.`;
//       return callback(new Error(msg), false);
//     }
//     return callback(null, true);
//   }
// }));

app.use(cors());
app.use("/api", apiRouter);


app.listen("3000", () => {
  console.log("server is running", process.env.NODE_ENV);
});