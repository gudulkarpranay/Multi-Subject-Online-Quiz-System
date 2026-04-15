<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

require_once '../config/db.php';

// Get raw POST payload as JSON
$json = file_get_contents('php://input');
$data = json_decode($json, true);

if(isset($data['subject']) && isset($data['score'])) {
    
    $userId = isset($data['user_id']) ? $data['user_id'] : 1; // Default fallback
    $subject = $data['subject'];
    $score = $data['score'];
    $percentage = $data['percentage'];
    
    try {
        $stmt = $pdo->prepare("INSERT INTO results (user_id, subject, score, percentage) VALUES (?, ?, ?, ?)");
        $stmt->execute([$userId, $subject, $score, $percentage]);
        
        echo json_encode(["status" => "success", "message" => "Result saved successfully"]);
    } catch(PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Failed to save result", "error" => $e->getMessage()]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid payload"]);
}
?>
