<?php
$config = json_decode(file_get_contents('./JS/config.json'), true);
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
<html lang="en" class="w3-dark-gray">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="./JS/register.js" type="module"></script>
</head>

<body>
    <main class="w3-container w3-center w3-padding-large" style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div class="w3-card-4 w3-light-gray w3-round-large w3-padding-large w3-margin-auto" style="max-width: 400px;">
            <h2 class="w3-center">Register</h2>
            <form id="registerForm" class="w3-container">
                <p>
                    <label for="username" class="w3-text-black">Username:</label>
                    <input type="text" id="username" name="username" class="w3-input w3-border w3-round" required>
                </p>
                <p>
                    <label for="email" class="w3-text-black">Email:</label>
                    <input type="email" id="email" name="email" class="w3-input w3-border w3-round" required>
                </p>
                <p>
                    <label for="password" class="w3-text-black">Password:</label>
                    <input type="password" id="password" name="password" class="w3-input w3-border w3-round" required>
                </p>
                <p>
                    <label for="confirmPassword" class="w3-text-black">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="w3-input w3-border w3-round" required>
                </p>
                <p id="register-error" class="w3-text-red w3-center"></p>
                <p>
                    <button type="submit" id="register-button" class="w3-button w3-green w3-round w3-block">Register</button>
                </p>
            </form>
        </div>
    </main>
</body>

</html>
