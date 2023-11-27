const express = require('express');
const bodyParse = require('body-parser');
const fileUpload = require('express-fileupload');
const mysql = require('mysql');
const pug = require('pug');
const app = express();

app.set('view engine', 'pug')
app.use(express.static('public'))

app.get('/', (req, res) => {

    res.render(
        'indexpug',
        { title : 'intern list', message: 'intern list'}
    )
})

app.listen(3000);


// const connection = mysql.createConnection({
//     host: 'localhost',
//     user: 'root',
//     password: '',
//     database: 'ojt_with-data'
// })



// connection.connect((err) => {
//     if (err)
//         throw err;
//     console.log('Connected');
// })



// let query = 'SELECT * from students';

// connection.query(query, (error, results, fields) => {
//     if (error)
//         return console.error(error.message);

//     console.log(results);
// })

// connection.end();



