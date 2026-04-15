<?php
// login.php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

require_once '../config/db.php';

$json = file_get_contents('php://input');
$data = json_decode($json, true);

if(isset($data['email']) && isset($data['password'])) {
    try {
        $stmt = $pdo->prepare("SELECT id, name, email, password, role FROM users WHERE email = ?");
        $stmt->execute([$data['email']]);
        $user = $stmt->fetch();
        
        if($user && ($data['password'] === $user['password'] || password_verify($data['password'], $user['password']))) {
            // Unset password before sending
            unset($user['password']);
            
            echo json_encode(["status" => "success", "message" => "Login successful", "user" => $user]);
        } else {
            echo json_encode(["status" => "error", "message" => "Invalid email or password"]);
        }
    } catch(PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Database error"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Email and password required"]);
}
?>
