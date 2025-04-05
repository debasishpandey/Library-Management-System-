<%--
  Created by IntelliJ IDEA.
  User: debas
  Date: 22-03-2025
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 500px; margin-top: 50px; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">Cash Payment</h2>

    <form id="cashForm" action="ReturnDefaulterBookk" method="post">
        <div class="mb-3">
            <label for="cashAmount" class="form-label">Amount</label>
            <input type="number" id="cashAmount" name="cashAmount" class="form-control" value="${requestScope.fine}" readonly required>
        </div>
        <div class="mb-3">
            <label for="requestId" class="form-label">Request ID</label>
            <input type="text" id="requestId" name="requestId" value="${param.requestId}" readonly class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="ddNo" class="form-label">DD No</label>
            <input type="text" id="ddNo" name="ddNo" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Return Book</button>
    </form>
</div>
</body>
</html>
