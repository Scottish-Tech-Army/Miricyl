const express = require("express");
const apiRouter = require("./routes");
const cors = require("cors");
const app = express();

app.use(express.json());
app.use(cors());
app.use("/api", apiRouter);
app.use(cors());

app.listen("3000", () => {
  console.log("server is running", process.env.NODE_ENV);
});
