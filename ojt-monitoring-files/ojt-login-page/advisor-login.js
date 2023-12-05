
// Eventlistner for the login button
document.getElementById('loginForm').addEventListener('submit', async (event) => {
    event.preventDefault(); // prevent default form submissive ay submission
    // retrieve values from the input fields (html)
    const adviserEmail = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // send adviserEmail and password to boss man server baby
    try {
        const response = await fetch('http://localhost:8080/ojt-login-page', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `adviserEmail=${adviserEmail}&password=${password}`,
        });

        if (response.ok) {
            const data = await response.text();
            console.log('Login successful:', data);
        } else {
            throw new Error('Authentication failed');
        }
    } catch (error) {
        console.error('Error:', error);
    }
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

