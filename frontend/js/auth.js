$(document).ready(function() {
    // jQuery Effect: Toggle between Login and Register with Slide/Fade
    $('#showRegister').click(function(e) {
        e.preventDefault();
        $('#loginFormContainer').slideUp(300, function() {
            $('#registerFormContainer').removeClass('hidden').hide().fadeIn(400);
        });
    });

    $('#showLogin').click(function(e) {
        e.preventDefault();
        $('#registerFormContainer').slideUp(300, function() {
            $('#loginFormContainer').hide().removeClass('hidden').fadeIn(400);
        });
    });

    // Form Validation (Vanilla JS + Event Handling)
    const validateEmail = (email) => {
        return email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/);
    };

    // Login Form Submit Handling
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();
        let isValid = true;
        const email = document.getElementById('loginEmail').value;
        const pass = document.getElementById('loginPassword').value;

        // Reset errors
        $('.error-msg').hide();
        $('input').removeClass('input-error');

        if (!validateEmail(email)) {
            $('#loginEmailErr').show();
            $('#loginEmail').addClass('input-error');
            isValid = false;
        }

        if (pass.trim() === '') {
            $('#loginPassErr').show();
            $('#loginPassword').addClass('input-error');
            isValid = false;
        }

        if (isValid) {
            // Mocking AJAX login request for frontend demonstration
            // Let's use jQuery AJAX here
            const btn = $(this).find('button');
            const originalText = btn.html();
            btn.html('<i class="fas fa-spinner fa-spin"></i> Logging in...');
            
            setTimeout(() => {
                // Successful mock login
                localStorage.setItem('user', JSON.stringify({ name: email.split('@')[0], email: email, role: 'student' }));
                window.location.href = 'dashboard.html';
            }, 1000);
        }
    });

    // Register Form Submit Handling
    document.getElementById('registerForm').addEventListener('submit', function(e) {
        e.preventDefault();
        let isValid = true;
        
        const name = document.getElementById('regName').value;
        const email = document.getElementById('regEmail').value;
        const pass = document.getElementById('regPassword').value;

        // Reset errors
        $('.error-msg').hide();
        $('input').removeClass('input-error');

        if (name.trim().length < 3) {
            $('#regNameErr').show();
            $('#regName').addClass('input-error');
            isValid = false;
        }

        if (!validateEmail(email)) {
            $('#regEmailErr').show();
            $('#regEmail').addClass('input-error');
            isValid = false;
        }

        if (pass.length < 6) {
            $('#regPassErr').show();
            $('#regPassword').addClass('input-error');
            isValid = false;
        }

        if (isValid) {
            const btn = $(this).find('button');
            btn.html('<i class="fas fa-spinner fa-spin"></i> Registering...');
            
            setTimeout(() => {
                alert('Registration successful! Please login.');
                btn.html('Register <i class="fas fa-user-plus"></i>');
                $('#showLogin').click();
            }, 1000);
        }
    });
});
