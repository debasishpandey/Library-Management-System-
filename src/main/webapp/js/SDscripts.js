// Toggle Profile Box (Slide In/Out from Right)
document.getElementById('profileIcon').addEventListener('click', function (event) {
    event.preventDefault();
    document.getElementById('profileBox').classList.toggle('active');
});

// Dark Mode Toggle
document.getElementById('darkModeToggle').addEventListener('change', function () {
    document.body.classList.toggle('dark-mode');
});

// Hide Profile Box if clicked outside
document.addEventListener('click', function (event) {
    let profileBox = document.getElementById('profileBox');
    let profileIcon = document.getElementById('profileIcon');
    if (!profileBox.contains(event.target) && !profileIcon.contains(event.target)) {
        profileBox.classList.remove('active');
    }
});

document.addEventListener('DOMContentLoaded', function() {
    const toggle = document.getElementById('darkModeToggle');
    if (localStorage.getItem('darkMode') === 'enabled') {
        document.body.classList.add('dark-mode');
        toggle.checked = true;
    }
    toggle.addEventListener('change', function() {
        document.body.classList.toggle('dark-mode');
        localStorage.setItem('darkMode', document.body.classList.contains('dark-mode') ? 'enabled' : 'disabled');
    });
});


document.getElementById('logoutBtn').addEventListener('click', function() {
    var modal = new bootstrap.Modal(document.getElementById('logoutModal'));
    modal.show();
});

document.getElementById('confirmLogout').addEventListener('click', function() {
    window.location.href = 'StudentLogin.jsp';
});

// Toggle Profile Box (Slide In/Out from Right)
document.getElementById('profileIcon').addEventListener('click', function (event) {
    event.preventDefault();
    document.getElementById('profileBox').classList.toggle('active');
});

// Dark Mode Toggle
document.getElementById('darkModeToggle').addEventListener('change', function () {
    document.body.classList.toggle('dark-mode');
});

// Hide Profile Box if clicked outside
document.addEventListener('click', function (event) {
    let profileBox = document.getElementById('profileBox');
    let profileIcon = document.getElementById('profileIcon');
    if (!profileBox.contains(event.target) && !profileIcon.contains(event.target)) {
        profileBox.classList.remove('active');
    }
});