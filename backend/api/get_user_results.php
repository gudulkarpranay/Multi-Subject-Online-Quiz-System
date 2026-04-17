<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

require_once '../config/db.php';

if(isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
    
    try {
        $stmt = $pdo->prepare("SELECT subject, exam_type, score, percentage, DATE_FORMAT(created_at, '%b %d, %Y %h:%i %p') as date FROM results WHERE user_id = ? ORDER BY created_at DESC");
        $stmt->execute([$user_id]);
        
        $results = $stmt->fetchAll();
        echo json_encode(["status" => "success", "data" => $results]);
    } catch(PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Failed to fetch results"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "No user ID provided"]);
}
?>
