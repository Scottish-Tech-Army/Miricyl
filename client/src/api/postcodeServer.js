import axios from "axios";

export default axios.create({
  baseURL:
    "https://api.postcodes.io/postcodes",
});
