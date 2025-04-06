import express from "express";
import http from "http";

const app = express();
const server = http.createServer(app);
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello World!");
});


server.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
