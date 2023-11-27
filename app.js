const express = require('express');
const { fetchStudents } = require('./database.js');

const app = express();

app.get("/", async (req, res) => {
    try {
        const students = await fetchStudents();
        res.send(students);
        
    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).send('Internal Server Error');
    }
})

app.listen(8080, () => {
    console.log('Server is running at port 8080')
})







