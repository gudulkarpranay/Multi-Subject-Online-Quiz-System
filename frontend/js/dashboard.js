$(document).ready(function() {
    // Check Authentication (Mock Check)
    const user = JSON.parse(localStorage.getItem('user'));
    if (!user) {
        window.location.href = 'index.html';
        return;
    }

    $('#welcomeText').text(`Welcome back, ${user.name}!`);

    if (user.role === 'admin') {
        $('#adminBtn').removeClass('hidden');
    }

    $('#logoutBtn').click(function() {
        localStorage.removeItem('user');
        window.location.href = 'index.html';
    });

    // Admin Routing
    $('#adminBtn').click(function() {
        window.location.href = 'admin.html';
    });

    // Practical Requirement: Use Fetch API to call a public API
    // Fetching Quote of the Day
    fetch('https://api.allorigins.win/get?url=' + encodeURIComponent('https://zenquotes.io/api/random'))
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            // ZenQuotes via proxy returns data inside `contents` string
            const parsed = JSON.parse(data.contents);
            $('#quoteText').text(`"${parsed[0].q}"`);
            $('#quoteAuthor').text(`- ${parsed[0].a}`);
        })
        .catch(error => {
            console.error('Fetch error:', error);
            $('#quoteText').text('"Education is the passport to the future, for tomorrow belongs to those who prepare for it today."');
            $('#quoteAuthor').text('- Malcolm X');
        });

    // jQuery Effects: Hover styling for cards
    $('.subject-card').hover(
        function() {
            $(this).find('.subject-icon').css('transform', 'scale(1.2)');
        },
        function() {
            $(this).find('.subject-icon').css('transform', 'scale(1)');
        }
    );

    // Click handler for subjects
    let selectedSubject = '';
    $('.subject-card').click(function() {
        selectedSubject = $(this).data('subject');
        $('#modalSubjectTitle').text($(this).find('h3').text());
        $('#examModal').css('display', 'flex');
    });

    // Close modal
    $('.close-modal').click(function() {
        $('#examModal').hide();
    });

    // Handle exam type selection
    $('.exam-btn').click(function() {
        if (!selectedSubject) return;
        const examType = $(this).data('type');
        
        // Hide modal and fade out
        $('#examModal').hide();
        $('body').fadeOut(400, function() {
            window.location.href = `quiz.html?subject=${selectedSubject}&exam_type=${examType}`;
        });
    });
    // Fetch User Activity History
    $.ajax({
        url: '../backend/api/get_user_results.php',
        type: 'GET',
        data: { user_id: user.id || 1 },
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success' && response.data.length > 0) {
                const results = response.data;
                $('#totalTests').text(results.length);
                
                let sumPercentage = 0;
                let historyHtml = '<ul style="list-style:none; padding:0; margin:0;">';
                
                results.forEach(result => {
                    sumPercentage += parseFloat(result.percentage);
                    let badgeColor = result.percentage >= 40 ? 'var(--success)' : 'var(--danger)';
                    let examTypeStr = result.exam_type === 'mid_sem' ? 'Mid Sem' : 'End Sem';
                    
                    historyHtml += `
                        <li style="padding: 10px; border-bottom: 1px solid rgba(255,255,255,0.1); display: flex; justify-content: space-between; align-items: center;">
                            <div>
                                <strong style="color: var(--primary);">${result.subject}</strong> - ${examTypeStr}<br>
                                <small class="text-muted"><i class="far fa-calendar-alt"></i> ${result.date}</small>
                            </div>
                            <div style="text-align: right;">
                                <strong>Score: ${result.score}</strong><br>
                                <span style="color: ${badgeColor}; font-weight: bold;">${result.percentage}%</span>
                            </div>
                        </li>
                    `;
                });
                
                historyHtml += '</ul>';
                
                let avg = sumPercentage / results.length;
                $('#averageScore').text(avg.toFixed(1) + '%');
                $('#activityHistory').html(historyHtml);
            } else {
                $('#activityHistory').html('<p class="text-muted">No test attempts found yet. Take a test below!</p>');
            }
        },
        error: function() {
            $('#activityHistory').html('<p class="text-muted" style="color:var(--danger)">Failed to load activity history.</p>');
        }
    });
});
