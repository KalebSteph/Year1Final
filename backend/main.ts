import express from "npm:express";
import cors from 'npm:cors';
import mysql from "npm:mysql2"

const app = express() 
app.use(cors())
// app.use

const connection = mysql.createConnection({
  host: "localhost", 
  user: "web", 
  password: "AGoodPassword",
  database: "SimplyData"
})

connection.connect((err)=> {
  if(err) console.log(err);
})

connection.query("SELECT * FROM Players", (err, results) => {
  if(err) throw err
  console.log(results);
})



