const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("This is my express app for the Amazon Elastic Container Service (ECS) project");
});

app.get("/aboutme", (req, res) => {
  res.send("Greetings! I am Yash aka yasholo. \n Connect with me on linkedin: @yasholo and on Instagram: @yasholox");
});

app.listen(4000, () => {
  console.log("listening...");
});