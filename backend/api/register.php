<?php
// register.php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

require_once '../config/db.php';

$json = file_get_contents('php://input');
$data = json_decode($json, true);

if(isset($data['name']) && isset($data['email']) && isset($data['password'])) {
    
    // Hash password before saving in real apps
    $hash = password_hash($data['password'], PASSWORD_DEFAULT);
    
    try {
        $stmt = $pdo->prepare("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
        $stmt->execute([$data['name'], $data['email'], $hash]);
        
        echo json_encode(["status" => "success", "message" => "Registration successful"]);
    } catch(PDOException $e) {
        // Checking for duplicate email gracefully
        echo json_encode(["status" => "error", "message" => "Email may already exist"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Name, Email, and Password are required"]);
}
?>
