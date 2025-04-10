
<%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 17-02-2025
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.util.Book" %>
<%@ page import="com.util.RequestDetails" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Faculty Dashboard - Library Management System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./css/FDashboardstyle.css">
  <!-- Toastr CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />

  <!-- jQuery (required for toastr) -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- Toastr JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

  <script src="./js/ServerCheck.js" defer></script>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-secondary fade-in sticky-top">
  <div class="container">
    <a class="navbar-brand" href="#">
      <img src="./img/logo.jpg1" alt="Logo" width="40" height="40" class="d-inline-block align-top me-2">

      Faculty Dashboard
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="#">Dashboard</a></li>
        <li class="nav-item"><a class="nav-link" href="#manageBooks">Manage Books</a></li>
        <li class="nav-item"><a class="nav-link" href="#bookRequests">View Request</a></li>
        <li class="nav-item"><a class="nav-link" href="#returnBook">Return Book</a></li>
        <li class="nav-item"><a class="nav-link" href="#bookList">Book List</a></li>
        <li class="nav-item"><a class="nav-link" href="#List">Student List</a></li>
        <li class="nav-item"><a class="nav-link" href="#studentBooks">Request Details</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Profile
          </a>
          <ul class="dropdown-menu" aria-labelledby="profileDropdown">
            <li><a class="dropdown-item" href="#">Profile Settings</a></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </li>
        <li class="nav-item d-flex align-items-center">
          <span class="me-2">Dark Mode</span>
          <div class="form-check form-switch">
            <input class="form-check-input" type="checkbox" id="darkModeToggle">
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div id="carouselExampleDark" class="carousel carousel-dark slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="./img/2307-w064-n002-491B-p1-491.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5 >First slide label</h5>
        <p >Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="./img/300a4be5-d1cd-4b06-b60c-36f680c4ad23.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="./img/ba6308de-ca55-42e3-969f-eee97d4d2c3c.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


<section id="bookRequests" class="py-5 fade-in">
  <div class="container">
    <h2>Book Requests</h2>
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Request Id</th>
          <th>Registration No</th>
          <th>Student Name</th>
          <th>Book Title</th>
          <th>Date Requested</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
          <c:when test="${not empty sessionScope.allRequest}">
            <c:forEach var="request" items="${sessionScope.allRequest}">
              <tr>
                <td>${request.id}</td>
                <td>${request.registrationNo}</td>
                <td>${request.studentName}</td>
                <td>${request.bookName}</td>
                <td>${request.date}</td>
                <td>
                      <span class="badge ${request.status == 'Approved' ? 'bg-success' : 'bg-warning'}">
                          ${request.status}
                      </span>
                </td>
                <td>
                  <form id="approveForm-${request.id}" action="Approve" method="post" class="d-inline">
                    <input type="hidden" name="bookId" value="${request.bookId}">
                    <input type="hidden" name="requestId" value="${request.id}">
                    <input type="hidden" id="dueDate-${request.id}" name="dueDate">
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="setCurrentRequest('${request.id}')">Approve</button>
                  </form>
                  <form action="Reject" method="post" class="d-inline">
                    <input type="hidden" name="requestId" value="${request.id}">
                    <button type="submit" class="btn btn-danger">Reject</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td colspan="5" class="text-center">No book requests found.</td>
            </tr>
          </c:otherwise>
        </c:choose>
        </tbody>
      </table>
    </div>
  </div>
</section>


<section id="returnBook" class="py-5 fade-in">
  <div class="container">
    <h2>Return Book</h2>
    <input type="text" id="searchReturnInput" class="form-control mb-3" placeholder="Search by student name...">
    <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
      <table class="table table-bordered" id="returnBookTable">
        <thead>
        <tr>
          <th>Request Id</th>
          <th>Registration No</th>
          <th>Student Name</th>
          <th>Book Title</th>
          <th>Date Issued</th>
          <th>Due Date</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
          <c:when test="${not empty sessionScope.allIssued}">
            <c:forEach var="returnb" items="${sessionScope.allIssued}">
              <tr>
                <td>${returnb.id}</td>
                <td>${returnb.registrationNo}</td>
                <td>${returnb.studentName}</td>
                <td>${returnb.bookName}</td>
                <td>${returnb.date}</td>
                <td>${returnb.dueDate}</td>
                <td>
                  <form action="${pageContext.request.contextPath}/ReturnBook" method="post" class="d-inline">
                    <input type="hidden" name="bookId" value="${returnb.bookName}">
                    <input type="hidden" name="requestId" value="${returnb.id}">
                    <button type="submit" class="btn btn-primary">
                      <i class="fa fa-undo me-2"></i> Return
                    </button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td colspan="5" class="text-center">No books to return.</td>
            </tr>
          </c:otherwise>
        </c:choose>
        </tbody>
      </table>
    </div>
  </div>
</section>


<section id="returnDefaulterBook" class="py-5 fade-in">
  <div class="container">
    <h2>Return Defaulter Book</h2>
    <input type="text" id="searchDefaulterInput" class="form-control mb-3" placeholder="Search by student name...">
    <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
      <table class="table table-bordered" id="defaulterBookTable">
        <thead>
        <tr>
          <th>Request Id</th>
          <th>Registration No</th>
          <th>Student Name</th>
          <th>Book Title</th>
          <th>Date Issued</th>
          <th>Due Date</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
          <c:when test="${not empty sessionScope.allDefaulter}">
            <c:forEach var="defaulter" items="${sessionScope.allDefaulter}">
              <tr>
                <td>${defaulter.id}</td>
                <td>${defaulter.registrationNo}</td>
                <td>${defaulter.studentName}</td>
                <td>${defaulter.bookName}</td>
                <td>${defaulter.date}</td>
                <td>${defaulter.dueDate}</td>
                <td>
                  <form action="ReturnDefaulter" method="post" class="d-inline">
                    <input type="hidden" name="bookId" value="${defaulter.bookId}">
                    <input type="hidden" name="requestId" value="${defaulter.id}">
                    <input type="hidden" name="registrationNo" value="${defaulter.registrationNo}">
                    <button type="submit" class="btn btn-danger">
                      <i class="fa fa-undo me-2"></i>Pay Fine & Return
                    </button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td colspan="7" class="text-center">No defaulter books to return.</td>
            </tr>
          </c:otherwise>
        </c:choose>
        </tbody>
      </table>
    </div>
  </div>
</section>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h1 class="modal-title fs-5" id="exampleModalLabel">
          <i class="fa fa-calendar-check me-2"></i>Select Return Date
        </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-4">
        <div class="container">
          <form>
            <div class="form-group mb-4">
              <label for="datepicker" class="form-label fw-bold">Choose Date:</label>
              <div class="input-group">
                <input type="date" class="form-control" id="datepicker" name="dueDate" placeholder="DD-MM-YYYY">
                <span class="input-group-text">
                  <i class="fa fa-calendar"></i>
                </span>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="modal-footer d-flex justify-content-between">
        <button class="btn btn-success" onclick="submitFormWithDate()">
          <i class="fa fa-check-circle me-2"></i> Issue
        </button>
        <button class="btn btn-outline-secondary" data-bs-dismiss="modal">
          <i class="fa fa-times-circle me-2"></i> Cancel
        </button>
      </div>
    </div>
  </div>
</div>


<section id="manageBooks" class="bg-light py-5 fade-in">
  <div class="container">
    <h2>Manage Books</h2>
    <div class="row">
      <div class="col-md-6">
        <!-- Add Book Form -->
        <div class="card">
          <div class="card-header">
            <h5 class="card-title">Add New Book</h5>
          </div>
          <div class="card-body">
            <form action="addBookServlet" method="post">
              <div class="mb-3">
                <label for="bookTitle" class="form-label">Book Title</label>
                <input type="text" class="form-control" id="bookTitle" name="bookTitle" required>
              </div>
              <div class="mb-3">
                <label for="bookAuthor" class="form-label">Author</label>
                <input type="text" class="form-control" id="bookAuthor" name="bookAuthor" required>
              </div>
              <div class="mb-3">
                <label for="bookCopies" class="form-label">Number of Copies</label>
                <input type="number" class="form-control" id="bookCopies" name="bookCopies" required>
              </div>
              <button type="submit" class="btn btn-primary">Add Book</button>
            </form>
          </div>
        </div>
      </div>

      <div class="col-md-6">
        <!-- Remove Book Form -->
        <div class="card">
          <div class="card-header">
            <h5 class="card-title">Remove Book</h5>
          </div>
          <div class="card-body">
            <form action="removeBookServlet" method="post">
              <div class="mb-3">
                <label for="bookName" class="form-label">Select Book</label>
                <select class="form-control" id="bookName" name="bookId" required>
                  <!-- Loop through the books to populate options -->
                  <option value="notSelected">select</option>
                  <c:forEach var="book" items="${sessionScope.allBooks}">
                    <option value="${book.id}">${book.name} by ${book.author}</option>
                  </c:forEach>
                </select>
              </div>
              <button type="submit" class="btn btn-danger">Remove Book</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<section id="updateQuantity" class="py-5 fade-in">
  <div class="container">
    <h2>Update Book Quantity</h2>
    <div class="card">
      <div class="card-header">
        <h5 class="card-title">Update Book Quantity</h5>
      </div>
      <div class="card-body">
        <form action="updateQuantity" method="post">
          <div class="mb-3">
            <label for="bookName" class="form-label">Select Book</label>
            <select class="form-control" id="bookNameUpdate" name="bookId" required>
              <option value="notSelected">select</option>
              <c:forEach var="book" items="${sessionScope.allBooks}">

                <option value="${book.id}">${book.name} by ${book.author}</option>
              </c:forEach>
            </select>
          </div>
          <div class="mb-3">
            <label for="updateQuantity" class="form-label">New Quantity</label>
            <input type="number" class="form-control" id="updateQuantity1" name="quantity" min="0" required>
          </div>
          <button type="submit" class="btn btn-warning">Update Quantity</button>
        </form>
      </div>
    </div>
  </div>
</section>


<section id="bookList" class="py-5 fade-in">
  <div class="container">
    <h2>All Books</h2>
    <input type="text" id="searchBar" class="form-control mb-3" placeholder="Search for books...">
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Book Id</th>
          <th>Book Title</th>
          <th>Author</th>
          <th>Available Copies</th>
        </tr>
        </thead>
        <tbody id="bookTable">
        <c:forEach var="book" items="${sessionScope.allBooks}" varStatus="status">
          <tr class="book-row ${status.index >= 10 ? 'd-none' : ''}">
            <td>${book.id}</td>
            <td>${book.name}</td>
            <td>${book.author}</td>
            <td>${book.quantity}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <button id="showAllBtn" class="btn btn-primary mt-3 d-none" onclick="showAllBooks()">Show All Books</button>
  </div>
</section>





<section id="studentBooks" class="py-5 fade-in">
  <div class="container">
    <h2>All Students' Book Details</h2>
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Request Id</th>
          <th>Registration No</th>
          <th>Student Name</th>
          <th>Book Title</th>
          <th>Date Issued</th>
          <th>Status</th>
          <th>Return Date</th>
        </tr>
        </thead>
        <tbody>
        <!-- Loop through student book details dynamically (replace with data from MySQL) -->
        <c:forEach var="studentBook" items="${sessionScope.allDetails}">
          <tr>
            <td>${studentBook.id}</td>
            <td>${studentBook.registrationNo}</td>
            <td>${studentBook.studentName}</td>
            <td>${studentBook.bookName}</td>
            <td>${studentBook.date}</td>
            <td>${studentBook.status}</td>
            <td>${studentBook.dueDate != null ? studentBook.dueDate : '--'}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</section>

<a href="AllStudents.jsp">all student</a>
<footer class="bg-secondary text-white text-center py-3">
  <p>&copy; 2025 Library Management System. All rights reserved.</p>
</footer>

<%
  String msg = (String) request.getAttribute("message");
  if (msg!=null){
%>
<script>
  alert("${requestScope.message}")
</script>
<%
  }
request.setAttribute("message",null);
%>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script src="./js/FDscripts.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


