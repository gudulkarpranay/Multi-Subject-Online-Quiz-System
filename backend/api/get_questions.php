<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

require_once '../config/db.php';

if(isset($_GET['subject'])) {
    $subject = $_GET['subject'];
    
    try {
        $stmt = $pdo->prepare("SELECT id, subject, question, option1, option2, option3, option4, answer FROM questions WHERE subject = ? ORDER BY RAND() LIMIT 10");
        $stmt->execute([$subject]);
        
        $questions = $stmt->fetchAll();
        
        // Structure the options as an array to make it easier for frontend (or keep flat, js currently handles either)
        $formatted = [];
        foreach($questions as $q) {
            $formatted[] = [
                'id' => $q['id'],
                'question' => $q['question'],
                'options' => [$q['option1'], $q['option2'], $q['option3'], $q['option4']],
                'answer' => $q['answer']
            ];
        }
        
        echo json_encode($formatted);
    } catch(PDOException $e) {
        echo json_encode(["error" => "Failed to fetch questions"]);
    }
} else {
    echo json_encode(["error" => "No subject provided"]);
}
?>
