const express = require('express');
const bodyParser = require('body-parser');
const dbConnection = require('./database-access.js');
const cors = require('cors');
const bcrypt = require('bcrypt'); // Import the bcrypt library

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));

app.post('/login', (req, res) => {
    const { studentid, password } = req.body;
    const query = 'SELECT password FROM interns WHERE studentid = ? LIMIT 1';
    dbConnection.query(query, [studentid], async (err, results) => {
        if (err) {
            console.error('Error:', err);
            res.status(500).send('Internal Server Error');
            return;
        }

        if (results.length === 1) {
            const storedPassword = results[0].password;

            // Compare the plain-text password with the hashed password
            const passwordMatch = await bcrypt.compare(password, storedPassword);

            if (passwordMatch) {
                const message = 'Login successful';
                console.log('SERVER: yey');
                res.send(message);
            } else {
                // Wrong password
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
