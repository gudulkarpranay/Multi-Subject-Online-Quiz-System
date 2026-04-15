CREATE DATABASE IF NOT EXISTS smart_quiz_db;
USE smart_quiz_db;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'admin') DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Questions table
CREATE TABLE IF NOT EXISTS questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(50) NOT NULL,
    question TEXT NOT NULL,
    option1 VARCHAR(255) NOT NULL,
    option2 VARCHAR(255) NOT NULL,
    option3 VARCHAR(255) NOT NULL,
    option4 VARCHAR(255) NOT NULL,
    answer VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Results table
CREATE TABLE IF NOT EXISTS results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    subject VARCHAR(50) NOT NULL,
    score INT NOT NULL,
    percentage DECIMAL(5,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert dummy admin
INSERT INTO users (name, email, password, role) 
VALUES ('Admin', 'admin@quiz.com', 'admin123', 'admin')
ON DUPLICATE KEY UPDATE name='Admin';

-- Insert dummy questions
INSERT INTO questions (subject, question, option1, option2, option3, option4, answer) VALUES 
('CN', 'What does IP stand for?', 'Internet Provider', 'Internet Protocol', 'Internal Protocol', 'Internet Path', 'Internet Protocol'),
('CN', 'Which layer is not in OSI model?', 'Transport', 'Session', 'Internet', 'Application', 'Internet'),
('OS', 'Which scheduling algorithm allocates the CPU first to the process that requests the CPU first?', 'Shortest Job First', 'First Come First Served', 'Priority Scheduling', 'Round Robin', 'First Come First Served'),
('WDL', 'What does HTML stand for?', 'Hyper Text Markup Language', 'Home Tool Markup Language', 'Hyperlinks and Text Markup Language', 'Hyper Tool Markup Language', 'Hyper Text Markup Language'),
('AOA', 'Which data structure is used for BFS?', 'Stack', 'Queue', 'Graph', 'Tree', 'Queue'),
('EVS', 'Which of the following is a renewable source of energy?', 'Coal', 'Petroleum', 'Wind', 'Natural Gas', 'Wind'),
('IoT', 'Which protocol is lightweight and used in IoT?', 'HTTP', 'MQTT', 'SMTP', 'FTP', 'MQTT');
