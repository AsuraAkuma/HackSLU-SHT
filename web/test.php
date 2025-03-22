<?php
$config = json_decode(file_get_contents('config.json'), true);
// Start the session
session_start();
// Check if the user is logged in
if (isset($_SESSION['id'])) {
    // Get user data from database using the $_SESSION['id']
    $isLoggedIn = true;
} else {
    $isLoggedIn = false;
}

// Encrypt password
function encryptPassword($password)
{
    $options = [
        'cost' => 12,
    ];
    $hash = password_hash($password, PASSWORD_BCRYPT, $options);
    return $hash;
}
// verify password
function verifyPassword($password, $hash)
{
    return password_verify($password, $hash);
}
function apiGet($apiUrl)
{
    $response = file_get_contents($apiUrl);
    if ($response === FALSE) {
        // Handle error
        return null;
    }
    $data = json_decode($response, true);
    return $data;
} {
}

function apiPost($apiUrl, $postData)
{
    $options = [
        'http' => [
            'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
            'method'  => 'POST',
            'content' => http_build_query($postData),
        ],
    ];
    $context  = stream_context_create($options);
    $response = file_get_contents($apiUrl, false, $context);
    if ($response === FALSE) {
        // Handle error
        return null;
    }
    $data = json_decode($response, true);
    return $data;
}

function apiDelete($apiUrl)
{
    $options = [
        'http' => [
            'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
            'method'  => 'DELETE',
        ],
    ];
    $context  = stream_context_create($options);
    $response = file_get_contents($apiUrl, false, $context);
    if ($response === FALSE) {
        // Handle error
        return null;
    }
    $data = json_decode($response, true);
    return $data;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHT</title>
    <link rel="stylesheet" href="./CSS/test.css">
    <script src="./JS/test.js"></script>
</head>

<body>
    <!-- Chat box -->
    <div class="chat-box">
        <div class="chat-box-header">
            <h5>Chat</h5>
        </div>
        <div class="chat-box-messages" id="chat-box-messages">
            <!-- Chat messages will be displayed here -->
            <div class="chat-box-message">
                <div class="chat-box-message-header">
                    <img class="chat-box-message-header-avatar" src="./media/user-nurse-solid.svg" alt="Avatar">
                    <p class="chat-box-message-header-user">SHT Bot</p>
                </div>
                <p class="chat-box-message-text">Hello! How can I help you today?</p>
                <p class="chat-box-message-time">12:00 PM CST</p>
            </div>
            <div class="chat-box-footer">
                <input class="chat-box-input" id="chat-box-input" type="text" placeholder="Type a message...">
                <button class="chat-box-send" id="chat-box-send">Send</button>
            </div>
        </div>
</body>

</html>