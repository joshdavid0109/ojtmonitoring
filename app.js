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
app.use('/ojt-dashboard', express.static(path.join(__dirname, 'ojt-monitoring-files', 'ojt-dashboard')))

app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'ojt-monitoring-files'));

// Import the fetchStudents function from database.js
const { fetchStudent, authenticateIntern } = require('./database.js');
const { fetchAdviser, fetchInterns, insertAnnouncement} = require('./database.js');


app.get("/ojt-dashboard", async(req, res) => {
    try {
        const adviser = await fetchAdviser();
        // console.log(adviser)
        const interns = await fetchInterns();
        let pendingcount = 0, total = interns.length, finished = 0;

        for (let i = 0; i < interns.length; i++) {
            let intern = interns[i];
            switch(intern.status) {
                case 'ON GOING':
                    pendingcount++;
                    break;
                case 'FINISHED':
                    finished++;
                    break;
            }
        }

        res.render('ojt-dashboard/index', {adviser, interns, pendingcount: pendingcount, finished: finished, total: total});
    } catch (error) {
        console.error('Error', error);
        res.status(500).send("Warning: Internal Server Error")
    }
})

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

app.post('/ojt-dashboard/postannouncement', (req, res) => {
    const sender = req.body['sender'];
    const recipient = req.body['recipient']
    const subject = req.body['subject-text'];
    const description = req.body['description-text'];
    console.log(sender);
    console.log(recipient)
    console.log(subject);

    // Handle your data here (e.g., save to database, process, etc.)
    insertAnnouncement(sender, recipient, subject, description);
    res.redirect('/ojt-pending');
});


app.listen(8080, () => {
    console.log(`Server is running at port ${port}`);
});
