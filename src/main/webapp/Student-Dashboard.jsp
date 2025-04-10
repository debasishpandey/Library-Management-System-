<%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 17-02-2025
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="true" errorPage="" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.util.Book" %>
<%@ page import="com.util.RequestDetails" %>
<%@ page import="com.util.Student" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Toastr CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />

    <!-- jQuery (required for toastr) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Toastr JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        /* Profile Box (Initially Hidden) */
        .profile-box {
            position: fixed;
            top: 60px;
            right: -100%; /* Fully hidden */
            width: 90%;  /* Default for smaller screens */
            max-width: 350px; /* Limit width for larger screens */
            min-width: 250px;
            z-index: 1000;
            transition: right 0.3s ease-in-out;
        }

        /* Slide In Effect */
        .profile-box.active {
            right: 10px;
        }

        /* Profile Box Styling */
        .profile-box .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            transition: 0.3s;
            background-color: #fff;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Hover Effect */
        .profile-box .card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .profile-box .card img {
            width: 90px;
            height: 90px;
            object-fit: cover;
            border-radius: 50%;
            background: white;
            padding: 5px;
        }

        /* Responsive Adjustments */
        @media (min-width: 768px) {
            .profile-box {
                width: 40%; /* Medium screens */
                right: -40%;
            }

            .profile-box.active {
                right: 10px;
            }
        }

        @media (min-width: 1024px) {
            .profile-box {
                width: 25%; /* Large screens */
                right: -30%;
            }
        }

    </style>
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>

<%String msg=(String)session.getAttribute("msg");
String type=(String)session.getAttribute("type");
%>
<script>
    <% if (msg != null && type != null) { %>
    toastr.options = {
        "closeButton": true,
        "progressBar": true,
        "positionClass": "toast-top-right"
    };
    toastr["<%= type %>"]("<%= msg %>");
    <% session.removeAttribute("msg");
    session.removeAttribute("type");} %>
</script>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-secondary sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="./img/logo.jpg" alt="Logo" width="40" height="40" class="me-2">
            Student Dashboard
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" id="profileIcon">
                        <img src="./ProfilePhoto/${sessionScope.student.registrationNumber}.jpg" alt="Profile" width="40" height="40" class="rounded-circle">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%
    Student s=(Student) session.getAttribute("student");
    System.out.println(s);
%>


<!-- Sliding Profile Box -->
<div class="profile-box" id="profileBox">
    <div class="card text-center">
        <img src="./ProfilePhoto/${sessionScope.student.registrationNumber}.jpg" alt="Profile" class="rounded-circle mb-2" width="80">
        <h5 class="mb-1">${sessionScope.student.name}</h5>
        <small class="text-muted">Registration No:${sessionScope.student.registrationNumber}</small>
        <hr>
        <p class="mb-1"><strong>Mobile:</strong> +91 ${sessionScope.student.phoneNumber}</p>
        <p class="mb-1"><strong>Email:</strong> ${sessionScope.student.email}</p>
        <form action="StudentUpdate.jsp">
            <button class="btn btn-sm btn-primary mt-2" >Update</button>
        </form>

        <button class="btn btn-sm btn-danger mt-2" data-bs-toggle="modal" data-bs-target="#logoutModal">Logout</button>
    </div>
</div>

<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <form id="logoutForm" action="logout" method="get">
                    <button type="submit" class="btn btn-danger">Logout</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%--<header class="bg-light text-center py-5 fade-in">--%>
<%--    <div class="container">--%>
<%--        <h1>Welcome, <span id="studentName"> <c:out value="${sessionScope.user}" /></span></h1> <!-- Dynamic student name -->--%>
<%--        <p class="lead">Your personal dashboard to manage books and requests.</p>--%>
<%--    </div>--%>
<%--</header>--%>
<div id="carouselExampleCaptions" class="carousel slide">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="./img/300a4be5-d1cd-4b06-b60c-36f680c4ad23.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">

            </div>
        </div>
        <div class="carousel-item">
            <img src="./img/2307-w064-n002-491B-p1-491.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">

            </div>
        </div>
        <div class="carousel-item">
            <img src="./img/ba6308de-ca55-42e3-969f-eee97d4d2c3c.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">

            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<section id="availableBooks" class="py-5 fade-in">
    <div class="container">
        <h2>Available Books</h2>
        <div class="row">
            <!-- Check if the book list is not empty -->
            <c:if test="${not empty sessionScope.allBooks}">
                <c:set var="bookCount" value="0" />

                <c:forEach var="book" items="${sessionScope.allBooks}" varStatus="status">
                    <c:if test="${status.index < 15}">
                        <c:set var="bookCount" value="${bookCount + 1}" />
                        <div class="col-md-3 col-sm-6 col-12 mb-4">
                            <div class="card shadow-sm h-100">
                                <div class="card-body">
                                    <h5 class="card-title text-primary">${book.name}</h5>
                                    <p class="card-text"><strong>Book ID:</strong> ${book.id}</p>
                                    <p class="card-text"><strong>Author:</strong> ${book.author}</p>
                                    <p class="card-text"><strong>Available:</strong> ${book.quantity} copies</p>
                                    <form action="${pageContext.request.contextPath}/RequestBook" method="post">
                                        <input type="hidden" name="bookId" value="${book.id}">
                                        <input type="hidden" name="bookName" value="${book.name}">
                                        <input type="hidden" name="sourcePage" value="${pageContext.request.requestURI}">
                                        <button type="submit" class="btn btn-outline-primary w-100">
                                            Request Book
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>

                <!-- Show View All button if more than 15 books -->
                <c:if test="${bookCount >= 15}">
                    <div class="text-center mt-4">
                        <form action="allBooks" method="get">
                            <button type="submit" class="btn btn-primary btn-lg">View All Books</button>
                        </form>
                    </div>
                </c:if>
            </c:if>
        </div>
    </div>
</section>

<section id="bookRequests" class="bg-light py-5 fade-in">
    <div class="container">
        <h2>Your Book Requests</h2>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Book Title</th>
                    <th>Date Requested</th>
                    <th>Status</th>
                    <th>Return Date</th>
                </tr>
                </thead>
                <tbody>
                <!-- Loop through book requests dynamically (replace with data from MySQL) -->
                <c:forEach var="request" items="${sessionScope.requestDetails}">
                    <tr>
                        <td>${request.bookName}</td>
                        <td>${request.date}</td>
                        <td>${request.status}
                        </td>
                        <td>${request.dueDate == null ? 'N/A' : request.dueDate}</td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
<footer class="bg-secondary text-white text-center py-3">
    <p>&copy; 2025 Library Management System. All rights reserved.</p>
</footer>

<script>
    // Toggle Profile Box (Slide In/Out from Right)
    document.getElementById('profileIcon').addEventListener('click', function (event) {
        event.preventDefault();
        document.getElementById('profileBox').classList.toggle('active');
    });

    // Hide Profile Box if clicked outside
    document.addEventListener('click', function (event) {
        let profileBox = document.getElementById('profileBox');
        let profileIcon = document.getElementById('profileIcon');
        if (!profileBox.contains(event.target) && !profileIcon.contains(event.target)) {
            profileBox.classList.remove('active');
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Student Dashboard - Library Management System</title>--%>
<%--    <!-- Bootstrap CSS -->--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>

<%--    <!-- Bootstrap Bundle with Popper -->--%>
<%--    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--    <script src="./js/ServerCheck.js" defer></script>--%>
<%--    <script src="./js/SDscripts.js" defer></script>--%>

<%--<link href="./css/SDstyle.css" rel="stylesheet">--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- Navbar -->--%>
<%--<nav class="navbar navbar-expand-lg navbar-dark bg-secondary sticky-top">--%>
<%--    <div class="container">--%>
<%--        <a class="navbar-brand d-flex align-items-center" href="#">--%>
<%--            <img src="./img/logo.png" alt="Logo" width="40" height="40" class="me-2">--%>
<%--            Student Dashboard--%>
<%--        </a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--            <ul class="navbar-nav ms-auto">--%>
<%--                <li class="nav-item"><a class="nav-link" href="#">Dashboard</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="#">Profile</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="#" id="logoutBtn">Logout</a></li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#" id="profileIcon">--%>
<%--                        <img src="./img/logo.png" alt="Profile" width="40" height="40" class="rounded-circle">--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<!-- Profile Box -->--%>
<%--<div class="profile-box" id="profileBox">--%>
<%--    <div class="card p-3 text-center">--%>
<%--        <img src="./img/logo.png" alt="Profile" class="rounded-circle mb-2" width="80">--%>
<%--        <h5 class="mb-1">John Doe</h5>--%>
<%--        <small class="text-muted">Registration No: 12345678</small>--%>
<%--        <hr>--%>
<%--        <p class="mb-1"><strong>Mobile:</strong> +91 9876543210</p>--%>
<%--        <p class="mb-1"><strong>Email:</strong> johndoe@example.com</p>--%>
<%--        <button class="btn btn-sm btn-primary mt-2">Update</button>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<!-- Sliding Profile Box -->--%>
<%--<div class="profile-box" id="profileBox">--%>
<%--    <div class="card p-3 text-center">--%>
<%--        <img src="./img/logo.png" alt="Profile" class="rounded-circle mb-2" width="70">--%>
<%--        <h5 class="mb-1">John Doe</h5>--%>
<%--        <small class="text-muted">Registration No: 12345678</small>--%>
<%--        <hr>--%>
<%--        <p class="mb-1"><strong>Mobile:</strong> +91 9876543210</p>--%>
<%--        <p class="mb-1"><strong>Email:</strong> johndoe@example.com</p>--%>
<%--        <button class="btn btn-sm btn-primary mt-2">Update</button>--%>
<%--    </div>--%>
<%--</div>--%>




<%--<!-- Logout Confirmation Modal -->--%>
<%--<div id="logoutModal" class="modal" tabindex="-1" role="dialog">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">Confirm Logout</h5>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <p>Are you sure you want to log out?</p>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-danger" id="confirmLogout">Yes</button>--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>




<%--<header class="bg-light text-center py-5 fade-in">--%>
<%--    <div class="container">--%>
<%--        <h1>Welcome, <span id="studentName"> <c:out value="${sessionScope.user}" /></span></h1> <!-- Dynamic student name -->--%>
<%--        <p class="lead">Your personal dashboard to manage books and requests.</p>--%>
<%--    </div>--%>
<%--</header>--%>

<%--<section id="availableBooks" class="py-5 fade-in">--%>
<%--    <div class="container">--%>
<%--        <h2>Available Books</h2>--%>
<%--        <div class="row">--%>
<%--            <!-- Check if the book list is not empty -->--%>
<%--            <c:if test="${not empty sessionScope.allBooks}">--%>
<%--                <c:set var="bookCount" value="0" />--%>

<%--                <c:forEach var="book" items="${sessionScope.allBooks}" varStatus="status">--%>
<%--                    <c:if test="${status.index < 15}">--%>
<%--                        <c:set var="bookCount" value="${bookCount + 1}" />--%>
<%--                        <div class="col-md-3 col-sm-6 col-12 mb-4">--%>
<%--                            <div class="card shadow-sm h-100">--%>
<%--                                <div class="card-body">--%>
<%--                                    <h5 class="card-title text-primary">${book.name}</h5>--%>
<%--                                    <p class="card-text"><strong>Book ID:</strong> ${book.id}</p>--%>
<%--                                    <p class="card-text"><strong>Author:</strong> ${book.author}</p>--%>
<%--                                    <p class="card-text"><strong>Available:</strong> ${book.quantity} copies</p>--%>
<%--                                    <form action="${pageContext.request.contextPath}/RequestBook" method="post">--%>
<%--                                        <input type="hidden" name="bookId" value="${book.id}">--%>
<%--                                        <input type="hidden" name="bookName" value="${book.name}">--%>
<%--                                        <input type="hidden" name="sourcePage" value="${pageContext.request.requestURI}">--%>
<%--                                        <button type="submit" class="btn btn-outline-primary w-100">--%>
<%--                                            Request Book--%>
<%--                                        </button>--%>
<%--                                    </form>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:if>--%>
<%--                </c:forEach>--%>

<%--                <!-- Show View All button if more than 15 books -->--%>
<%--                <c:if test="${bookCount >= 15}">--%>
<%--                    <div class="text-center mt-4">--%>
<%--                        <form action="allBooks" method="get">--%>
<%--                            <button type="submit" class="btn btn-primary btn-lg">View All Books</button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </c:if>--%>
<%--            </c:if>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>



<%--<section id="bookRequests" class="bg-light py-5 fade-in">--%>
<%--    <div class="container">--%>
<%--        <h2>Your Book Requests</h2>--%>
<%--        <div class="table-responsive">--%>
<%--            <table class="table table-bordered">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th>Book Title</th>--%>
<%--                    <th>Date Requested</th>--%>
<%--                    <th>Status</th>--%>
<%--                    <th>Return Date</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <!-- Loop through book requests dynamically (replace with data from MySQL) -->--%>
<%--                <c:forEach var="request" items="${sessionScope.requestDetails}">--%>
<%--                    <tr>--%>
<%--                        <td>${request.bookName}</td>--%>
<%--                        <td>${request.date}</td>--%>
<%--                        <td>${request.status}--%>
<%--                        </td>--%>
<%--                        <td>${request.dueDate == null ? 'N/A' : request.dueDate}</td>--%>

<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<footer class="bg-secondary text-white text-center py-3">--%>
<%--    <p>&copy; 2025 Library Management System. All rights reserved.</p>--%>
<%--</footer>--%>

<%--<%--%>
<%--boolean requested=(Boolean) request.getAttribute("requested");--%>
<%--if (requested){--%>
<%--%>--%>
<%--<script>--%>
<%--    alert("Already requested!")--%>
<%--</script>--%>
<%--<%request.setAttribute("requested",false);}%>--%>




<%--</body>--%>
<%--</html>--%>
