import config from '../config.json';

window.addEventListener('load', function () {
    const loginButton = document.getElementById('login-button');
    const loginEmail = document.getElementById('login-email');
    const loginPassword = document.getElementById('login-password');
    const loginError = document.getElementById('login-error');
    const loginForm = document.getElementById('login-form');


    loginForm.addEventListener('submit', async function (event) {
        event.preventDefault();
        loginError.innerHTML = '';
        loginButton.disabled = true;
        const email = loginEmail.value;
        const password = loginPassword.value;
        if (email && password) {
            const req = await fetch(`${config.apiURL}login`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ email, password })
            }).catch(error => {
                loginError.innerHTML = 'Server error';
            });
            if (req.status === 200) {
                const res = await req.json();
                if (res.error) {
                    loginError.innerHTML = res.error;
                } else {
                    window.location.href = '/dashboard';
                }
            } else {
                loginError.innerHTML = 'Server error';
            }

        } else {
            loginError.innerHTML = 'Please fill in all fields';
        }
        loginButton.disabled = false;
    });
});