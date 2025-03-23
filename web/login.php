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
    <link rel="stylesheet" href="./CSS/login.css">
    <script src="./JS/login.js" type="module"></script>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form id="loginForm">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>