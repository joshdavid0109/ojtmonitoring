const express = require('express');
const { fetchStudents } = require('./database.js');
const path = require('path');
const bodyParser = require('body-parser');


const app = express();
const port = 8080;

app.use(bodyParser.urlencoded({ extended: true }));

app.use('/ojt-images', express.static(path.join(__dirname, 'ojt-images')));
app.use('/ojt-login-page', express.static(path.join(__dirname, 'ojt-monitoring-files', 'ojt-login-page')));
app.use('/ojt-pending', express.static(path.join(__dirname, 'ojt-monitoring-files', 'ojt-pending')));

app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'ojt-monitoring-files'));

// Import the fetchStudents function from database.js
const { fetchStudent, authenticateIntern } = require('./database.js');


// run node app.js then access http://localhost:8080/ojt-login-page/
app.get("/ojt-login-page", async (req, res) => {
    try {
        const students = await fetchStudents();
        res.render('ojt-login-page/index', { students })
    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).send('Warning: Internal Server Error');
    }
});

// run node app.js then access http://localhost:8080/ojt-pending/
app.get("/ojt-pending", async (req, res) => {
    try {
        const students = await fetchStudents();
        res.render('ojt-pending/index', { students })
    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).send('Warning: Internal Server Error');
    }
});

// handling of the post requst (authenticating intern in login)
app.post("/ojt-login-page", async (req, res) => {
    const { studentid, password } = req.body;

    try {
        const intern = await authenticateIntern(studentid, password);

        if (intern) {
            console.log('SERVER: Intern authenticated');
            //res.redirect('/ojt-pending');
        } else {
            console.log('SERVER: NOT AN INTERN CALL POLICE');
            res.status(401).send('Authentication failed');
        }

    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).send('Warning: Internal Server Error');
    }
});


app.listen(8080, () => {
    console.log(`Server is running at port ${port}`);
});
