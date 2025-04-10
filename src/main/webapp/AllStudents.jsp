<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 28-03-2025
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


    <style>
        body {
            background: url('./img/300a4be5-d1cd-4b06-b60c-36f680c4ad23.jpg') no-repeat center center/cover;
            font-family: 'Arial', sans-serif;
        }
        .container {
            position: relative;
            max-width: 900px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.9);
        }
        .btn-primary, .btn-danger {
            border: none;
        }
        .search-bar {
            margin-bottom: 20px;
        }
        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 10px;
            object-fit: cover;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <h2 class="text-center mb-4">Student Details</h2>

    <input type="text" class="form-control search-bar" id="searchBar" placeholder="Search by Name or Registration Number" onkeyup="filterStudents()">



    <div id="studentList">
        <c:forEach var="student" items="${sessionScope.students}">
            <div class="card mb-3 p-3 d-flex flex-row align-items-center justify-content-between student-card"
                 data-name="${student.name.toLowerCase()}"
                 data-regno="${student.registrationNumber}">
                <div class="d-flex align-items-center">
                    <img src="./ProfilePhoto/${student.registrationNumber}.jpg" class="profile-pic me-3" onerror="this.onerror=null; this.src='./img/dpf.jpg';" alt="Image">
                    <div>
                        <h5>${student.name}</h5>
                        <p>Reg No: ${student.registrationNumber}</p>
                        <p>Mobile: ${student.phoneNumber}</p>
                        <p>Email: ${student.email}</p>
                    </div>
                </div>
                <div>
                    <button class="btn btn-primary" onclick="updateStudent('${student.registrationNumber}')">Update</button>
                    <button class="btn btn-danger" onclick="confirmRemove('${student.registrationNumber}')" data-bs-toggle="modal" data-bs-target="#confirmModal">Remove</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Modal for Delete Confirmation -->
<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm Deletion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to remove this student?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmDelete">Remove</button>
            </div>
        </div>
    </div>
</div>

<script>
    function filterStudents() {
        let query = document.getElementById('searchBar').value.trim().toLowerCase();
        let studentCards = document.querySelectorAll('.student-card');

        studentCards.forEach(card => {
            let name = card.getAttribute('data-name')?.toLowerCase() || '';
            let regNo = card.getAttribute('data-regno') || '';

            if (name.includes(query) || regNo.includes(query)) {
                card.style.display = 'flex';
            } else {
                card.style.display = 'none';
            }
        });
    }

    function confirmRemove(id) {
        document.getElementById('confirmDelete').onclick = function () {
            window.location.href = 'DeleteStudent?id=' + id;
        };
    }

    function updateStudent(id) {
        window.location.href = 'UpdateStudent?id=' + id;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
