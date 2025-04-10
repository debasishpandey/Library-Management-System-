<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.util.RequestDetails" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .search-container {
            margin-bottom: 20px;
        }

        /* Responsive design for smaller screens */
        @media (max-width: 768px) {
            table th, table td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-secondary sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="./img/logo.jpg" alt="Logo" width="40" height="40" class="me-2">
            Request Details
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
    <input type="text" id="searchBar" class="form-control" placeholder="Search by Student Name, Reg No, Request ID or Book ID..." onkeyup="searchRequests()">
</div>

<!-- Request List Table -->
<div class="container">
    <table id="requestTable">
        <thead>
        <tr>
            <th>Request ID</th>
            <th>Student Name</th>
            <th>Reg No</th>

            <th>Book ID</th>
            <th>Book Name</th>
            <th>Request Date</th>
            <th>Status</th>
            <th>Due Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="request" items="${sessionScope.allDetails}">
            <tr class="request-row"
                data-studentname="${fn:toLowerCase(request.studentName)}"
                data-regno="${fn:toLowerCase(request.registrationNo)}"
                data-requestid="${fn:toLowerCase(request.id)}"
                data-bookid="${fn:toLowerCase(request.bookId)}">
                <td>${request.id}</td>
                <td>${request.studentName}</td>
                <td>${request.registrationNo}</td>
                <td>${request.bookId}</td>
                <td>${request.bookName}</td>
                <td>${request.date}</td>
                <td>${request.status}</td>
                <td>${request.dueDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<footer class="bg-secondary text-white text-center py-3">
    <p>&copy; 2025 Library Management System. All rights reserved.</p>
</footer>

<script>
    // Function to search requests based on student name, registration number, request ID, or book ID
    function searchRequests() {
        let input = document.getElementById("searchBar").value.toLowerCase();
        let rows = document.querySelectorAll(".request-row");

        rows.forEach(row => {
            let studentName = row.getAttribute("data-studentname");
            let regNo = row.getAttribute("data-regno");
            let requestId = row.getAttribute("data-requestid");
            let bookId = row.getAttribute("data-bookid");

            // Show or hide row based on search input
            if (studentName.includes(input) || regNo.includes(input) || requestId.includes(input) || bookId.includes(input)) {
                row.style.display = "table-row";
            } else {
                row.style.display = "none";
            }
        });

        // Re-order rows to bring matching ones to the top
        let table = document.getElementById("requestTable");
        let rowsArray = Array.from(rows);
        rowsArray.sort((rowA, rowB) => {
            let searchString = input.toLowerCase();
            let rowAData = rowA.getAttribute("data-studentname") + rowA.getAttribute("data-regno") + rowA.getAttribute("data-requestid") + rowA.getAttribute("data-bookid");
            let rowBData = rowB.getAttribute("data-studentname") + rowB.getAttribute("data-regno") + rowB.getAttribute("data-requestid") + rowB.getAttribute("data-bookid");

            if (rowAData.includes(searchString) && !rowBData.includes(searchString)) {
                return -1;
            } else if (!rowAData.includes(searchString) && rowBData.includes(searchString)) {
                return 1;
            } else {
                return 0;
            }
        });

        // Re-attach sorted rows to table
        rowsArray.forEach(row => table.querySelector("tbody").appendChild(row));
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
