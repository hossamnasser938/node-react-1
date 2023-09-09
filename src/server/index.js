const express = require("express");
const path = require("path");

const app = express();

app.use(express.static(path.resolve(__dirname, "../client/build")));

app.get("/api", (req, res) => {
  res.json({ message: "Hello from node server" });
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`node server is listening on port ${PORT}`);
});
