const express = require('express');
const bodyParser = require('body-parser');
const dbConnection = require('./database-access.js');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors()); // enable cors for all routes (added this not sure how it works ;)

app.use(bodyParser.urlencoded({ extended: true }));

app.post('/login', (req, res) => {
    const { studentid, password } = req.body;
    const query = 'SELECT password FROM interns WHERE studentid = ? LIMIT 1';
    dbConnection.query(query, [studentid], (err, results) => {
        if (err) {
            console.error('Error:', err);
            res.status(500).send('Internal Server Error');
            return;
        }

        if (results.length === 1) {
            const storedPassword = results[0].password;

            if (password === storedPassword) {
                const message = 'Login successful';
                console.log('SERVER: yey');
                res.send(message);
            } else {
                // wrong pass
                res.status(401).send('Unauthorized');
            }
        } else {
            console.log('SERVER: Student not found');
            res.status(401).send('Unauthorized');
        }
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
