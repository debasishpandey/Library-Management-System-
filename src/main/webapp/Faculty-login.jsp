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
            <p class="text-center mt-3">
                <a href="passwordReset.jsp" id="forgotPasswordLink">Forgot Password?</a>
            </p>
        </form>
        <p class="text-center mt-3">Don't have an account? <a href="#" id="signupLink">Signup</a></p>
    </div>
</div>


<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        // Redirect to dashboard if already logged in--%>
<%--        if (localStorage.getItem('isLoggedIn') === 'true') {--%>
<%--            window.location.href = 'dashboard.html';--%>
<%--        }--%>

<%--        // Login functionality--%>
<%--        $('#loginForm').submit(function(event) {--%>
<%--            event.preventDefault();--%>
<%--            let username = $('#username').val();--%>
<%--            let password = $('#password').val();--%>

<%--            let user = JSON.parse(localStorage.getItem('user'));--%>

<%--            if (user && username === user.regd && password === user.password) {--%>
<%--                alert('Login Successful');--%>
<%--                localStorage.setItem('isLoggedIn', 'true');--%>
<%--                window.location.href = 'dashboard.html';--%>
<%--            } else {--%>
<%--                alert('Invalid Credentials');--%>
<%--            }--%>
<%--        });--%>

<%--        // Handle signup form--%>
<%--        $('#signupLink').click(function(event) {--%>
<%--            event.preventDefault();--%>
<%--            $('#formContainer').html(`--%>
<%--                    <h2>Signup</h2>--%>
<%--                    <form id="signupForm">--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="name" class="form-label">Name</label>--%>
<%--                            <input type="text" class="form-control" id="name" required>--%>
<%--                        </div>--%>
<%--                        <div class="row mb-3">--%>
<%--                            <div class="col">--%>
<%--                                <label for="regd" class="form-label">Registration No</label>--%>
<%--                                <input type="text" class="form-control" id="regd" required>--%>
<%--                            </div>--%>
<%--                            <div class="col">--%>
<%--                                <label for="mobile" class="form-label">Mobile No</label>--%>
<%--                                <input type="text" class="form-control" id="mobile" required>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="password" class="form-label">Password</label>--%>
<%--                            <input type="password" class="form-control" id="password" required>--%>
<%--                        </div>--%>
<%--                        <button type="submit" class="btn btn-primary">Signup</button>--%>
<%--                    </form>--%>
<%--                `);--%>
<%--            attachSignupHandler();--%>
<%--        });--%>

<%--        // Signup form submit handler--%>
<%--        function attachSignupHandler() {--%>
<%--            $('#signupForm').submit(function(event) {--%>
<%--                event.preventDefault();--%>
<%--                let name = $('#name').val();--%>
<%--                let regd = $('#regd').val();--%>
<%--                let mobile = $('#mobile').val();--%>
<%--                let password = $('#password').val();--%>

<%--                let user = {--%>
<%--                    name: name,--%>
<%--                    regd: regd,--%>
<%--                    mobile: mobile,--%>
<%--                    password: password--%>
<%--                };--%>

<%--                localStorage.setItem('user', JSON.stringify(user));--%>
<%--                alert(`Signup Successful!\nName: ${name}\nRegd No: ${regd}\nMobile: ${mobile}`);--%>

<%--                // After signup, show login form--%>
<%--                $('#formContainer').html(`--%>
<%--                        <h2>Login</h2>--%>
<%--                        <form id="loginForm">--%>
<%--                            <div class="mb-3">--%>
<%--                                <label for="username" class="form-label">Username</label>--%>
<%--                                <input type="text" class="form-control" id="username" required>--%>
<%--                            </div>--%>
<%--                            <div class="mb-3">--%>
<%--                                <label for="password" class="form-label">Password</label>--%>
<%--                                <input type="password" class="form-control" id="password" required>--%>
<%--                            </div>--%>
<%--                            <button type="submit" class="btn btn-primary">Login</button>--%>
<%--                        </form>--%>
<%--                    `);--%>

<%--                // Automatically proceed to login after signup--%>
<%--                $('#loginForm').submit(function(event) {--%>
<%--                    event.preventDefault();--%>
<%--                    let username = $('#username').val();--%>
<%--                    let password = $('#password').val();--%>

<%--                    if (username === regd && password === password) {--%>
<%--                        localStorage.setItem('isLoggedIn', 'true');--%>
<%--                        window.location.href = 'dashboard.html';--%>
<%--                    } else {--%>
<%--                        alert('Invalid Credentials');--%>
<%--                    }--%>
<%--                });--%>
<%--            });--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>

