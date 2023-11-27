
const mysql = require('mysql2');
const dotenv = require('dotenv');
const bcrypt = require('bcrypt'); // bcrypt library for password hashing
dotenv.config()

// uses pool instead of connection, instead of creating a brand new connection for each query,
// there will be a pool of connections that can be reused
const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
}).promise();

console.log('Database connection successful');

// fetches all details of students table
async function fetchStudents() {
    try {
        const [rows] = await pool.query("SELECT * FROM students");
        console.log('Fetch Students Query Result:', rows);
        return rows;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

async function fetchStudent(studentID) {
    try {
        const [rows] = await pool.query("SELECT * FROM students WHERE studentID = ?", [studentID]);
        return rows[0];
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

async function authenticateIntern(studentID, password) {
    try {
        const [rows] = await pool.query("SELECT studentid, password FROM interns WHERE studentid = ? LIMIT 1", [studentID]);

        if (rows.length === 1) {
            const intern = rows[0];
            const hashedPasswordFromDatabase = intern.password;

            // ccompare the provided password with the hashed password from the database
            const passwordMatch = await bcrypt.compare(password, hashedPasswordFromDatabase);

            if (passwordMatch) {

                return intern;
            }
        }
        return null;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}


async function closeDatabase() {
    await pool.end();
}

module.exports = {
    fetchStudents,
    fetchStudent,
    authenticateIntern,
    closeDatabase,
};
