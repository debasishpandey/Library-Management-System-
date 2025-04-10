<%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 20-03-2025
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.util.Book" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sliding Profile Box</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <li class="nav-item"><a class="nav-link" href="SDashboard">Dashboard</a></li>
        <li class="nav-item">
          <a class="nav-link" href="#" id="profileIcon">
            <img src="./ProfilePhoto/${sessionScope.student.registrationNumber}.jpg" alt="Profile" width="40" height="40" class="rounded-circle">
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>


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
        <form id="logoutForm" action="logout" >
          <button type="submit" class="btn btn-danger">Logout</button>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="container mt-4">
  <!-- Search Bar -->
  <input type="text" id="searchBar" class="form-control mb-4" placeholder="Search books..." onkeyup="searchBooks()">

  <!-- Books Grid -->
  <div class="row" id="booksContainer">
    <c:forEach var="book" items="${sessionScope.allBooks}">
      <div class="col-md-4 book-card">
        <div class="card mb-4 shadow-sm p-3">
          <div class="card-body d-flex flex-column">
            <h5 class="card-title">${book.name}</h5>
            <p class="card-text"><strong>Book Id:</strong> ${book.id}</p>
            <p class="card-text"><strong>Author:</strong> ${book.author}</p>
            <p class="card-text"><strong>Quantity:</strong> ${book.quantity}</p>

            <!-- Form for Requesting a Book -->
            <%
              boolean isStudent=(boolean)session.getAttribute("isStudent");
              if (isStudent){
            %><form action="RequestBook" method="post" class="mt-auto d-flex justify-content-end">
            <input type="hidden" name="bookId" value="${book.id}">
            <input type="hidden" name="bookName" value="${book.name}">
            <button type="submit" class="btn btn-primary">Request Book</button>
          </form>
            <%}%>
          </div>
        </div>
      </div>


    </c:forEach>
  </div>
</div>
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

  function searchBooks() {
    let input = document.getElementById("searchBar").value.toLowerCase();
    let books = document.querySelectorAll(".book-card");

    books.forEach(book => {
      let title = book.querySelector(".card-title").textContent.toLowerCase();
      book.style.order = title.includes(input) ? "-1" : "0";
      book.style.display = title.includes(input) ? "block" : "none";
    });
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>