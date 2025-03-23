import config from '../config.json';

window.addEventListener('load', function () {

    const registerButton = document.getElementById('register-button');
    const registerEmail = document.getElementById('register-email');
    const registerPassword = document.getElementById('register-password');
    const registerError = document.getElementById('register-error');
    const registerForm = document.getElementById('register-form');

    registerForm.addEventListener('submit', async function (event) {
        event.preventDefault();
        registerError.innerHTML = '';
        registerButton.disabled = true;
        const email = registerEmail.value;
        const password = registerPassword.value;
        if (email && password) {
            const req = await fetch(`${config.apiURL}register`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ email, password })
            }).catch(error => {
                registerError.innerHTML = 'Server error';
            });
            if (req.status === 200) {
                const res = await req.json();
                if (res.error) {
                    registerError.innerHTML = res.error;
                } else {
                    window.location.href = '/login';
                }
            } else {
                registerError.innerHTML = 'Server error';
            }

        } else {
            registerError.innerHTML = 'Please fill in all fields';
        }
        registerButton.disabled = false;
    });
});