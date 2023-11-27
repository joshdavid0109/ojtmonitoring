// THIS IS FOR MANUALLY HASHING STRING INPUTSS (to run just node hash.js IN CMD)



const bcrypt = require('bcrypt');
const saltRounds = 10; // usual salt rounds used in the algorithm is 10

function hashPassword(passwordNiMartel) {
    return new Promise((resolve, reject) => {
        bcrypt.hash(passwordNiMartel, saltRounds, (err, hashedPassword) => {
            if (err) {
                reject(err);
            } else {
                resolve(hashedPassword);
            }
        });
    });
}


const passwordNiMartel = 'intern2pass'; // change password here

hashPassword(passwordNiMartel)
    .then((hashedPassword) => {
        console.log('Hashed Password:', hashedPassword);

    })
    .catch((error) => {
        console.error('Error hashing password:', error);
    });