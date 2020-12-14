import axios from "axios";

let development = process.env.NODE_ENV === "development";


export default axios.create({
  baseURL: development ? "http://localhost:3000/api" : "__serverUrl__",
  headers: {
    'Ocp-Apim-Subscription-Key': '__serverapikey__'
  }
});
