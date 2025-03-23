<?php
$config = json_decode(file_get_contents('./JS/config.json'), true);
// Turn on error reporting.
error_reporting(E_ALL);
ini_set('display_errors', '1');

session_start();

if (!isset($_SESSION['usr'])) {

    header('Location: login.php');
    die;
}
// Fetch professionals from the API
$response = file_get_contents($config['apiURL'] . '/professionals');
$professionals = json_decode($response, true);

if ($professionals === null) {
    die('Error fetching professionals from API.');
}
$options = '';
foreach ($professionals as $professional) {
    $options .= '<option value="' . htmlspecialchars($professional['professionalId']) . '">' . htmlspecialchars($professional['name']) . '</option>';
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" href="./vars.css"> -->
    <link rel="stylesheet" href="./CSS/base.css">
    <link rel="stylesheet" href="./CSS/scheduler.css">
    <!-- <script src="./JS/chatbot.js"></script> -->
    <title>Book a Consultation</title>
</head>

<body class="body">
    <header class="header">
        <div class="header-section" id="header-section-left">
            <p class="header-title">SHT - Online Consulting and Therapy</p>
        </div>
        <div class="header-section" id="header-section-right">
            <button class="header-button" onclick="goToUrl('./resources.html')">Resources</button>
            <button class="header-button" onclick="goToUrl('./professionals.html')">Professionals</button>
            <button class="header-button" onclick="goToUrl('./about.html')">About</button>
            <button class="header-button-special" onclick="goToUrl('./chatbot.html')">Chat</button>
        </div>
    </header>
    <div class="heading">
        <h1 class="heading-title">Book an Appointment!</h1>
        <p class="heading-text">Swiftly find a professional suited to your needs and schedule a virtual consultation with them at your leisure.</p>
    </div>

    <div class="appointment-container">
        <h2 class="appointment-title">Schedule Your Appointment</h2>

        <div class="dropdown-group">
            <label for="professional">Choose a Professional:</label>
            <select id="professional" class="dropdown">
                <option value="" disabled selected>Select a professional</option>
                <?php echo $options; ?>
                <!-- <option value="dr-smith">Dr. Smith</option>
                <option value="dr-johnson">Dr. Johnson</option>
                <option value="dr-williams">Dr. Williams</option> -->
            </select>
        </div>

        <div class="dropdown-group">
            <label for="date">Select a Date:</label>
            <input type="date" id="date" class="date-picker">
        </div>

        <div class="dropdown-group">
            <label for="time">Select a Time:</label>
            <select id="time" class="dropdown">
                <option value="" disabled selected>Select a time</option>
                <option value="8:00am">8:00 AM</option>
                <option value="8:30am">8:30 AM</option>
                <option value="9:00am">9:00 AM</option>
                <option value="9:30am">9:30 AM</option>
                <option value="10:00am">10:00 AM</option>
                <option value="10:30am">10:30 AM</option>
                <option value="11:00am">11:00 AM</option>
                <option value="11:30am">11:30 AM</option>
                <option value="12:00pm">12:00 PM</option>
                <option value="12:30pm">12:30 PM</option>
                <option value="1:00pm">1:00 PM</option>
                <option value="1:30pm">1:30 PM</option>
                <option value="2:00pm">2:00 PM</option>
                <option value="2:30pm">2:30 PM</option>
                <option value="3:00pm">3:00 PM</option>
                <option value="3:30pm">3:30 PM</option>
                <option value="4:00pm">4:00 PM</option>
                <option value="4:30pm">4:30 PM</option>
                <option value="5:00pm">5:00 PM</option>
            </select>
        </div>

        <button class="submit-button" type="submit">Book Appointment</button>
    </div>

    <footer class="footer">
        <div class="footer-left">
            <div class="footer-left-title">
                <p class="footer-left-title-text">SHT - Online Consulting and Therapy</p>
            </div>
            <div class="footer-left-image">
                <img src="./Media/logo0.png" alt="logo" class="footer-left-image-logo">
            </div>
            <div class="footer-left-socials">
                <a href="https://www.facebook.com/"><img src="./Media/facebook.svg" alt="facebook"
                        class="footer-left-socials-icon"></a>
                <a href="https://www.linkedin.com/"><img src="./Media/linkedin.svg" alt="linkedin"
                        class="footer-left-socials-icon"></a>
                <a href="https://www.youtube.com/"><img src="./Media/youtube.svg" alt="youtube"
                        class="footer-left-socials-icon"></a>
                <a href="https://www.instragram.com/"><img src="./Media/instagram.svg" alt="instagram"
                        class="footer-left-socials-icon"></a>

            </div>
        </div>
        <div class="footer-right">
            <div class="footer-right-section">
                <p class="footer-right-section-title">Policies</p>
                <a href="./" class="footer-right-section-link">Privacy Policy</a>
                <a href="./" class="footer-right-section-link">Terms of Service</a>
                <a href="./" class="footer-right-section-link">Cookies</a>
            </div>
            <div class="footer-right-section">
                <p class="footer-right-section-title">Services</p>
                <a href="./" class="footer-right-section-link">Pro Finder</a>
                <a href="./" class="footer-right-section-link">Schedule Builder</a>
                <a href="./" class="footer-right-section-link">Book Consultation</a>
            </div>
    </footer>
</body>

<script>
    function goToUrl(url) {
        window.location.href
    }

    function bookAppointment() {
        var professional = document.getElementById('professional').value;
        var date = document.getElementById('date').value;
        var time = document.getElementById('time').value;

        if (professional && date && time) {
            var params = new URLSearchParams({
                professional: professional,
                date: date,
                time: time
            }).toString();

            window.location.href = './appt_confirmed.html?' + params;
        } else {
            alert('Please fill out all fields before booking an appointment.');
        }
    }

    document.querySelector('.submit-button').addEventListener('click', bookAppointment);
</script>