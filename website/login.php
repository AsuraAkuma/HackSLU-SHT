<?php
// Turn on error reporting.
error_reporting(E_ALL);
ini_set('display_errors', '1');

session_start();

function getValue($key)
{
    return isset($_POST[$key]) ? htmlspecialchars(trim($_POST[$key])) : '';
}

function getConnection()
{
    $servername = "localhost";
    $username = "root";
    $password = "h6wZFJGzfCud7F?f";
    $dbname = "sht";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    return $conn;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['usr']) && isset($_POST['pwd'])) {
    $loginUsername = getValue('usr');
    $loginPassword = getValue('pwd');


    $conn = getConnection();
    $stmt = $conn->prepare("SELECT username, password FROM users WHERE username = ?");
    $stmt->bind_param("s", $loginUsername);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($dbUsername, $dbPassword);
        $stmt->fetch();
        $stmt->close();
        $conn->close();
        if (password_verify($loginPassword, $dbPassword)) {
            $_SESSION['usr'] = $loginUsername;
            header('Location: scheduler.php');
            exit;
        } else {
            header('Location: login.php');
        }
    } else {
        $conn->close();
        die("Sorry, could not verify account.");
    }
}
?>

<!DOCTYPE html>
<html class="w3-dark-gray">

<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="./JS/login.js" type="module"></script>
</head>

<body>
    <main class="w3-container w3-center w3-padding-large" style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div class="w3-card-4 w3-light-gray w3-round-large w3-padding-large w3-margin-auto" style="max-width: 400px;">
            <h2 class="w3-center">Login</h2>
            <form action="#" method="POST" class="w3-container">
                <p>
                    <input class="w3-input w3-border w3-round" placeholder="Username" name="usr" required autofocus>
                </p>
                <p>
                    <input class="w3-input w3-border w3-round" type="password" placeholder="Password" name="pwd" required>
                </p>
                <p>
                    <button class="w3-button w3-green w3-round w3-block">Log In</button>
                </p>
                <p class="w3-center">
                    <a href="register.php" class="w3-text-blue">Create an account?</a>
                </p>
            </form>
        </div>
    </main>
</body>

</html>

<script>
    // Removed the event listener for the "Create an account?" link
    document.getElementById('register-button').addEventListener('click', async function(event) {
        event.preventDefault();
        const registerError = document.getElementById('register-error');
        registerError.innerHTML = '';
        const email = document.getElementById('register-email').value;
        const password = document.getElementById('register-password').value;
        if (email && password) {
            const req = await fetch('register.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    email,
                    password
                })
            }).catch(error => {
                registerError.innerHTML = 'Server error';
            });
            if (req.status === 200) {
                const res = await req.json();
                if (res.error) {
                    registerError.innerHTML = res.error;
                } else {
                    window.location.href = 'login.php';
                }
            } else {
                registerError.innerHTML = 'Server error';
            }
        } else {
            registerError.innerHTML = 'Please fill in all fields';
        }
    });
</script>
</body>

</html>