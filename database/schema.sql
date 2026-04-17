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
    exam_type ENUM('mid_sem', 'end_sem') NOT NULL DEFAULT 'mid_sem',
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
    exam_type ENUM('mid_sem', 'end_sem') NOT NULL DEFAULT 'mid_sem',
    score INT NOT NULL,
    percentage DECIMAL(5,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert dummy admin
INSERT INTO users (name, email, password, role) 
VALUES ('Admin', 'admin@quiz.com', 'admin123', 'admin')
ON DUPLICATE KEY UPDATE name='Admin';

-- Insert auto-generated 210 questions (15 mid_sem, 20 end_sem per subject)
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('CN', 'mid_sem', 'What is the function of layer 4 in OSI model or standard protocol 1?', 'Addressing', 'Error Control', 'Physical Transmission', 'Routing', 'Routing'),
('CN', 'mid_sem', 'What is the function of layer 3 in OSI model or standard protocol 2?', 'Physical Transmission', 'Routing', 'Addressing', 'Error Control', 'Routing'),
('CN', 'mid_sem', 'What is the function of layer 4 in OSI model or standard protocol 3?', 'Error Control', 'Addressing', 'Physical Transmission', 'Routing', 'Error Control'),
('CN', 'mid_sem', 'What is the function of layer 7 in OSI model or standard protocol 4?', 'Addressing', 'Error Control', 'Routing', 'Physical Transmission', 'Error Control'),
('CN', 'mid_sem', 'What is the function of layer 4 in OSI model or standard protocol 5?', 'Physical Transmission', 'Addressing', 'Routing', 'Error Control', 'Physical Transmission'),
('CN', 'mid_sem', 'What is the function of layer 7 in OSI model or standard protocol 6?', 'Error Control', 'Addressing', 'Routing', 'Physical Transmission', 'Error Control'),
('CN', 'mid_sem', 'What is the function of layer 3 in OSI model or standard protocol 7?', 'Routing', 'Physical Transmission', 'Error Control', 'Addressing', 'Physical Transmission'),
('CN', 'mid_sem', 'What is the function of layer 2 in OSI model or standard protocol 8?', 'Physical Transmission', 'Routing', 'Error Control', 'Addressing', 'Routing'),
('CN', 'mid_sem', 'What is the function of layer 7 in OSI model or standard protocol 9?', 'Error Control', 'Routing', 'Physical Transmission', 'Addressing', 'Addressing'),
('CN', 'mid_sem', 'What is the function of layer 3 in OSI model or standard protocol 10?', 'Addressing', 'Physical Transmission', 'Error Control', 'Routing', 'Routing');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('CN', 'mid_sem', 'What is the function of layer 7 in OSI model or standard protocol 11?', 'Addressing', 'Routing', 'Error Control', 'Physical Transmission', 'Error Control'),
('CN', 'mid_sem', 'What is the function of layer 3 in OSI model or standard protocol 12?', 'Routing', 'Addressing', 'Physical Transmission', 'Error Control', 'Addressing'),
('CN', 'mid_sem', 'What is the function of layer 2 in OSI model or standard protocol 13?', 'Error Control', 'Physical Transmission', 'Addressing', 'Routing', 'Addressing'),
('CN', 'mid_sem', 'What is the function of layer 3 in OSI model or standard protocol 14?', 'Routing', 'Physical Transmission', 'Addressing', 'Error Control', 'Routing'),
('CN', 'mid_sem', 'What is the function of layer 3 in OSI model or standard protocol 15?', 'Addressing', 'Routing', 'Error Control', 'Physical Transmission', 'Error Control'),
('CN', 'end_sem', 'What is the function of layer 5 in OSI model or standard protocol 1?', 'Error Control', 'Physical Transmission', 'Addressing', 'Routing', 'Error Control'),
('CN', 'end_sem', 'What is the function of layer 4 in OSI model or standard protocol 2?', 'Error Control', 'Physical Transmission', 'Addressing', 'Routing', 'Addressing'),
('CN', 'end_sem', 'What is the function of layer 5 in OSI model or standard protocol 3?', 'Physical Transmission', 'Routing', 'Error Control', 'Addressing', 'Addressing'),
('CN', 'end_sem', 'What is the function of layer 1 in OSI model or standard protocol 4?', 'Error Control', 'Physical Transmission', 'Addressing', 'Routing', 'Physical Transmission'),
('CN', 'end_sem', 'What is the function of layer 4 in OSI model or standard protocol 5?', 'Error Control', 'Physical Transmission', 'Routing', 'Addressing', 'Error Control');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('CN', 'end_sem', 'What is the function of layer 5 in OSI model or standard protocol 6?', 'Addressing', 'Physical Transmission', 'Error Control', 'Routing', 'Routing'),
('CN', 'end_sem', 'What is the function of layer 5 in OSI model or standard protocol 7?', 'Addressing', 'Error Control', 'Routing', 'Physical Transmission', 'Physical Transmission'),
('CN', 'end_sem', 'What is the function of layer 1 in OSI model or standard protocol 8?', 'Addressing', 'Error Control', 'Physical Transmission', 'Routing', 'Addressing'),
('CN', 'end_sem', 'What is the function of layer 2 in OSI model or standard protocol 9?', 'Error Control', 'Routing', 'Addressing', 'Physical Transmission', 'Addressing'),
('CN', 'end_sem', 'What is the function of layer 5 in OSI model or standard protocol 10?', 'Addressing', 'Error Control', 'Routing', 'Physical Transmission', 'Error Control'),
('CN', 'end_sem', 'What is the function of layer 2 in OSI model or standard protocol 11?', 'Routing', 'Physical Transmission', 'Addressing', 'Error Control', 'Addressing'),
('CN', 'end_sem', 'What is the function of layer 2 in OSI model or standard protocol 12?', 'Physical Transmission', 'Addressing', 'Routing', 'Error Control', 'Routing'),
('CN', 'end_sem', 'What is the function of layer 6 in OSI model or standard protocol 13?', 'Routing', 'Addressing', 'Physical Transmission', 'Error Control', 'Error Control'),
('CN', 'end_sem', 'What is the function of layer 1 in OSI model or standard protocol 14?', 'Error Control', 'Physical Transmission', 'Addressing', 'Routing', 'Routing'),
('CN', 'end_sem', 'What is the function of layer 1 in OSI model or standard protocol 15?', 'Routing', 'Physical Transmission', 'Addressing', 'Error Control', 'Error Control');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('CN', 'end_sem', 'What is the function of layer 3 in OSI model or standard protocol 16?', 'Physical Transmission', 'Addressing', 'Error Control', 'Routing', 'Routing'),
('CN', 'end_sem', 'What is the function of layer 2 in OSI model or standard protocol 17?', 'Routing', 'Physical Transmission', 'Error Control', 'Addressing', 'Routing'),
('CN', 'end_sem', 'What is the function of layer 6 in OSI model or standard protocol 18?', 'Routing', 'Error Control', 'Addressing', 'Physical Transmission', 'Addressing'),
('CN', 'end_sem', 'What is the function of layer 7 in OSI model or standard protocol 19?', 'Physical Transmission', 'Addressing', 'Error Control', 'Routing', 'Routing'),
('CN', 'end_sem', 'What is the function of layer 5 in OSI model or standard protocol 20?', 'Routing', 'Error Control', 'Physical Transmission', 'Addressing', 'Routing'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 1 in OS CPU scheduling or Memory Management?', 'FCFS', 'LRU', 'SJF', 'Round Robin', 'Round Robin'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 2 in OS CPU scheduling or Memory Management?', 'FCFS', 'LRU', 'Round Robin', 'SJF', 'FCFS'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 3 in OS CPU scheduling or Memory Management?', 'SJF', 'Round Robin', 'LRU', 'FCFS', 'FCFS'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 4 in OS CPU scheduling or Memory Management?', 'Round Robin', 'SJF', 'LRU', 'FCFS', 'Round Robin'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 5 in OS CPU scheduling or Memory Management?', 'FCFS', 'Round Robin', 'LRU', 'SJF', 'SJF');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('OS', 'mid_sem', 'Which algorithm is best for scenario 6 in OS CPU scheduling or Memory Management?', 'Round Robin', 'SJF', 'LRU', 'FCFS', 'Round Robin'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 7 in OS CPU scheduling or Memory Management?', 'Round Robin', 'FCFS', 'LRU', 'SJF', 'FCFS'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 8 in OS CPU scheduling or Memory Management?', 'SJF', 'LRU', 'FCFS', 'Round Robin', 'LRU'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 9 in OS CPU scheduling or Memory Management?', 'SJF', 'LRU', 'FCFS', 'Round Robin', 'LRU'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 10 in OS CPU scheduling or Memory Management?', 'LRU', 'FCFS', 'SJF', 'Round Robin', 'Round Robin'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 11 in OS CPU scheduling or Memory Management?', 'LRU', 'FCFS', 'Round Robin', 'SJF', 'LRU'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 12 in OS CPU scheduling or Memory Management?', 'FCFS', 'SJF', 'Round Robin', 'LRU', 'FCFS'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 13 in OS CPU scheduling or Memory Management?', 'Round Robin', 'FCFS', 'SJF', 'LRU', 'SJF'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 14 in OS CPU scheduling or Memory Management?', 'Round Robin', 'SJF', 'LRU', 'FCFS', 'LRU'),
('OS', 'mid_sem', 'Which algorithm is best for scenario 15 in OS CPU scheduling or Memory Management?', 'LRU', 'SJF', 'Round Robin', 'FCFS', 'LRU');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('OS', 'end_sem', 'Which algorithm is best for scenario 1 in OS CPU scheduling or Memory Management?', 'FCFS', 'SJF', 'LRU', 'Round Robin', 'FCFS'),
('OS', 'end_sem', 'Which algorithm is best for scenario 2 in OS CPU scheduling or Memory Management?', 'Round Robin', 'SJF', 'FCFS', 'LRU', 'Round Robin'),
('OS', 'end_sem', 'Which algorithm is best for scenario 3 in OS CPU scheduling or Memory Management?', 'LRU', 'FCFS', 'Round Robin', 'SJF', 'LRU'),
('OS', 'end_sem', 'Which algorithm is best for scenario 4 in OS CPU scheduling or Memory Management?', 'FCFS', 'SJF', 'Round Robin', 'LRU', 'FCFS'),
('OS', 'end_sem', 'Which algorithm is best for scenario 5 in OS CPU scheduling or Memory Management?', 'SJF', 'LRU', 'FCFS', 'Round Robin', 'SJF'),
('OS', 'end_sem', 'Which algorithm is best for scenario 6 in OS CPU scheduling or Memory Management?', 'LRU', 'FCFS', 'Round Robin', 'SJF', 'SJF'),
('OS', 'end_sem', 'Which algorithm is best for scenario 7 in OS CPU scheduling or Memory Management?', 'FCFS', 'SJF', 'Round Robin', 'LRU', 'FCFS'),
('OS', 'end_sem', 'Which algorithm is best for scenario 8 in OS CPU scheduling or Memory Management?', 'FCFS', 'SJF', 'LRU', 'Round Robin', 'LRU'),
('OS', 'end_sem', 'Which algorithm is best for scenario 9 in OS CPU scheduling or Memory Management?', 'LRU', 'Round Robin', 'FCFS', 'SJF', 'Round Robin'),
('OS', 'end_sem', 'Which algorithm is best for scenario 10 in OS CPU scheduling or Memory Management?', 'FCFS', 'SJF', 'Round Robin', 'LRU', 'LRU');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('OS', 'end_sem', 'Which algorithm is best for scenario 11 in OS CPU scheduling or Memory Management?', 'SJF', 'Round Robin', 'FCFS', 'LRU', 'Round Robin'),
('OS', 'end_sem', 'Which algorithm is best for scenario 12 in OS CPU scheduling or Memory Management?', 'SJF', 'Round Robin', 'LRU', 'FCFS', 'SJF'),
('OS', 'end_sem', 'Which algorithm is best for scenario 13 in OS CPU scheduling or Memory Management?', 'FCFS', 'LRU', 'Round Robin', 'SJF', 'Round Robin'),
('OS', 'end_sem', 'Which algorithm is best for scenario 14 in OS CPU scheduling or Memory Management?', 'Round Robin', 'FCFS', 'SJF', 'LRU', 'SJF'),
('OS', 'end_sem', 'Which algorithm is best for scenario 15 in OS CPU scheduling or Memory Management?', 'Round Robin', 'LRU', 'SJF', 'FCFS', 'LRU'),
('OS', 'end_sem', 'Which algorithm is best for scenario 16 in OS CPU scheduling or Memory Management?', 'SJF', 'Round Robin', 'FCFS', 'LRU', 'Round Robin'),
('OS', 'end_sem', 'Which algorithm is best for scenario 17 in OS CPU scheduling or Memory Management?', 'FCFS', 'SJF', 'Round Robin', 'LRU', 'FCFS'),
('OS', 'end_sem', 'Which algorithm is best for scenario 18 in OS CPU scheduling or Memory Management?', 'Round Robin', 'LRU', 'FCFS', 'SJF', 'FCFS'),
('OS', 'end_sem', 'Which algorithm is best for scenario 19 in OS CPU scheduling or Memory Management?', 'SJF', 'Round Robin', 'FCFS', 'LRU', 'SJF'),
('OS', 'end_sem', 'Which algorithm is best for scenario 20 in OS CPU scheduling or Memory Management?', 'LRU', 'Round Robin', 'FCFS', 'SJF', 'Round Robin');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 1?', '<nav>', '<header>', 'margin: auto', 'display: flex', 'display: flex'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 2?', 'margin: auto', '<nav>', 'display: flex', '<header>', '<header>'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 3?', 'margin: auto', 'display: flex', '<header>', '<nav>', 'margin: auto'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 4?', 'display: flex', '<nav>', 'margin: auto', '<header>', 'display: flex'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 5?', 'margin: auto', '<header>', 'display: flex', '<nav>', '<nav>'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 6?', 'display: flex', '<nav>', '<header>', 'margin: auto', 'display: flex'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 7?', 'display: flex', 'margin: auto', '<nav>', '<header>', 'display: flex'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 8?', '<nav>', 'display: flex', 'margin: auto', '<header>', '<nav>'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 9?', '<nav>', '<header>', 'margin: auto', 'display: flex', '<nav>'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 10?', 'margin: auto', 'display: flex', '<header>', '<nav>', '<nav>');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 11?', '<nav>', '<header>', 'display: flex', 'margin: auto', 'margin: auto'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 12?', '<header>', '<nav>', 'display: flex', 'margin: auto', '<header>'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 13?', 'display: flex', '<header>', '<nav>', 'margin: auto', 'margin: auto'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 14?', '<header>', 'margin: auto', 'display: flex', '<nav>', '<nav>'),
('WDL', 'mid_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 15?', '<nav>', 'display: flex', '<header>', 'margin: auto', 'margin: auto'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 1?', '<header>', 'margin: auto', 'display: flex', '<nav>', 'margin: auto'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 2?', 'margin: auto', '<header>', '<nav>', 'display: flex', 'display: flex'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 3?', '<nav>', 'display: flex', '<header>', 'margin: auto', 'margin: auto'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 4?', '<nav>', '<header>', 'margin: auto', 'display: flex', 'display: flex'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 5?', '<header>', '<nav>', 'margin: auto', 'display: flex', 'margin: auto');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 6?', 'display: flex', '<nav>', '<header>', 'margin: auto', '<nav>'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 7?', 'margin: auto', 'display: flex', '<header>', '<nav>', 'margin: auto'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 8?', '<nav>', 'display: flex', '<header>', 'margin: auto', 'display: flex'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 9?', '<nav>', 'margin: auto', 'display: flex', '<header>', '<header>'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 10?', 'display: flex', '<header>', 'margin: auto', '<nav>', '<nav>'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 11?', '<nav>', 'display: flex', '<header>', 'margin: auto', '<header>'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 12?', '<nav>', 'margin: auto', 'display: flex', '<header>', 'display: flex'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 13?', 'margin: auto', '<nav>', 'display: flex', '<header>', '<nav>'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 14?', 'margin: auto', '<nav>', 'display: flex', '<header>', '<header>'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 15?', 'margin: auto', '<nav>', '<header>', 'display: flex', '<nav>');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 16?', '<nav>', 'margin: auto', 'display: flex', '<header>', 'display: flex'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 17?', '<nav>', 'display: flex', '<header>', 'margin: auto', 'display: flex'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 18?', 'margin: auto', 'display: flex', '<nav>', '<header>', '<nav>'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 19?', 'margin: auto', '<nav>', 'display: flex', '<header>', 'display: flex'),
('WDL', 'end_sem', 'In web development, which HTML5 tag or CSS property is used for UI requirement 20?', 'display: flex', 'margin: auto', '<nav>', '<header>', 'display: flex'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 1 in worst-case scenario?', 'O(n log n)', 'O(log n)', 'O(n)', 'O(n^2)', 'O(n)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 2 in worst-case scenario?', 'O(n)', 'O(n log n)', 'O(log n)', 'O(n^2)', 'O(n)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 3 in worst-case scenario?', 'O(log n)', 'O(n^2)', 'O(n)', 'O(n log n)', 'O(n)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 4 in worst-case scenario?', 'O(n log n)', 'O(n)', 'O(n^2)', 'O(log n)', 'O(n^2)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 5 in worst-case scenario?', 'O(n log n)', 'O(log n)', 'O(n)', 'O(n^2)', 'O(n^2)');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('AOA', 'mid_sem', 'What is the time complexity of algorithm 6 in worst-case scenario?', 'O(log n)', 'O(n^2)', 'O(n log n)', 'O(n)', 'O(n)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 7 in worst-case scenario?', 'O(log n)', 'O(n^2)', 'O(n log n)', 'O(n)', 'O(log n)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 8 in worst-case scenario?', 'O(n log n)', 'O(n^2)', 'O(n)', 'O(log n)', 'O(n^2)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 9 in worst-case scenario?', 'O(n^2)', 'O(n)', 'O(log n)', 'O(n log n)', 'O(n)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 10 in worst-case scenario?', 'O(log n)', 'O(n^2)', 'O(n log n)', 'O(n)', 'O(n^2)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 11 in worst-case scenario?', 'O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)', 'O(log n)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 12 in worst-case scenario?', 'O(n log n)', 'O(n)', 'O(n^2)', 'O(log n)', 'O(n^2)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 13 in worst-case scenario?', 'O(n log n)', 'O(n)', 'O(log n)', 'O(n^2)', 'O(log n)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 14 in worst-case scenario?', 'O(n)', 'O(n^2)', 'O(log n)', 'O(n log n)', 'O(n log n)'),
('AOA', 'mid_sem', 'What is the time complexity of algorithm 15 in worst-case scenario?', 'O(n)', 'O(n^2)', 'O(log n)', 'O(n log n)', 'O(n)');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('AOA', 'end_sem', 'What is the time complexity of algorithm 1 in worst-case scenario?', 'O(n)', 'O(n log n)', 'O(log n)', 'O(n^2)', 'O(n log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 2 in worst-case scenario?', 'O(log n)', 'O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 3 in worst-case scenario?', 'O(n log n)', 'O(log n)', 'O(n)', 'O(n^2)', 'O(n log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 4 in worst-case scenario?', 'O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)', 'O(log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 5 in worst-case scenario?', 'O(n)', 'O(n^2)', 'O(log n)', 'O(n log n)', 'O(n log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 6 in worst-case scenario?', 'O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)', 'O(n^2)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 7 in worst-case scenario?', 'O(n^2)', 'O(log n)', 'O(n log n)', 'O(n)', 'O(n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 8 in worst-case scenario?', 'O(log n)', 'O(n^2)', 'O(n log n)', 'O(n)', 'O(n log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 9 in worst-case scenario?', 'O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)', 'O(log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 10 in worst-case scenario?', 'O(n log n)', 'O(n^2)', 'O(n)', 'O(log n)', 'O(n log n)');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('AOA', 'end_sem', 'What is the time complexity of algorithm 11 in worst-case scenario?', 'O(log n)', 'O(n^2)', 'O(n)', 'O(n log n)', 'O(n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 12 in worst-case scenario?', 'O(n^2)', 'O(n log n)', 'O(log n)', 'O(n)', 'O(n^2)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 13 in worst-case scenario?', 'O(log n)', 'O(n^2)', 'O(n)', 'O(n log n)', 'O(n log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 14 in worst-case scenario?', 'O(n log n)', 'O(log n)', 'O(n)', 'O(n^2)', 'O(n^2)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 15 in worst-case scenario?', 'O(n^2)', 'O(log n)', 'O(n log n)', 'O(n)', 'O(n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 16 in worst-case scenario?', 'O(n log n)', 'O(log n)', 'O(n)', 'O(n^2)', 'O(n log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 17 in worst-case scenario?', 'O(log n)', 'O(n)', 'O(n^2)', 'O(n log n)', 'O(n^2)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 18 in worst-case scenario?', 'O(n^2)', 'O(n log n)', 'O(log n)', 'O(n)', 'O(log n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 19 in worst-case scenario?', 'O(n log n)', 'O(n)', 'O(log n)', 'O(n^2)', 'O(n)'),
('AOA', 'end_sem', 'What is the time complexity of algorithm 20 in worst-case scenario?', 'O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)', 'O(n^2)');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('EVS', 'mid_sem', 'What is the environmental impact factor 1 in the ecosystem?', 'Ozone Depletion', 'Global Warming', 'Pollution', 'Acid Rain', 'Acid Rain'),
('EVS', 'mid_sem', 'What is the environmental impact factor 2 in the ecosystem?', 'Acid Rain', 'Pollution', 'Global Warming', 'Ozone Depletion', 'Global Warming'),
('EVS', 'mid_sem', 'What is the environmental impact factor 3 in the ecosystem?', 'Ozone Depletion', 'Global Warming', 'Pollution', 'Acid Rain', 'Pollution'),
('EVS', 'mid_sem', 'What is the environmental impact factor 4 in the ecosystem?', 'Pollution', 'Global Warming', 'Acid Rain', 'Ozone Depletion', 'Acid Rain'),
('EVS', 'mid_sem', 'What is the environmental impact factor 5 in the ecosystem?', 'Pollution', 'Global Warming', 'Ozone Depletion', 'Acid Rain', 'Pollution'),
('EVS', 'mid_sem', 'What is the environmental impact factor 6 in the ecosystem?', 'Global Warming', 'Acid Rain', 'Pollution', 'Ozone Depletion', 'Acid Rain'),
('EVS', 'mid_sem', 'What is the environmental impact factor 7 in the ecosystem?', 'Global Warming', 'Ozone Depletion', 'Pollution', 'Acid Rain', 'Ozone Depletion'),
('EVS', 'mid_sem', 'What is the environmental impact factor 8 in the ecosystem?', 'Ozone Depletion', 'Acid Rain', 'Global Warming', 'Pollution', 'Global Warming'),
('EVS', 'mid_sem', 'What is the environmental impact factor 9 in the ecosystem?', 'Acid Rain', 'Global Warming', 'Pollution', 'Ozone Depletion', 'Global Warming'),
('EVS', 'mid_sem', 'What is the environmental impact factor 10 in the ecosystem?', 'Acid Rain', 'Pollution', 'Global Warming', 'Ozone Depletion', 'Global Warming');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('EVS', 'mid_sem', 'What is the environmental impact factor 11 in the ecosystem?', 'Global Warming', 'Acid Rain', 'Pollution', 'Ozone Depletion', 'Pollution'),
('EVS', 'mid_sem', 'What is the environmental impact factor 12 in the ecosystem?', 'Acid Rain', 'Global Warming', 'Ozone Depletion', 'Pollution', 'Acid Rain'),
('EVS', 'mid_sem', 'What is the environmental impact factor 13 in the ecosystem?', 'Pollution', 'Acid Rain', 'Ozone Depletion', 'Global Warming', 'Ozone Depletion'),
('EVS', 'mid_sem', 'What is the environmental impact factor 14 in the ecosystem?', 'Ozone Depletion', 'Global Warming', 'Pollution', 'Acid Rain', 'Pollution'),
('EVS', 'mid_sem', 'What is the environmental impact factor 15 in the ecosystem?', 'Pollution', 'Ozone Depletion', 'Global Warming', 'Acid Rain', 'Acid Rain'),
('EVS', 'end_sem', 'What is the environmental impact factor 1 in the ecosystem?', 'Pollution', 'Ozone Depletion', 'Global Warming', 'Acid Rain', 'Acid Rain'),
('EVS', 'end_sem', 'What is the environmental impact factor 2 in the ecosystem?', 'Ozone Depletion', 'Pollution', 'Acid Rain', 'Global Warming', 'Global Warming'),
('EVS', 'end_sem', 'What is the environmental impact factor 3 in the ecosystem?', 'Global Warming', 'Pollution', 'Ozone Depletion', 'Acid Rain', 'Acid Rain'),
('EVS', 'end_sem', 'What is the environmental impact factor 4 in the ecosystem?', 'Acid Rain', 'Ozone Depletion', 'Global Warming', 'Pollution', 'Pollution'),
('EVS', 'end_sem', 'What is the environmental impact factor 5 in the ecosystem?', 'Pollution', 'Ozone Depletion', 'Acid Rain', 'Global Warming', 'Ozone Depletion');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('EVS', 'end_sem', 'What is the environmental impact factor 6 in the ecosystem?', 'Acid Rain', 'Ozone Depletion', 'Global Warming', 'Pollution', 'Global Warming'),
('EVS', 'end_sem', 'What is the environmental impact factor 7 in the ecosystem?', 'Acid Rain', 'Ozone Depletion', 'Pollution', 'Global Warming', 'Global Warming'),
('EVS', 'end_sem', 'What is the environmental impact factor 8 in the ecosystem?', 'Pollution', 'Acid Rain', 'Global Warming', 'Ozone Depletion', 'Acid Rain'),
('EVS', 'end_sem', 'What is the environmental impact factor 9 in the ecosystem?', 'Ozone Depletion', 'Acid Rain', 'Pollution', 'Global Warming', 'Ozone Depletion'),
('EVS', 'end_sem', 'What is the environmental impact factor 10 in the ecosystem?', 'Pollution', 'Global Warming', 'Ozone Depletion', 'Acid Rain', 'Pollution'),
('EVS', 'end_sem', 'What is the environmental impact factor 11 in the ecosystem?', 'Pollution', 'Global Warming', 'Acid Rain', 'Ozone Depletion', 'Global Warming'),
('EVS', 'end_sem', 'What is the environmental impact factor 12 in the ecosystem?', 'Acid Rain', 'Global Warming', 'Pollution', 'Ozone Depletion', 'Acid Rain'),
('EVS', 'end_sem', 'What is the environmental impact factor 13 in the ecosystem?', 'Pollution', 'Global Warming', 'Ozone Depletion', 'Acid Rain', 'Global Warming'),
('EVS', 'end_sem', 'What is the environmental impact factor 14 in the ecosystem?', 'Global Warming', 'Pollution', 'Acid Rain', 'Ozone Depletion', 'Acid Rain'),
('EVS', 'end_sem', 'What is the environmental impact factor 15 in the ecosystem?', 'Pollution', 'Global Warming', 'Acid Rain', 'Ozone Depletion', 'Pollution');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('EVS', 'end_sem', 'What is the environmental impact factor 16 in the ecosystem?', 'Ozone Depletion', 'Acid Rain', 'Global Warming', 'Pollution', 'Acid Rain'),
('EVS', 'end_sem', 'What is the environmental impact factor 17 in the ecosystem?', 'Global Warming', 'Acid Rain', 'Ozone Depletion', 'Pollution', 'Pollution'),
('EVS', 'end_sem', 'What is the environmental impact factor 18 in the ecosystem?', 'Ozone Depletion', 'Global Warming', 'Pollution', 'Acid Rain', 'Acid Rain'),
('EVS', 'end_sem', 'What is the environmental impact factor 19 in the ecosystem?', 'Ozone Depletion', 'Acid Rain', 'Pollution', 'Global Warming', 'Ozone Depletion'),
('EVS', 'end_sem', 'What is the environmental impact factor 20 in the ecosystem?', 'Acid Rain', 'Ozone Depletion', 'Pollution', 'Global Warming', 'Pollution'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 1?', 'MQTT', 'CoAP', 'AMQP', 'HTTP', 'HTTP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 2?', 'MQTT', 'HTTP', 'CoAP', 'AMQP', 'HTTP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 3?', 'AMQP', 'HTTP', 'MQTT', 'CoAP', 'CoAP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 4?', 'AMQP', 'MQTT', 'CoAP', 'HTTP', 'CoAP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 5?', 'MQTT', 'AMQP', 'HTTP', 'CoAP', 'CoAP');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 6?', 'HTTP', 'MQTT', 'CoAP', 'AMQP', 'CoAP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 7?', 'HTTP', 'AMQP', 'CoAP', 'MQTT', 'HTTP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 8?', 'AMQP', 'HTTP', 'CoAP', 'MQTT', 'HTTP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 9?', 'AMQP', 'CoAP', 'MQTT', 'HTTP', 'AMQP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 10?', 'CoAP', 'HTTP', 'MQTT', 'AMQP', 'CoAP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 11?', 'CoAP', 'MQTT', 'HTTP', 'AMQP', 'CoAP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 12?', 'AMQP', 'MQTT', 'HTTP', 'CoAP', 'CoAP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 13?', 'MQTT', 'AMQP', 'HTTP', 'CoAP', 'HTTP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 14?', 'MQTT', 'CoAP', 'AMQP', 'HTTP', 'HTTP'),
('IoT', 'mid_sem', 'Which IoT protocol or sensor is suitable for use case 15?', 'AMQP', 'MQTT', 'CoAP', 'HTTP', 'CoAP');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 1?', 'HTTP', 'CoAP', 'MQTT', 'AMQP', 'HTTP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 2?', 'CoAP', 'AMQP', 'MQTT', 'HTTP', 'CoAP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 3?', 'CoAP', 'MQTT', 'HTTP', 'AMQP', 'CoAP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 4?', 'HTTP', 'AMQP', 'CoAP', 'MQTT', 'HTTP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 5?', 'MQTT', 'CoAP', 'HTTP', 'AMQP', 'HTTP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 6?', 'CoAP', 'HTTP', 'MQTT', 'AMQP', 'HTTP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 7?', 'CoAP', 'AMQP', 'HTTP', 'MQTT', 'MQTT'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 8?', 'CoAP', 'AMQP', 'MQTT', 'HTTP', 'CoAP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 9?', 'CoAP', 'HTTP', 'AMQP', 'MQTT', 'CoAP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 10?', 'HTTP', 'CoAP', 'AMQP', 'MQTT', 'MQTT');
INSERT INTO questions (subject, exam_type, question, option1, option2, option3, option4, answer) VALUES 
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 11?', 'HTTP', 'MQTT', 'CoAP', 'AMQP', 'CoAP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 12?', 'MQTT', 'CoAP', 'AMQP', 'HTTP', 'AMQP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 13?', 'AMQP', 'MQTT', 'HTTP', 'CoAP', 'HTTP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 14?', 'CoAP', 'MQTT', 'HTTP', 'AMQP', 'CoAP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 15?', 'HTTP', 'CoAP', 'MQTT', 'AMQP', 'MQTT'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 16?', 'AMQP', 'HTTP', 'MQTT', 'CoAP', 'AMQP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 17?', 'CoAP', 'AMQP', 'HTTP', 'MQTT', 'AMQP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 18?', 'MQTT', 'HTTP', 'CoAP', 'AMQP', 'AMQP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 19?', 'CoAP', 'MQTT', 'AMQP', 'HTTP', 'AMQP'),
('IoT', 'end_sem', 'Which IoT protocol or sensor is suitable for use case 20?', 'HTTP', 'MQTT', 'CoAP', 'AMQP', 'HTTP');