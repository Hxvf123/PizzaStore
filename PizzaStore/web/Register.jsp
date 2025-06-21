<%-- 
    Document   : Register
    Created on : Mar 14, 2025
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register - PizzaStore</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            .header {
                background-color: #004aad;
                padding: 10px 20px;
            }

            .header a {
                color: white;
                margin: 0 10px;
                text-decoration: none;
            }

            .register-container {
                 margin-top: 40px;
            }

            .input-group {
                margin-left: 200px; 
                margin-bottom: 10px;
                width: 350px;
            }

            .input-group-text {
                width: 100px; 
            }
            .error { 
                margin-left: 200px; 
            }
            .success { 
                margin-left: 200px; 
            }

            .btn-register {
                margin-left: 300px; 

                font-size: 14px;
                padding: 5px 20px;
                background-color: #004aad;
                color: white;
            }


        </style>

    <div class="header d-flex justify-content-between align-items-center">
        <div>
            <a href="#">PizzaStore</a>
            <a href="#">Pizzas</a>
            <a href="#">Categories</a>
            <a href="#">Reviews</a>
        </div>
        <div>
            <a href="Register.jsp">Register</a>
            <a href="Login.jsp">Log in</a>
        </div>
    </div>
</head>

<body>

    <div class="register-container">
        <h3>Create a new account</h3>
        <p>Fill in the details below</p>
        <form action="RegisterController" method="post">
            <%-- Thông báo lỗi --%>
            <c:if test="${not empty errorMessage}">
                <div class="error">
                    ${errorMessage}
                </div>
            </c:if>
            <%-- Thông báo thành công --%>
            <c:if test="${not empty successMessage}">
                <div class="success">
                    ${successMessage}
                </div>
            </c:if>
            <div class="input-group">
                <span class="input-group-text">Username</span>
                <input type="text" name="username" class="form-control" placeholder="Enter your username" required>
            </div>
            <div class="input-group">
                <span class="input-group-text">Password</span>
                <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>
            <div class="input-group">
                <span class="input-group-text">Full Name</span>
                <input type="text" name="fullName" class="form-control" placeholder="Enter your full name" required>
            </div>
            <div class="input-group">
                <span class="input-group-text">Type</span>
                <select name="type" class="form-select" required>
                    <option value="1">Admin</option>
                    <option value="2">User</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary btn-register">Register</button>
        </form>
    </div>
</body>
</html>
