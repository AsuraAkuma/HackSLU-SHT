import config from './config.json' with {type: "json"};

window.addEventListener('load', function () {

    const registerButton = document.getElementById('register-button');
    const registerError = document.getElementById('register-error');
    const registerForm = document.getElementById('registerForm');

    registerForm.addEventListener('submit', async function (event) {
        event.preventDefault();
        registerError.innerHTML = '';
        registerButton.disabled = true;
        const formData = new FormData(registerForm);
        const email = formData.get('email');
        const registerPassword1 = formData.get('password');
        const registerPassword2 = formData.get('confirmPassword');
        const username = formData.get('username');
        if (email && (registerPassword1 === registerPassword2)) {
            const req = await fetch(`${config.apiURL}/signup`, {
                method: 'POST',
                mode: "cors",
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ email, password: registerPassword1, username })
            }).catch(error => {
                registerError.innerHTML = error;
            });
            if (req.status === 200) {
                const res = await req.json();
                if (res.error) {
                    registerError.innerHTML = res.error;
                } else {
                    window.location.href = '/login';
                }
            } else {
                registerError.innerHTML = "Server error";
            }

        } else {
            registerError.innerHTML = 'Please fill in all fields correctly';
        }
        registerButton.disabled = false;
    });
});