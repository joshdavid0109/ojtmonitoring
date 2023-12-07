const express = require('express');
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

// Import functions from database.js
const { fetchStudent, authenticateAdviser, hashAdviserPasswords, fetchInternId } = require('./database.js');
const { fetchAdviser, fetchInterns, insertAnnouncement, fetchAnnouncements } = require('./database.js');
const { fetchStudents, fetchPendingStudents, fetchPendingStudentsByName, fetchPendingStudentsByAddress, fetchPendingStudentsByCompany, updateStatus, fetchInternDailyReports } = require('./database.js');

//GET GET

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

app.get("/ojt-dashboard", async (req, res) => {
    try {
        const adviser = await fetchAdviser();
        const interns = await fetchInterns();
        let pendingcount = 0, total = interns.length, finished = 0;

        for (let i = 0; i < interns.length; i++) {
            let intern = interns[i];
            switch (intern.status) {
                case 'ON GOING':
                    pendingcount++;
                    break;
                case 'FINISHED':
                    finished++;
                    break;
            }
        }

        reports = {} // temporarry still doing

        const announcements = await fetchAnnouncements(adviser.adviserID)

        res.render('ojt-dashboard/index', {
            adviser,
            interns,
            announcements,
            pendingcount,
            finished,
            reports,
            total
        });
    } catch (error) {
        console.error('Error', error);
        res.status(500).send("Warning: Internal Server Error");
    }
});

app.get("/ojt-dashboard/daily-reports/:internName", async (req, res) => {
    try {
        const internName = req.params.internName;
        console.log('Fetching reports for intern:', internName);

        // Fetch the intern ID
        const internIdResult = await fetchInternId(internName);

        // Assuming fetchInternId returns an array of rows, and we need the first row
        const internId = internIdResult[0]?.internid;
        if (!internId) {
            console.log('No intern found for name:', internName);
            return res.status(404).send("Intern not found");
        }

        console.log(internId + ' is ' + internName);

        // Fetch the reports using the intern ID
        const reports = await fetchInternDailyReports(internId);
        console.log('Reports:', reports);

        res.render('ojt-dashboard/views/intern-reports.pug', { reports });
    } catch (error) {
        console.error('Error', error);
        res.status(500).send("Error: Internal Server Error");
    }
});

// run node app.js then access http://localhost:8080/ojt-pending/
app.get("/ojt-pending", async (req, res) => {
    try {
        const adviser = await fetchAdviser();
        const students = await fetchStudents();
        const pendingStudents = await fetchPendingStudents();
        res.render('ojt-pending/index', { adviser, students, pendingStudents })
    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).send('Warning: Internal Server Error');
    }
});
app.get('/ojt-pending/sort', async (req, res) => {
    const sortBy = req.query.sortBy;

    try {
        let pendingStudents;

        // Implement sorting logic based on the selected option (sortBy)
        switch (sortBy) {
            case 'name':
                pendingStudents = await fetchPendingStudentsByName();
                break;
            case 'company':
                pendingStudents = await fetchPendingStudentsByCompany();
                break;
            case 'address':
                pendingStudents = await fetchPendingStudentsByAddress();
                break;
            default:
                pendingStudents = await fetchPendingStudents();
        }

        // Send the sorted data as a JSON response
        res.json(pendingStudents);
    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


//POST REQUESTS


// Update the '/update-status' route in ojt-pending-page
app.post('/update-status', async (req, res) => {
    const { studentId, newStatus } = req.body;

    console.log('Received Update Request - Student ID:', studentId, 'New Status:', newStatus);

    try {
        await updateStatus(studentId, newStatus);
        res.send('Status updated successfully');
    } catch (error) {
        console.error('Error updating status:', error.message);
        res.status(500).send('Warning: Internal Server Error');
    }
});


// handling of the post requst (authenticating advisor in login)
app.post("/ojt-login-page", async (req, res) => {
    const { adviserEmail, password } = req.body;

    try {
        const adviser = await authenticateAdviser(adviserEmail, password);
        if (adviser) {
            console.log('SERVER: LOGGING IN email = ' + adviserEmail + ' ' + 'password = ' + password)
            /*  res.cookie('adviserEmail', adviserEmail, { httpOnly: true });
              res.cookie('adviserPassword', adviserEmail, { httpOnly: true });
              */
            res.redirect('/ojt-dashboard');
        } else {
            console.log('SERVER: NOT AN ADVISER = email = ' + adviserEmail + ' ' + 'password = ' + password)
        }

    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).send('Warning: Internal Server Error');
    }
});


app.post('/ojt-dashboard/postannouncement', async (req, res) => {
    const sender = req.body['sender'];
    const recipient = req.body.recipient;
    const subject = req.body['subject-text'];
    const description = req.body['description-text'];
    console.log(sender);
    console.log(recipient)
    console.log(subject);

    // Handle your data here (e.g., save to database, process, etc.)
    insertAnnouncement(sender, recipient, subject, description);
    res.redirect('/ojt-dashboard');
});

hashAdviserPasswords().then(() => {
    app.listen(8080, () => {
        console.log(`Server is running at port ${port}`);
    });
});
