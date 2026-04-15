<?php
// db.php
// Creates a connection to the MySQL database.
$host = 'localhost';
$dbname = 'smart_quiz_db';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    // Setting up PDO to throw exceptions on error
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(["status" => "error", "message" => "Database connection failed"]);
    exit;
}
?>
