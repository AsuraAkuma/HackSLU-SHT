<?php
    // Turn on error reporting.
    error_reporting(E_ALL);
    ini_set('display_errors', '1');
    
    session_start();

    function getValue($key) {
        return isset($_POST[$key]) ? htmlspecialchars(trim($_POST[$key])) : '';
    }

    function getConnection() {
        $servername = "localhost";
        $username = "root";
        $password = "root";
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

        if ($loginUsername == 'admin' && $loginPassword == 'admin') {
            $_SESSION['usr'] = $loginUsername;
            header('Location: test.php');
            die;
        }

        $conn = getConnection();
        $stmt = $conn->prepare("SELECT username, password FROM users WHERE username = ?");
        $stmt->bind_param("s", $loginUsername);
        $stmt->execute();
        $stmt->store_result();
        
        if ($stmt->num_rows > 0) {
            $stmt->bind_result($dbUsername, $dbPassword);
            $stmt->fetch();

            if (password_verify($loginPassword, $dbPassword)) {
                $_SESSION['usr'] = $loginUsername;
                header('Location: test.php');
                exit;
            } else {
                die("Unable to authenticate.");
            }
        } else {
            die("Sorry, could not verify account.");
        }

        $stmt->close();
        $conn->close();
    }
?>

<!DOCTYPE html>
<html class="body w3-dark-gray">
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
    <link rel="stylesheet" href="style1.css"> 
</head>
<body>
    <main class="w3-panel w3-cell-row">
        <div class="w3-cell" style="width: 30%"></div>
        <div class="w3-cell w3-card-4 w3-border w3-round-large" style="width: 40%">
            <form class="w3-panel" action="#" method="POST">
                <p>
                    <input class="w3-input" placeholder="username" name="usr" required autofocus>
                </p>
                <p>
                    <input class="w3-input" type="password" placeholder="password" name="pwd" required>
                </p>
                <p>
                    <button class="w3-input w3-button w3-green w3-round">Log In</button>
                </p>
                <p>
                    <!-- Ensure the link points to register.php -->
                    <a href="register.php" class="w3-mobile" id="register-link">Create an account?</a>
                </p>
            </form>
            <!-- ...existing code for the hidden registration form... -->
        </div>
        <div class="w3-cell" style="width: 30%"></div>
    </main>
    
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
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ email, password })
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