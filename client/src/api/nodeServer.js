import axios from "axios";

let development = process.env.NODE_ENV == "development";

export default axios.create({
  baseURL: development ? "http://localhost:3000/api" : "__serverUrl__",
});
