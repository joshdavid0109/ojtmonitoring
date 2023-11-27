
import mysql from 'mysql2';
import dotenv from 'dotenv';

dotenv.config()
const port = process.env.PORT;

// Uses pool instead of connection, instead of creating a brand new connection for each query,
// there will be a pool of connections that can be reused
const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
}).promise();

// Fetching all details of students table
export async function fetchStudents() {
  try {
    const [rows] = await pool.query("SELECT * FROM students");
    console.log([rows]); 
    return rows;
  } catch (error) {
    console.error('Error executing query:', error.message);
  } finally {
    pool.end();
  }
}

export async function fetchStudent(studentID) {
    try {
        const [rows] = await pool.query(`
     SELECT *
     FROM students
     WHERE studentID = ?
     `, [studentID]);
        console.log(rows);
        return rows[0];
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

fetchStudents()
