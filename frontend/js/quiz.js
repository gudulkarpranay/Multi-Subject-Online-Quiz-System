$(document).ready(function() {
    $('body').fadeIn(400);

    const user = JSON.parse(localStorage.getItem('user'));
    if (!user) {
        window.location.href = 'index.html';
        return;
    }

    const urlParams = new URLSearchParams(window.location.search);
    const subject = urlParams.get('subject') || 'General';
    const examType = urlParams.get('exam_type') || 'mid_sem';
    
    // Formatting title based on exam type
    const examLabel = examType === 'mid_sem' ? 'Mid Sem' : 'End Sem';
    $('#subjectTitle').text(`${subject} - ${examLabel} Exam`);

    let questions = [];
    let currentIndex = 0;
    let score = 0;
    let timerInterval;
    let timeLeft = examType === 'end_sem' ? 1200 : 900; // 20 mins or 15 mins

    // Practical Requirement: AJAX (load quiz questions dynamically without page reload)
    // For now we simulate an AJAX call that will eventually hit backend/api/get_questions.php
    
    // Using setTimeout to simulate network delay for the loader
    setTimeout(() => {
        $.ajax({
            url: '../backend/api/get_questions.php',
            type: 'GET',
            data: { subject: subject, exam_type: examType },
            dataType: 'json',
            success: function(data) {
                if(data && data.length > 0) {
                    questions = data;
                } else {
                    // Fallback to mock data if PHP is not yet returning data
                    mockQuestions();
                }
                initQuiz();
            },
            error: function() {
                // Fallback for when backend is not running
                mockQuestions();
                initQuiz();
            }
        });
    }, 1500);

    function mockQuestions() {
        // Fallback mock logic for UI checking
        for(let i=1; i<=10; i++) {
            questions.push({
                id: i,
                question: `Mock Question ${i} for ${subject}`,
                options: [`Option A for ${i}`, `Option B for ${i}`, `Option C for ${i}`, `Option D for ${i}`],
                answer: `Option A for ${i}`
            });
        }
    }

    function initQuiz() {
        $('#ajaxLoader').fadeOut(400, function() {
            $('#quizContainer').fadeIn(400);
            startTimer();
            loadQuestion();
        });
    }

    function startTimer() {
        timerInterval = setInterval(function() {
            timeLeft--;
            let m = Math.floor(timeLeft / 60);
            let s = timeLeft % 60;
            $('#timerDisplay span').text(`${m}:${s < 10 ? '0' : ''}${s}`);

            if(timeLeft <= 0) {
                clearInterval(timerInterval);
                submitQuiz();
            }
        }, 1000);
    }

    // JS Event Handling
    function loadQuestion() {
        const q = questions[currentIndex];
        $('#questionCounter').text(`Question ${currentIndex + 1} of ${questions.length}`);
        $('#questionText').text(q.question);
        
        let optsHtml = '';
        const options = q.options || [q.option1, q.option2, q.option3, q.option4]; // Handle both mock array or db object structure

        options.forEach(opt => {
            const isSelected = q.userAnswer === opt ? 'selected' : '';
            optsHtml += `<div class="option-btn ${isSelected}" data-val="${opt}">${opt}</div>`;
        });
        
        $('#optionsContainer').html(optsHtml);
        
        // Update Progress Bar
        const progress = ((currentIndex) / questions.length) * 100;
        $('#progressBar').css('width', `${progress}%`);

        // Button visibility
        $('#prevBtn').css('visibility', currentIndex === 0 ? 'hidden' : 'visible');
        
        if (currentIndex === questions.length - 1) {
            $('#nextBtn').hide();
            $('#submitBtn').show();
        } else {
            $('#nextBtn').show();
            $('#submitBtn').hide();
        }

        // JS Selection handling
        $('.option-btn').click(function() {
            $('.option-btn').removeClass('selected');
            $(this).addClass('selected');
            questions[currentIndex].userAnswer = $(this).data('val');
        });
    }

    $('#nextBtn').click(function() {
        if(currentIndex < questions.length - 1) {
            currentIndex++;
            loadQuestion();
        }
    });

    $('#prevBtn').click(function() {
        if(currentIndex > 0) {
            currentIndex--;
            loadQuestion();
        }
    });

    $('#submitBtn').click(function() {
        submitQuiz();
    });

    function submitQuiz() {
        clearInterval(timerInterval);
        score = 0;
        
        questions.forEach(q => {
            if(q.userAnswer === q.answer) score++;
        });

        // Practical Requirement: Submit through AJAX
        const percentage = (score / questions.length) * 100;
        
        const payload = {
            user_id: user.id || 1, // mock user id
            subject: subject,
            exam_type: examType,
            score: score,
            percentage: percentage
        };

        $('#quizContainer').fadeOut(400, function() {
            $('#ajaxLoader').show();
            $('#ajaxLoader p').html('Submitting answers... <br><small class="text-muted">Calculating Score</small>');
            
            // Simulating delay for POST
            setTimeout(() => {
                $.ajax({
                    url: '../backend/api/submit_quiz.php',
                    type: 'POST',
                    data: JSON.stringify(payload),
                    contentType: 'application/json',
                    success: function() {
                        showResults(percentage);
                    },
                    error: function() {
                        showResults(percentage); // Fallback layout
                    }
                });
            }, 1000);
        });
    }

    function showResults(percentage) {
        $('#ajaxLoader').fadeOut(400, function() {
            $('#resultContainer').fadeIn(400);
            $('#scoreValue').text(score);
            $('#totalValue').text(questions.length);
            
            // Animate percentage text and circle
            let currPct = 0;
            const animate = setInterval(() => {
                currPct++;
                $('#scorePercentage').text(currPct + '%');
                $('#scoreCircle').css('background', `conic-gradient(var(--success) ${currPct}%, transparent 0%)`);
                
                if(currPct >= percentage) {
                    clearInterval(animate);
                }
            }, 20);
        });
    }

    $('#returnDashboardBtn').click(function() {
        window.location.href = 'dashboard.html';
    });
});
