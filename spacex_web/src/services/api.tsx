import axios from "axios";

const api = axios.create({
  baseURL: "https://api-spacex.herokuapp.com/api",
  timeout: 5000,
});

export default api;
