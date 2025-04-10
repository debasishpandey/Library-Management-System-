<%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 25-02-2025
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Password</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles.css">
  <script src="./js/ServerCheck.js" defer></script>
  <script>
    function validatePassword() {
      const newPassword = document.getElementById("newPassword").value;
      const confirmPassword = document.getElementById("confirmPassword").value;

      if (newPassword === confirmPassword) {
        alert("Passwords match! Submitting form...");
        document.getElementById("resetPasswordForm").submit();
      } else {
        alert("Passwords do not match. Please try again.");
      }
    }
  </script>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
  <div class="card shadow-lg p-4" style="max-width: 500px; width: 100%;">
    <h2 class="text-center mb-4">Reset Password</h2>
    <form id="resetPasswordForm" action="reset" method="post">
      <div class="mb-3">
        <input type="hidden" value="${requestScope.registrationNo}" name="registrationNo">
        <label for="newPassword" class="form-label">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="confirmPassword" class="form-label">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
      </div>
      <button type="button" class="btn btn-primary w-100" onclick="validatePassword()">Change Password</button>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
