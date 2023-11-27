const express = require('express');
const { fetchStudents } = require('./database.js');
const path = require('path')

const app = express();
const port = 8080;

app.use(express.static(path.join(__dirname, 'ojt-monitoring-files', 'ojt-pending')));
app.use('/ojt-images', express.static(path.join(__dirname, 'ojt-images')));

app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'ojt-monitoring-files', 'ojt-pending'));




// run node app.js then access http://localhost:8080/ojt-pending/
app.get("/ojt-pending", async (req, res) => {
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







