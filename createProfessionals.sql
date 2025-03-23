CREATE DATABASE mental_health_db;
USE mental_health_db;

CREATE TABLE therapists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    specialty VARCHAR(255),
    location VARCHAR(255),
    availability VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255),
    website VARCHAR(255)
);

-- Load data from CSV file
LOAD DATA INFILE '/path/to/therapists_data.csv'
INTO TABLE therapists
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(name, specialty, location, availability, phone, email, website);
