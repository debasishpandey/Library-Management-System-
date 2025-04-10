

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body.dark-mode {
            background-color: #121212;
            color: #ffffff;
            transition: background-color 0.5s, color 0.5s;
        }
        .dark-mode .bg-light {
            background-color: #1e1e1e !important;
            transition: background-color 0.5s;
        }
        .dark-mode .bg-primary {
            background-color: #333 !important;
        }
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 1s forwards;
        }
        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .role-buttons {
            display: none;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-secondary  fade-in sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.html">Library Management System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                <li class="nav-item d-flex align-items-center">
                    <span class="me-2 ">Dark Mode</span>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="darkModeToggle">
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<header class="bg-light text-center py-5 fade-in">
    <div class="container">
        <h1>Welcome to the Library Management System</h1>
        <p class="lead">Efficiently manage books, patrons, and lending activities.</p>
        <a href="javascript:void(0)" class="btn btn-secondary btn-lg" id="getStartedBtn">Get Started</a>
        <div class="role-buttons" id="roleButtons">
            <a href="SLogin" class="btn btn-primary btn-lg mx-2">Student</a>
            <a href="FLogin" class="btn btn-success btn-lg mx-2">Faculty</a>
        </div>
    </div>
</header>

<div id="carouselExample" class="carousel slide fade-in" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://cdn.pixabay.com/photo/2016/03/26/22/21/books-1281581_1280.jpg" class="d-block w-100" alt="Library">
        </div>
        <div class="carousel-item">
            <img src="https://cdn.pixabay.com/photo/2016/03/26/22/21/books-1281581_1280.jpg" class="d-block w-100" alt="Books">
        </div>
        <div class="carousel-item">
            <img src="https://cdn.pixabay.com/photo/2016/03/26/22/21/books-1281581_1280.jpg" class="d-block w-100" alt="Reading">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<section id="about" class="py-5 fade-in">
    <div class="container text-center">
        <h2>About Our System</h2>
        <p>Our Library Management System helps librarians and users efficiently manage books, records, and lending processes.</p>
    </div>
</section>

<section id="features" class="bg-light py-5 fade-in">
    <div class="container text-center">
        <h2>Key Features</h2>
        <ul class="list-unstyled">
            <li>📚 Manage Books and Patrons</li>
            <li>🔍 Advanced Search and Filtering</li>
            <li>📊 Analytics and Reports</li>
            <li>🔔 Notifications and Alerts</li>
        </ul>
    </div>
</section>

<section id="contact" class="py-5 fade-in">
    <div class="container text-center">
        <h2>Contact Us</h2>
        <p>Email: support@librarysystem.com</p>
        <p>Phone: +123 456 7890</p>
    </div>
</section>

<footer class="bg-secondary bg-gradient text-white text-center py-3 fade-in">
    <p>&copy; 2025 Library Management System. All rights reserved.</p>
</footer>

<script>
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

        // Show Student and Faculty buttons when "Get Started" is clicked
        const getStartedBtn = document.getElementById('getStartedBtn');
        const roleButtons = document.getElementById('roleButtons');

        getStartedBtn.addEventListener('click', function() {
            roleButtons.style.display = 'block';
        });
    });
</script>
<script src="./js/ServerCheck.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
