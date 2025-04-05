<%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 21-02-2025
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Signup</title>
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
  </style>
</head>
<body>

<div class="container py-5">
  <h2 class="text-center mb-4">Student Signup</h2>
  <div class="card shadow-sm p-4">
    <form action="Register" method="post">
      <div class="row g-3">
        <div class="col-md-6">
          <label for="registrationNumber" class="form-label">Registration Number</label>
          <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" required>
        </div>

        <div class="col-md-6">
          <label for="name" class="form-label">Name</label>
          <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <div class="col-md-6">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" id="email" name="email" required>
        </div>

        <div class="col-md-6">
          <label for="password" class="form-label">Password</label>
          <div class="input-group">
            <input type="password" class="form-control" id="password" name="password" required>
            <button class="btn btn-outline-secondary" type="button" id="togglePassword">
              <i class="fas fa-eye" id="toggleIcon"></i>
            </button>
          </div>
        </div>

        <div class="col-md-6">
          <label for="phoneNumber" class="form-label">Phone Number</label>
          <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
        </div>

        <div class="col-md-6">
          <label for="dob" class="form-label">Date of Birth</label>
          <input type="date" class="form-control" id="dob" name="dob" required>
        </div>

        <div class="col-md-6">
          <label for="category" class="form-label">Category</label>
          <select class="form-select" id="category" name="category" onchange="updateBranches()" required>
            <option value="">Select Category</option>
            <option value="UG">Undergraduate (UG)</option>
            <option value="PG">Postgraduate (PG)</option>
            <option value="Diploma">Diploma</option>
            <option value="B.Sc">B.Sc</option>
          </select>
        </div>

        <div class="col-md-6">
          <label for="branch" class="form-label">Branch</label>
          <select class="form-select" id="branch" name="branch" required>
            <option value="">Select Branch</option>
          </select>
        </div>

        <div class="col-md-6">
          <label for="joinDate" class="form-label">Join Date</label>
          <input type="date" class="form-control" id="joinDate" name="joinDate" required>
        </div>
      </div>

      <div class="d-flex justify-content-end mt-4">
        <button type="submit" class="btn btn-primary">Register</button>
      </div>
    </form>
  </div>
</div>

<script>
  function updateBranches() {
    const category = document.getElementById('category').value;
    const branchSelect = document.getElementById('branch');
    branchSelect.innerHTML = '<option value="">Select Branch</option>';

    const branches = {
      'UG': ['CSE', 'ECE', 'Mechanical', 'Civil', 'IT'],
      'PG': ['M.Tech CSE', 'M.Tech ECE', 'MBA HR', 'MBA Finance'],
      'Diploma': ['Diploma CSE', 'Diploma Mechanical', 'Diploma Electrical'],
      'B.Sc': ['B.Sc Physics', 'B.Sc Chemistry', 'B.Sc Mathematics']
    };

    if (category && branches[category]) {
      branches[category].forEach(branch => {
        const option = document.createElement('option');
        option.value = branch;
        option.textContent = branch;
        branchSelect.appendChild(option);
      });
    }
  }

  const togglePassword = document.getElementById('togglePassword');
  const passwordField = document.getElementById('password');
  const toggleIcon = document.getElementById('toggleIcon');

  togglePassword.addEventListener('click', () => {
    const type = passwordField.type === 'password' ? 'text' : 'password';
    passwordField.type = type;
    toggleIcon.classList.toggle('fa-eye');
    toggleIcon.classList.toggle('fa-eye-slash');
  });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>