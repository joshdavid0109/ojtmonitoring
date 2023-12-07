
const mysql = require('mysql2');
const dotenv = require('dotenv');
const bcrypt = require('bcrypt'); // bcrypt library for password hashing
dotenv.config()

// uses pool instead of connection, instead of creating a brand new connection for each query,
// there will be a pool of connections that can be reused
const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
}).promise();

console.log('Database connection successful');

// fetches all details of students from student table
async function fetchStudents() {
    try {
        const [rows] = await pool.query("SELECT * FROM students");
        console.log('Fetch Students Query Result:', rows);
        return rows;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

//  fetches all details of pending students from interns table
async function fetchPendingStudents() {
    try {
        const [rows] = await pool.query(`
            SELECT s.studentid, s.studentName, s.course, c.companyname, c.companyaddress
            FROM interns i
            JOIN students s ON i.studentid = s.studentid
            JOIN company c ON i.companyid = c.companyid
            WHERE i.status = 'PENDING'
        `);
        console.log('Fetch Pending Students Query Result:', rows);
        return rows;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

async function fetchPendingStudentsByName() {
    try {
        const [rows] = await pool.query(`
            SELECT s.studentName, c.companyname, c.companyaddress
            FROM interns i
            JOIN students s ON i.studentid = s.studentid
            JOIN company c ON i.companyid = c.companyid
            WHERE i.status = 'PENDING'
            ORDER BY s.studentName;
        `);
        console.log('Fetch Pending Students Query Result:', rows);
        return rows;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

async function fetchPendingStudentsByCompany() {
    try {
        const [rows] = await pool.query(`
            SELECT s.studentName, c.companyname, c.companyaddress
            FROM interns i
            JOIN students s ON i.studentid = s.studentid
            JOIN company c ON i.companyid = c.companyid
            WHERE i.status = 'PENDING'
            ORDER BY c.companyname;
        `);
        console.log('Fetch Pending Students Query Result:', rows);
        return rows;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

async function fetchPendingStudentsByAddress() {
    try {
        const [rows] = await pool.query(`
            SELECT s.studentName, c.companyname, c.companyaddress
            FROM interns i
            JOIN students s ON i.studentid = s.studentid
            JOIN company c ON i.companyid = c.companyid
            WHERE i.status = 'PENDING'
            ORDER BY c.companyaddress;
        `);
        console.log('Fetch Pending Students Query Result:', rows);
        return rows;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}
// view by name:
// SELECT s.studentName, c.companyname, c.companyaddress
// FROM interns i
// JOIN students s ON i.studentid = s.studentid
// JOIN company c ON i.companyid = c.companyid
// WHERE i.status = 'PENDING'
// ORDER BY s.studentName;

// fetches a student's information from student table
async function fetchStudent(studentID) {
    try {
        const [rows] = await pool.query("SELECT * FROM students WHERE studentID = ?", [studentID]);
        return rows[0];
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

// updates the status in the interns table
async function updateStatus(studentID, newStatus) {
    try {
        const result = await pool.query('UPDATE interns SET status = ? WHERE studentid = ?', [newStatus, studentID]);
        console.log('Update Result:', result);
        return result;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

async function authenticateAdviser(adviserEmail, password) {
    try {
        const [rows] = await pool.query("SELECT adviserEmail, password FROM advisers WHERE adviserEmail = ? LIMIT 1", [adviserEmail]);

        if (rows.length === 1) {
            const adviser = rows[0];
            const hashedPasswordFromDatabase = adviser.password;

            // ccompare the provided password with the hashed password from the database
            const passwordMatch = await bcrypt.compare(password, hashedPasswordFromDatabase);

            if (passwordMatch) {
                return adviser;
            }
        }
        return null;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

async function fetchAdviser() {
    try {
        const [rows] = await pool.query("SELECT * FROM advisers where adviserEmail=? and password=?", ["jonathan.carter@example.com", "jon123"]);

        if (rows.length == 1) {
            const adviser = rows[0]
            console.log(adviser)
            return adviser
        }
        return null
    } catch (error) {
        console.error('Error executing qeury:', error.message);
        throw error;
    }
}


async function insertAnnouncement(sender, recipient, subject, announcement) {


    // Get the current date
    const now = new Date();

    // Format the date as YYYY-MM-DD
    const date = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;



    try {
        if (recipient.length == 1) {
            await pool.query("INSERT INTO announcements(date, senderid, recipientid, subject, message) values (?,?,?,?,?)", [date, sender, recipient[0], subject, announcement]);
        } else {
            for (let i = 0; i < recipient.length; i++) {
                if (recipient[i] == 0)
                    continue;
                const [rs] = await pool.query("select internid from interns i inner join students s on i.studentid = s.studentID where s.studentName = ?", [recipient[i]]);
                await pool.query("INSERT INTO announcements(date, senderid, recipientid, subject, message) values (?,?,?,?,?)", [date, sender, rs[0].internid, subject, announcement]);
            }
        }
    } catch (error) {
        console.error('Error executing qeury:', error.message);
        throw error;
    }
}



async function fetchAdviser() {
    try {
        const [rows] = await pool.query("SELECT * FROM advisers where adviserEmail=?", ["jonathan.carter@example.com"]);

        if (rows.length == 1) {
            const adviser = rows[0]
            console.log(adviser)
            return adviser
        }
        return null
    } catch (error) {
        console.error('Error executing qeury:', error.message);
        throw error;
    }
}

async function fetchSupervisor(supervisorId) {
    try {
        const [rows] = await pool.query("SELECT supervisorname FROM supervisors WHERE supervisorid = ?", [supervisorId]);

        if (rows.length === 1) {
            const supervisor = rows[0];
            console.log(supervisor);
            return supervisor;
        }
        return null;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}



async function fetchInterns() {
    try {
        const [rows] = await pool.query("SELECT *, CASE WHEN totalhours < 240 THEN 'ON GOING' WHEN totalhours = 240 THEN 'FINISHED' ELSE 'ON GOING' END AS 'status' FROM (SELECT studentname, companyname, companyaddress, totalhours  FROM students NATURAL JOIN interns INNER JOIN company ON interns.companyid = company.companyid) AS subquery")
        console.log('Fetch Interns Query Result:', rows);
        return rows;
    } catch (error) {
        console.error('Error executing qeury:', error.message);
        throw error;
    }
}

async function fetchAnnouncements(senderid) {
    try {
        const [rows] = await pool.query("SELECT a.date, a.recipientid, a.subject, a.message, CASE WHEN a.recipientid = 0 THEN 'All Students' ELSE s.studentName END AS studentName FROM announcements a LEFT JOIN interns i ON a.recipientid = i.internid LEFT JOIN students s ON i.studentID = s.studentid WHERE a.senderid = ? ORDER BY a.announcementid desc", [senderid]);

        // Reformat the date for each row
        const formattedRows = rows.map(row => {
            // Assuming row.date is a JavaScript Date object
            const formattedDate = `${String(row.date.getDate()).padStart(2, '0')}/${String(row.date.getMonth() + 1).padStart(2, '0')}/${row.date.getFullYear()}`;
            return {
                ...row,
                date: formattedDate
            };
        });

        return formattedRows;
    } catch (error) {
        console.error('Error executing qeury:', error.message);
        throw error;
    }
}

async function fetchDailyReports() {
    try {
        const [rows] = await pool.query(`
            SELECT 
            supervisorid, date, timeIn, timeOut, hours, workdescription, 
                verificationstatus, remark 
            FROM 
                dailyreports 
           
        `,);

        return rows;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}

async function fetchInternId(name) {
    try {
        const [rows] = await pool.query(`
            SELECT interns.internid
            FROM interns
            JOIN students ON interns.studentid = students.studentID
            WHERE students.studentName = ?
        `, [name]);

        return rows;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}
async function fetchInternDailyReports(internID) {
    try {
        const [rows] = await pool.query(`
            SELECT 
            supervisorid, date, timeIn, timeOut, hours, workdescription, 
                verificationstatus, remark 
            FROM 
                dailyreports 
            WHERE 
                internid = ?
        `, [internID]);

        return rows;
    } catch (error) {
        console.error('Error executing query:', error.message);
        throw error;
    }
}




async function hashAdviserPasswords() {
    try {

        const [rows] = await pool.query("SELECT adviserID, password FROM advisers");
        console.log('\nSERVER: Checking all paswords if hashed..');
        for (const adviser of rows) {
            const plaintextPasswordFromDatabase = adviser.password;

            // check if pass is hashed
            if (plaintextPasswordFromDatabase.startsWith("$2")) {
                console.log(`Skipping adviser with ID ${adviser.adviserID}: Password is already hashed.`);
                continue; //repeat the for loop
            }

            //hash the password
            const hashedPassword = await bcrypt.hash(plaintextPasswordFromDatabase, 10);

            // Update the hashed password in the database
            await pool.query("UPDATE advisers SET password = ? WHERE adviserID = ?", [hashedPassword, adviser.adviserID]);
            console.log(`Password for adviser ${adviser.adviserID} has been hashed.`);
        }

        console.log('\nSERVER: Password checking finished');
    } catch (error) {
        console.error('Error hashing adviser passwords:', error.message);
        throw error;
    }
}

async function closeDatabase() {
    await pool.end();
}



module.exports = {
    fetchStudents,
    fetchStudent,
    authenticateIntern,
    fetchPendingStudents,
    fetchPendingStudentsByName,
    fetchPendingStudentsByCompany,
    fetchPendingStudentsByAddress,
    updateStatus,
    authenticateAdviser,
    hashAdviserPasswords,
    fetchInterns,
    fetchAnnouncements,
    fetchAdviser,
    insertAnnouncement,
    authenticateAdviser,
    hashAdviserPasswords,
    insertAnnouncement, fetchDailyReports, fetchInternDailyReports,
    insertAnnouncement, fetchDailyReports, fetchInternDailyReports, fetchInternId,
    insertAnnouncement, fetchDailyReports, fetchInternDailyReports, fetchInternId, fetchSupervisor,
    closeDatabase,

};
