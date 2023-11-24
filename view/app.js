const express = require('express');
const bodyParse = require('body-parser');
const fileUpload = require('express-fileupload');
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ojt'
})

connection.connect((err) => {
    if (err)
        throw err;
    console.log('Connected');
})

let query = 'SELECT * from students';

connection.query(query, (error, results, fields) => {
    if (error)
        return console.error(error.message);

    console.log(results);
})

connection.end();


