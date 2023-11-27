const express = require('express');
const { fetchStudents } = require('./database.js');

const app = express();
const port = 8080;

app.set('view engine', 'pug');
app.set('views', './ojt-monitoring-files/ojt-pending');

app.get("/", async (req, res) => {
    try {
        const students = await fetchStudents();
        res.render('index', {students})
        // res.send(students);   
    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).send('Warning: Internal Server Error');
    }
})

app.listen(8080, () => {
    console.log(`Server is running at port ${port}`);
})







