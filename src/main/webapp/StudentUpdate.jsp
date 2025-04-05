<%@ page import="com.util.Student" %><%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 28-03-2025
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Details Update</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script defer src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <script src="./js/ServerCheck.js" defer></script>
  <style>
    body {
      background: url('./img/300a4be5-d1cd-4b06-b60c-36f680c4ad23.jpg') no-repeat center center/cover;
      position: relative;
      font-family: 'Arial', sans-serif;
    }
    body::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
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
    .btn-primary {
      background: #6C63FF;
      border: none;
    }
    .btn-primary:hover {
      background: #5A54E0;
    }
    h2 {
      color: #fff;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }
    #profilePreview {
      width: 150px;
      height: 150px;
      border-radius: 10px;
      object-fit: cover;
      display: none;
      margin-top: 10px;
    }
    .photo-info {
      font-size: 0.9rem;
      color: #555;
    }
    .error-message {
      color: red;
      font-size: 0.9rem;
      margin-top: 5px;
    }
  </style>
</head>
<body>

<div class="container py-5">
  <h2 class="text-center mb-4">Student Details Update</h2>
  <div class="card shadow-sm p-4">
    <form action="updateStudent" method="post" enctype="multipart/form-data">
      <div class="row g-3">
        <div class="col-md-6">
          <label for="registrationNumber" class="form-label">Registration Number</label>
          <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" value="${sessionScope.student.registrationNumber}" readonly>
        </div>
        <div class="col-md-6">
          <label for="name" class="form-label">Name</label>
          <input type="text" class="form-control" id="name" name="name" value="${sessionScope.student.name}" readonly>
        </div>
<%
  Student s=(Student) session.getAttribute("student");
  System.out.println(s);
%>





        <div class="col-md-6">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" id="email" name="email" value="${sessionScope.student.email}" required >
        </div>



        <div class="col-md-6">
          <label for="phoneNumber" class="form-label">Phone Number</label>
          <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${sessionScope.student.phoneNumber}" required
        </div>



        <div class="col-md-6">
          <label for="dob" class="form-label">Date of Birth</label>
          <input type="date" class="form-control" id="dob" name="dob" value="${sessionScope.student.dob}" required>
        </div>
      </div>

      <div class="col-md-6">
        <label for="profilePicture" class="form-label">Profile Picture</label>
        <input type="file" class="form-control" id="profilePicture" name="profilePicture" accept="image/*" onchange="validateImage(event)">
        <p class="photo-info">Image should be 1:1 ratio and under 500 KB</p>
        <img id="profilePreview" src="#" alt="Profile Preview">
        <p id="imageError" class="error-message"></p>
      </div>

      <div class="d-flex justify-content-end mt-4">
        <button type="submit" class="btn btn-primary">Update</button>
      </div>
    </form>
  </div>
</div>

<script>
  function validateImage(event) {
    const file = event.target.files[0];
    const imageError = document.getElementById('imageError');
    const profilePreview = document.getElementById('profilePreview');

    if (!file) return;

    if (file.size > 500 * 1024) {
      imageError.textContent = "File size should be under 500 KB";
      event.target.value = "";
      profilePreview.style.display = 'none';
      return;
    }

    const img = new Image();
    img.onload = function() {
      if (img.width !== img.height) {
        imageError.textContent = "Image must have a 1:1 ratio";
        event.target.value = "";
        profilePreview.style.display = 'none';
      } else {
        imageError.textContent = "";
        profilePreview.src = URL.createObjectURL(file);
        profilePreview.style.display = 'block';
      }
    };
    img.src = URL.createObjectURL(file);
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
