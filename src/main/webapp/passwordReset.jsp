<%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 17-02-2025
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Email OTP Form</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles.css">
  <script src="./js/ServerCheck.js" defer></script>
  <script>
    function validateEmail() {
      const emailInput = document.getElementById("email").value;
      const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

      if (emailRegex.test(emailInput)) {
        alert("Valid email format! OTP is being sent...");
        document.getElementById("otpSection").style.display = 'block';
      } else {
        alert("Invalid email format. Please enter a valid email address.");
      }
    }
  </script>
</head>

<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
  <div class="card shadow-lg p-4" style="max-width: 500px; width: 100%;">
    <h2 class="text-center mb-4">Email OTP Verification</h2>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="alert alert-danger text-center"><%= error %></div>
    <% } %>
    <form id="otpForm" action="Send" method="post">
      <div class="mb-3">
        <label for="registrationNo" class="form-label">Enter your Registration No:</label>
        <input type="text" id="registrationNo" name="registrationNo" class="form-control" required>
      </div>
      <button type="submit" class="btn btn-primary w-100" >Send OTP</button>
    </form>
    <% Boolean isOtpValid = (Boolean) session.getAttribute("bool"); %>
    <% if (isOtpValid != null && isOtpValid) { %>
    <div id="otpSection" class="mt-4">
      <form action="valid-otp" method="post">
        <div class="mb-3">
          <label for="otp" class="form-label">Enter OTP:</label>
          <input type="text" id="otp" name="otp" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success w-100">Validate OTP</button>
      </form>
    </div>
    <% } %>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
