<%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 16-02-2025
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./js/ServerCheck.js" defer></script>
    <style>
        body {
            background: url('library-bg.jpg') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            width: 90%;
            max-width: 1000px;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }
        .library {
            flex: 1;
            background: url('https://cdn.pixabay.com/photo/2019/01/30/08/30/book-3964050_1280.jpg') no-repeat center center/cover;
            height: 400px;
            border-radius: 10px;
        }
        .login-form {
            flex: 0.8;
            padding: 20px;
        }
        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn {
            width: 100%;
        }
        .form-group {
            margin-bottom: 15px;
        }
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }
            .library {
                display: none;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="library d-none d-md-block"></div>
    <div class="login-form" id="formContainer">
        <h2>Faculty Login</h2>
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <div class="alert alert-danger text-center"><%= error %></div>
        <% } %>
        <form id="loginForm" action="FLogin" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>

        </form>

    </div>
</div>



</body>
</html>

