<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

require_once '../config/db.php';

if(isset($_GET['subject'])) {
    $subject = $_GET['subject'];
    $exam_type = isset($_GET['exam_type']) ? $_GET['exam_type'] : 'mid_sem';
    
    // Determine limit based on exam type
    $limit = ($exam_type === 'end_sem') ? 20 : 15;
    
    try {
        $stmt = $pdo->prepare("SELECT id, subject, exam_type, question, option1, option2, option3, option4, answer FROM questions WHERE subject = ? AND exam_type = ? ORDER BY RAND() LIMIT " . $limit);
        $stmt->execute([$subject, $exam_type]);
        
        $questions = $stmt->fetchAll();
        
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
