<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.util.Book" %>
<%@ page import="com.util.Student" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Student Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .student-card {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .student-card img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 50%;
            margin-right: 15px;
        }

        .student-card .student-info {
            flex-grow: 1;
        }

        .student-card .ms-auto {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .student-card .btn {
            margin-top: 5px;
        }

        .search-container {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-secondary sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="./img/logo.jpg" alt="Logo" width="40" height="40" class="me-2">
            Faculty Dashboard
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="FDashboard">Dashboard</a></li>

            </ul>
        </div>
    </div>
</nav>

<!-- Search Bar -->
<div class="container mt-4 search-container">
    <input type="text" id="searchBar" class="form-control" placeholder="Search students..." onkeyup="searchStudents()">
</div>

<!-- Student List -->
<div id="studentList" class="container">
    <c:forEach var="student" items="${sessionScope.students}">
        <div class="student-card" data-name="${fn:toLowerCase(student.name)}" data-regno="${fn:toLowerCase(student.registrationNumber)}">
            <img src="ProfilePhoto/${student.registrationNumber}.jpg" class="profile-img" onerror="this.src='img/dpf.jpg';">
            <div class="student-info">
                <h5>${student.name}</h5>
                <p class="mb-0">Reg No: ${student.registrationNumber}</p>
                <p class="mb-0">Phone: ${student.phoneNumber}</p>
                <p class="mb-0">Email: ${student.email}</p>
            </div>
            <div class="ms-auto">

                <a href="DeleteStudent?id=${student.registrationNumber}" class="btn btn-sm btn-danger">Remove</a>
            </div>
        </div>
    </c:forEach>
</div>

<footer class="bg-secondary text-white text-center py-3">
    <p>&copy; 2025 Library Management System. All rights reserved.</p>
</footer>

<script>
    // Function to search students based on name or registration number
    function searchStudents() {
        let input = document.getElementById("searchBar").value.toLowerCase();
        let students = document.querySelectorAll(".student-card");

        students.forEach(student => {
            let name = student.querySelector(".student-info h5").textContent.toLowerCase();
            let regno = student.querySelector(".student-info p").textContent.toLowerCase();
            student.style.display = name.includes(input) || regno.includes(input) ? "flex" : "none";
        });
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
