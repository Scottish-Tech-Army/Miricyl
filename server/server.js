const express = require("express");
const apiRouter = require("./routes");
const cors = require("cors");
const app = express();

app.use(express.json());
app.disable("x-powered-by");
app.use("/api", apiRouter);
app.use(cors());

app.listen("3000", () => {
});
