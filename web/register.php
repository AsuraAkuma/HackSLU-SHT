<?php
$config = json_decode(file_get_contents('config.json'), true);
session_start();

if (isset($_SESSION['id'])) {
    $isLoggedIn = true;
} else {
    $isLoggedIn = false;
}

function encryptPassword($password)
{
    return password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
}

function apiPost($apiUrl, $postData)
{
    $options = [
        'http' => [
            'header'  => "Content-Type: application/json\r\n",
            'method'  => 'POST',
            'content' => json_encode($postData),
        ],
    ];
    $context = stream_context_create($options);
    $response = file_get_contents($apiUrl, false, $context);
    return $response ? json_decode($response, true) : null;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST["username"]);
    $email = trim($_POST["email"]);
    $password = trim($_POST["password"]);
    $confirmPassword = trim($_POST["confirmPassword"]);

    if ($password !== $confirmPassword) {
        echo json_encode(["error" => "Passwords do not match"]);
        exit;
    }

    $api_url = "http://127.0.0.1:5504/api/signup";
    $postData = [
        "username" => $username,
        "email" => $email,
        "password" => $password
    ];

    $response = apiPost($api_url, $postData);

    if ($response && isset($response['success'])) {
        echo json_encode(["success" => "User registered successfully"]);
    } else {
        echo json_encode(["error" => $response['error'] ?? "Failed to register user. Please try again."]);
    }
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="./CSS/login.css">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const registerForm = document.getElementById("registerForm");
            const registerError = document.getElementById("register-error");

            registerForm.addEventListener("submit", function () {
                registerError.innerHTML = ""; // Clear any previous errors
                // Allow the form to submit normally
                window.location.href = "register.php";
            });
        });
    </script>
</head>

<body>
    <div class="register-container"></div>
        <h1>Register</h1>
        <form id="registerForm" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <p id="register-error" style="color: red;"></p>

            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
