const express = require('express');
const dbConnection = require('../ojt-monitoring-files/database-access.js');
const app = express();
const port = 3000;

app.get('/login', (req, res) => {
    const studentid = req.query.studentid;
    const password = req.query.password;


    const query = 'SELECT * FROM interns WHERE studentid = ? AND password = ?';
    dbConnection.query(query, [studentid, password], (err, results) => {
        if (err) {
            console.error('Error:', err);
            res.status(500).send('Internal Server Error');
            return;
        }
        if (results.length > 0) {
            const message = 'Login successful';
            console.log('SERVER: yey');
            res.send(message);
        } else {
            console.log('SERVER: u are not a student of the best university in the universe')
            res.status(401).send('Unauthorized');
        }
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
