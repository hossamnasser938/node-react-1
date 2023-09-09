const express = require("express");

const app = express();

app.get("/api", (req, res) => {
  res.json({ message: "Hello from node server" });
});

const PORT = process.env.PORT || 3001;

app.listen(PORT, () => {
  console.log(`node server is listening on port ${PORT}`);
});
