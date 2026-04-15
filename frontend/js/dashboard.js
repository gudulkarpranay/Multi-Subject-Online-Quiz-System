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
    $('.subject-card').click(function() {
        const subject = $(this).data('subject');
        
        // jQuery FadeOut effect before navigating
        $('body').fadeOut(400, function() {
            window.location.href = `quiz.html?subject=${subject}`;
        });
    });
});
