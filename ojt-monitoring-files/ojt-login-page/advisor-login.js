console.log('hello baby')


document.getElementById('loginForm').addEventListener('click', (event) => {
    event.preventDefault(); // pribent default form submision

    // tetrieve values from the input fields
    const studentid = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // send the studentid and password to the server for authentication using GET method
    fetch('http://ojtmonitoring:3000/login?studentid=' + studentid + '&password=' + password) // it works pero may error sa console x_x will fix tomrrow
        .then(response => {
            if (response.ok) {

                return response.text();
            } else {

                throw new Error('Authentication failed');
            }
        })
        .then(data => {
            console.log('Login successful:', data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
});


// show password function
function showPasswordToggle() {
    const passwordInput = document.getElementById('password');
    const showPasswordCheckbox = document.getElementById('showPasswordCheckbox');

    showPasswordCheckbox.addEventListener('change', function () {
        passwordInput.type = this.checked ? 'text' : 'password';
    });
}

showPasswordToggle();