import express from "npm:express";
import cors from "npm:cors";
import mysql from "npm:mysql2";

const app = express();
app.use(cors());

// Create MySQL connection
const connection = mysql.createConnection({
  host: "localhost",
  user: "web",
  password: "AGoodPassword",
  database: "SimplyData",
});

// Connect to MySQL
connection.connect((err) => {
  if (err) {
    console.error("Database connection failed:", err);
    return;
  }
  console.log("Connected to MySQL database");
});

// API route to fetch Players table
app.get("/players", (request, response) => {
  connection.query("SELECT * FROM Players", (err, results) => {
    if (err) {
      console.error("Error fetching players:", err);
      return response.status(500).send("Error retrieving players");
    }
    response.json(results);
  });
});

// Start the server
app.listen(3005, () => {
  console.log("Listening on port 3005");
});
