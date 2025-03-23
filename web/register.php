<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST["username"]);
    $email = trim($_POST["email"]);
    $password = trim($_POST["password"]);
    $confirmPassword = trim($_POST["confirmPassword"]);

    if ($password !== $confirmPassword) {
        echo json_encode(["error" => "Passwords do not match"]);
        exit;
    }

    // extra comment
    // API URL (Flask backend)
    $api_url = "http://127.0.0.1:5504/api/signup";

    // Prepare data
    $postData = json_encode([
        "username" => $username,
        "email" => $email,
        "password" => $password
    ]);

    // Initialize cURL
    $ch = curl_init($api_url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Content-Type: application/json"
    ]);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);

    // Execute the request
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    // Handle response
    if ($httpCode == 201) {
        echo json_encode(["success" => "User registered successfully"]);
    } else {
        echo $response;
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
    <script src="./JS/register.js" type="module"></script>
</head>

<body>
    <div class="register-container">
        <h1>Register</h1>
        <form id="registerForm">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <p id="register-error" style="color: red;"></p>

            <button type="submit" id="register-button">Register</button>
        </form>
    </div>
</body>

</html>