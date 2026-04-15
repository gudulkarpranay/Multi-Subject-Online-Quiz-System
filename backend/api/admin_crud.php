<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

require_once '../config/db.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    // Add Question
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
    
    if(isset($data['subject']) && isset($data['question'])) {
        try {
            $stmt = $pdo->prepare("INSERT INTO questions (subject, question, option1, option2, option3, option4, answer) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([
                $data['subject'], 
                $data['question'], 
                $data['option1'], 
                $data['option2'], 
                $data['option3'], 
                $data['option4'], 
                $data['answer']
            ]);
            
            echo json_encode(["status" => "success", "message" => "Question added successfully"]);
        } catch(PDOException $e) {
            echo json_encode(["status" => "error", "message" => "Database insertion failed"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Missing required fields"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Method not supported"]);
}
?>
